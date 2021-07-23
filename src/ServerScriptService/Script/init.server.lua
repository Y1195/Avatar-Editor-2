local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local AvatarEditor = ReplicatedStorage.AvatarEditor
local AE = require(ServerStorage.AvatarEditorServer)
local Settings = require(AvatarEditor.Shared.Settings)
local ProfileService = require(script.ProfileService)

local DATASTORE_NAME = "PlayerDataAvatar"

local playerProfiles = {}

local profileStore = ProfileService.GetProfileStore(DATASTORE_NAME, {
	Avatar = {
		Equipped = nil,
		Costumes = {},
		Settings = {
			Theme = Settings.DEFAULT_THEME,
			-- HQ = false,
		},
	},
})


local function humanoidDescriptionChanged(player, description)
	local info = AE:ToAppearanceInfo(description)
	local profile = playerProfiles[player]
	profile.Data.Avatar.Equipped = info
end


local function outfitAdded(player, description, info, index)
	local profile = playerProfiles[player]
	table.insert(profile.Data.Avatar.Costumes, info)
	--print(#game:GetService("HttpService"):JSONEncode(profile.Data.Avatar.Costumes))
end


local function outfitRemoved(player, description, info, index)
	local profile = playerProfiles[player]
	table.remove(profile.Data.Avatar.Costumes, index)
	--print(profile.Data.Avatar.Costumes)
end


local function settingChanged(player, setting, value)
	local profile = playerProfiles[player]
	profile.Data.Avatar.Settings[setting] = value
end


local function playerDataLoaded(player)
	local profile = playerProfiles[player]
	
	local function characterAdded(character)
		AE:ApplyDescriptionFromInfo(character, profile.Data.Avatar.Equipped)
		:catch(warn)
	end
	
	AE:CacheOutfits(player, profile.Data.Avatar.Costumes)
	AE:CacheSettings(player, profile.Data.Avatar.Settings)
	characterAdded(player.Character or player.CharacterAdded:Wait())

	player.CharacterAdded:Connect(characterAdded)
end

local function playerAdded(player)
	local profile = profileStore:LoadProfileAsync("Player_" .. player.UserId, "ForceLoad")
	if profile == nil then
		player:Kick("Data failed to load. Please rejoin.")
		return
	end
	
	profile:Reconcile()
	profile:ListenToRelease(function()
		playerProfiles[player] = nil
		player:Kick("Data loaded remotely. Please rejoin.")
	end)

	if player:IsDescendantOf(Players) then
		playerProfiles[player] = profile
		playerDataLoaded(player)
	else
		profile:Release()
	end
end


local function playerRemoving(player)
	local profile = playerProfiles[player]
	if profile then
		profile:Release()
	end
end


local function permissionFailed(player)
	
end


for i, player in ipairs(Players:GetPlayers()) do
	coroutine.wrap(playerAdded)(player)
end

Players.PlayerAdded:Connect(playerAdded)
Players.PlayerRemoving:Connect(playerRemoving)
AE.HumanoidDescriptionChanged:Connect(humanoidDescriptionChanged)
AE.CostumeAdded:Connect(outfitAdded)
AE.CostumeRemoved:Connect(outfitRemoved)
AE.SettingChanged:Connect(settingChanged)
AE.PermissionFailed:Connect(permissionFailed)