local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Marketplace = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local Run = game:GetService("RunService")

local AvatarEditor = ReplicatedStorage.AvatarEditor
local Settings = require(AvatarEditor.Shared.Settings)
local Promise = require(AvatarEditor.Shared.Util.Promise)

local filterUsers = Settings.FILTER_USERS

local module = {}


local function makeIsInGroup(groupId, requiredRank)
	assert(typeof(requiredRank) == "nil" or typeof(requiredRank) == "number", "requiredRank must be a number or nil")
	
	return function(player)
		assert(player:IsA("Player"), "inInGroup needs to be a Player")
		
		return Promise.new(function(resolve, reject)
			local success, result = pcall(function()
				if requiredRank then
					return player:GetRankInGroup(groupId) > requiredRank
				else
					return player:IsInGroup(groupId)
				end
			end)
			if success then
				resolve(result)
			else
				reject(result)
			end
		end):catch(warn)
	end
end

if Settings.ALLOWED_USERS.Groups then
	for i, group in ipairs(Settings.ALLOWED_USERS.Groups) do
		group.IsInGroup = makeIsInGroup(group.GroupId, group.Rank)
	end
end


local function makeUserOwnsGamepass(gamePassId)
	assert(typeof(gamePassId) == "number", "requiredRank must be a number or nil")
	
	return function(player)
		assert(player:IsA("Player"), "inInGroup needs to be a Player")
		
		return Promise.new(function(resolve, reject)
			local success, result = pcall(function()
				return Marketplace:UserOwnsGamePassAsync(player.UserId, gamePassId)
			end)
			if success then
				resolve(result)
			else
				reject(result)
			end
		end):catch(warn)
	end
end

if Settings.ALLOWED_USERS.GamePasses then
	for i, gamepass in ipairs(Settings.ALLOWED_USERS.GamePasses) do
		gamepass.UserOwnsGamePass = makeUserOwnsGamepass(gamepass.GamePassId)
		gamepass.Owners = {}
	end
end


local function promptGamePassPurchaseFinished(player, gamePassId, wasPurchased) print(wasPurchased)
	if not wasPurchased then
		return
	end
	if Settings.ALLOWED_USERS.GamePasses then
		for i, gamepass in ipairs(Settings.ALLOWED_USERS.GamePasses) do
			if gamepass.GamePassId == gamePassId then print("caching")
				if Run:IsClient() and Players.LocalPlayer == player then
					table.insert(gamepass.Owners, Players.LocalPlayer)
				else
					table.insert(gamepass.Owners, player)
				end
				break
			end
		end
	end
end

Marketplace.PromptGamePassPurchaseFinished:Connect(promptGamePassPurchaseFinished)


local function playerRemoving(player)
	if Settings.ALLOWED_USERS.GamePasses then
		for i, gamepass in ipairs(Settings.ALLOWED_USERS.GamePasses) do
			local index = table.find(gamepass.Owners, player)
			if index then
				table.remove(gamepass.Owners, index)
			end
		end
	end
end

if Run:IsServer() then
	Players.PlayerRemoving:Connect(playerRemoving)
end


function module:CanUse(player)
	if filterUsers == false then
		return true
	end
	
	if table.find(Settings.ALLOWED_USERS.Players, player.UserId) then
		return true
	end
	
	if Settings.ALLOWED_USERS.Groups then
		for i, group in ipairs(Settings.ALLOWED_USERS.Groups) do
			if group.IsInGroup(player):expect() then
				return true
			end
		end
	end
	
	if Settings.ALLOWED_USERS.GamePasses then
		for i, gamepass in ipairs(Settings.ALLOWED_USERS.GamePasses) do
			if table.find(gamepass.Owners, player) then print("from cache")
				return true
			end
			if gamepass.UserOwnsGamePass(player):expect() then print("first time")
				table.insert(gamepass.Owners, player)
				return true
			end
		end
	end
	
	return false
end

return module
