-- Class
-- 0_1195
-- January 10, 2021

--[[



]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Text = game:GetService("TextService")

local AvatarEditor = ReplicatedStorage.AvatarEditor
local Promise = require(AvatarEditor.Shared.Util.Promise)
local Signal = require(AvatarEditor.Shared.Util.Signal)
local TableUtil = require(AvatarEditor.Shared.Util.TableUtil)
local QueryMap = require(AvatarEditor.Shared.QueryMap)
local Colors = require(AvatarEditor.Shared.Colors)
local Settings = require(AvatarEditor.Shared.Settings)
local GetProductInfo = require(AvatarEditor.Shared.GetProductInfo)
local UserCanUse = require(AvatarEditor.Shared.UserCanUse)

local remoteEvent = Instance.new("RemoteEvent")
remoteEvent.Parent = AvatarEditor

local outfitCache = {}
local settingsCache = {}

local module = {}
module.HumanoidDescriptionChanged = Signal.new()
module.CostumeAdded = Signal.new()
module.CostumeRemoved = Signal.new()
module.CostumeUpdated = Signal.new() -- TODO update outfit
module.SettingChanged = Signal.new()
module.PermissionFailed = Signal.new()


local function filterText(text, player)
	return Promise.new(function(resolve, reject)
		local success, result = pcall(function()
			return Text:FilterStringAsync(text, player.UserId)
		end)
		if success then
			resolve(result)
		else
			reject(result)
		end
	end)
	:andThen(function(textFilterResult)
		return Promise.new(function(resolve, reject)
			local success, result = pcall(function()
				-- hopefully this appeases the roblox gods
				return textFilterResult:GetNonChatStringForUserAsync(player.UserId)
			end)
			if success then
				resolve(result)
			else
				reject(result)
			end
		end)
	end)
end


local function getHumanoid(player)
	local character = player.Character
	local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
	if humanoid and humanoid.Health > 0 then
		return humanoid
	end
end


local function getHumanoidDescriptionFromUserId(userId)
	return Promise.new(function(resolve, reject)
		local success, result = pcall(function()
			return Players:GetHumanoidDescriptionFromUserId(userId)
		end)
		if success then
			resolve(result)
		else
			reject(result)
		end
	end)
end


local function applyDescriptionToHumanoid(humanoid, description)
	return Promise.new(function(resolve, reject)
		local success, result = pcall(function()
			humanoid:ApplyDescription(description)
		end)
		if success then
			resolve(success)
		else
			reject(result)
		end
	end)
end


local function applyDescriptionToPlayer(player, description)
	module.HumanoidDescriptionChanged:Fire(player, description)
	
	local humanoid = getHumanoid(player)
	if not humanoid then
		return Promise.reject()
	end
	
	return applyDescriptionToHumanoid(humanoid, description)
end


local function descriptionUpdated(player, ...)
	remoteEvent:FireClient(player, ...)
end


local function accessory(player, id)
	assert(typeof(id) == "number", "accessory, id, number expected")
	
	local humanoid = getHumanoid(player)
	if not humanoid then
		return
	end

	local description = humanoid:GetAppliedDescription()
	if not description then
		return
	end
	
	GetProductInfo(id)
	:andThen(function(productInfo)
		local assetType = QueryMap.GetOptionName("AssetType", productInfo.AssetTypeId)
		if not assetType then
			return
		end
		
		-- really Roblox...??
		if assetType == "Hat" then
			assetType = "HatAccessory"
		elseif assetType == "ShoulderAccessory" then
			assetType = "ShouldersAccessory"
		end
		
		if string.find(assetType, "Accessory") then
			local accessories = string.split(description[assetType], ",")
			local index = table.find(accessories, tostring(productInfo.AssetId))
			if index then
				table.remove(accessories, index)
			elseif #humanoid:GetAccessories() < Settings.MAX_ACCESSORIES then
				table.insert(accessories, tostring(productInfo.AssetId))
			else
				-- TODO should probably notify the client
				print(player, "tried to wear too many accessories")
			end
			description[assetType] = table.concat(accessories, ",")
		else
			if description[assetType] == 0 or (description[assetType] ~= productInfo.AssetId) then
				description[assetType] = productInfo.AssetId
			else
				-- https://devforum.roblox.com/t/default-shirt-and-pants-to-be-applied-if-the-requested-ones-are-unavailable-moderated/381818
				-- force load default clothes. hacky
				-- hopefully there will never be a shirt or pants with id = 1 or 2
				description[assetType] = (assetType == "Shirt") and 1 or (assetType == "Pants") and 2 or 0
			end
		end
		
		applyDescriptionToPlayer(player, description)
		:andThenCall(descriptionUpdated, player, "accessory")
	end)
	:catch(warn)
end

local function tone(player, index)
	assert(typeof(index) == "number", "tone, index, number expected")

	local humanoid = getHumanoid(player)
	if not humanoid then
		return
	end

	local description = humanoid:GetAppliedDescription()
	if not description then
		return
	end

	index = math.clamp(index, 1, 75)

	local color = Colors[index]
	if color then
		description.HeadColor = color
		description.LeftArmColor = color
		description.LeftLegColor = color
		description.RightArmColor = color
		description.RightLegColor = color
		description.TorsoColor = color
	end

	applyDescriptionToPlayer(player, description)
	:doneCall(descriptionUpdated, player, "tone")
	:catch(warn)
end

local function reset(player)
	local humanoid = getHumanoid(player)
	if not humanoid then
		return
	end
	
	getHumanoidDescriptionFromUserId(player.UserId)
	:andThen(function(description)
		return applyDescriptionToPlayer(player, description)
	end)
	:doneCall(descriptionUpdated, player, "reset")
	:catch(warn)
end

local function scale(player, scaleName, value)
	assert(typeof(scaleName) == "string", "scale, scaleName, string expected")
	assert(typeof(value) == "number", "scale, value, number expected")

	local humanoid = getHumanoid(player)
	if not humanoid then
		return
	end

	local description = humanoid:GetAppliedDescription()
	if not description then
		return
	end

	if scaleName == "HeightScale" then
		value = math.clamp(value, 0.9, 1.05)
	elseif scaleName == "WidthScale" then
		value = math.clamp(value, 0.7, 1)
	elseif scaleName == "HeadScale" then
		value = math.clamp(value, 0.95, 1)
	elseif scaleName == "ProportionScale" or scaleName == "BodyTypeScale" then
		value = math.clamp(value, 0, 1)
	else
		return
	end

	Promise.new(function(resolve, reject)
		local success, result = pcall(function()
			description[scaleName] = value
		end)
		if success then
			resolve(success)
		else
			reject(result)
		end
	end)
	:andThenCall(applyDescriptionToPlayer, player, description)
	:doneCall(descriptionUpdated, player, "scale", scaleName, value)
	:catch(warn)
end


local function create(player, name)
	assert(typeof(name) == "string", "create, name, string expected")
	
	if name == "" then
		return
	end
	name = string.gsub(name, "[%p%s]+", "")
	
	local cache = outfitCache[player]
	if not cache then
		return
	end
	
	if #cache.Costumes >= Settings.MAX_COSTUME then
		return
	end
	
	local humanoid = getHumanoid(player)
	if not humanoid then
		return
	end

	local description = humanoid:GetAppliedDescription()
	if not description then
		return
	end
	
	local info = module:ToAppearanceInfo(description)
	filterText(name, player)
	:andThen(function(result)
		info.Name = result
		
		-- converting it back to a HumanoidDescription for the client to use the filtered name
		local descriptionCopy = module:ToHumanoidDescription(info)
		descriptionCopy.Parent = cache.Folder
		table.insert(cache.Costumes, info)
		local index = #cache.Costumes
		cache.Map[description] = index
		
		module.CostumeAdded:Fire(player, descriptionCopy, info, index)
	end)
	:catch(warn)
end


local function delete(player, description)
	assert(typeof(description) == "Instance" and description:IsA("HumanoidDescription"), "delete, description, HumanoidDescription expected")
	
	local cache = outfitCache[player]
	if not cache then
		return
	end

	local humanoid = getHumanoid(player)
	if not humanoid then
		return
	end
	
	if description:IsDescendantOf(cache.Folder) then
		local index = cache.Map[description]
		cache.Map[description] = nil
		description:Destroy()
		module.CostumeRemoved:Fire(player, description, cache.Costumes[index], index)
	end
end


--local function update(player, description)
--	assert(typeof(description) == "Instance" and description:IsA("HumanoidDescription"))
	
--end


local function wear(player, description)
	assert(typeof(description) == "Instance" and description:IsA("HumanoidDescription"), "wear, description, HumanoidDescription expected")
	
	local cache = outfitCache[player]
	if not cache then
		return
	end
	
	local humanoid = getHumanoid(player)
	if not humanoid then
		return
	end
	
	if description:IsDescendantOf(cache.Folder) then
		applyDescriptionToPlayer(player, description)
		:doneCall(descriptionUpdated, player, "reset")
		:catch(warn)
	end
end


local function theme(player, themeName)
	assert(typeof(themeName) == "string", "theme, themeName, string expected")
	
	local _settings = settingsCache[player]
	if not _settings then
		return
	end
	
	if not AvatarEditor.Themes:FindFirstChild(themeName) then
		remoteEvent:FireClient(player, "theme")
		return
	end
	
	_settings.Folder:SetAttribute("Theme", themeName)
	module.SettingChanged:Fire(player, "Theme", themeName)
end


local actions = {
	["accessory"] = accessory,
	["reset"] = reset,
	["tone"] = tone,
	["scale"] = scale,
	["create"] = create,
	["delete"] = delete,
	["wear"] = wear,
	["theme"] = theme,
}
local function onServerEvent(player, key, ...)
	assert(typeof(key) == "string", "onServerEvent, key, string expected")
	
	local canUse = UserCanUse:CanUse(player)
	if not canUse then
		module.PermissionFailed:Fire(player)
		return
	end
	
	local callback = actions[key]
	if callback then
		callback(player, ...)
	end
end


local function playerRemoving(player)
	local cache = outfitCache[player]
	if cache then
		for description, i in pairs(cache.Map) do
			cache.Map[description] = nil
		end
		cache.Map = nil
		cache.Folder:Destroy()
		cache.Folder = nil
		cache.Costumes = nil
		outfitCache[player] = nil
	end
	
	local _settings = settingsCache[player]
	if _settings then
		_settings.Folder:Destroy()
		_settings.Folder = nil
		_settings.Settings = nil
		settingsCache[player] = nil
	end
end


remoteEvent.OnServerEvent:Connect(onServerEvent)
Players.PlayerRemoving:Connect(playerRemoving)


function module:CacheSettings(player, config)
	-- TODO maybe validate table??
	local folder = Instance.new("Configuration")
	folder.Name = "AE_Settings"
	
	for k, v in pairs(config) do
		folder:SetAttribute(k, v)
	end
	
	settingsCache[player] = {
		Folder = folder,
		Settings = config,
	}
	
	folder.Parent = player
end


function module:CacheOutfits(player, costumes)
	local folder = Instance.new("Folder")
	folder.Name = "AE_Costumes"
	
	local map = {}
	
	for i, v in ipairs(costumes) do
		-- https://developer.roblox.com/en-us/api-reference/function/TextService/FilterStringAsync
		-- apparently you need to filter again to keep it updated
		-- is caching illegal? dont ban me roblox. its not publically displayed for everyone, just the user
		
		local description = module:ToHumanoidDescription(v)
		filterText(v.Name, player)
		:andThen(function(result)
			-- update the saved name to comply with new filter rules, if any.
			v.Name = result
		end)
		:catch(warn)
		description.Parent = folder
		map[description] = i
	end
	
	outfitCache[player] = {
		Folder = folder,
		Costumes = TableUtil.Copy(costumes),
		Map = map,
	}
	
	folder.Parent = player
end


function module:ApplyDescriptionFromInfo(character, info)
	return Promise.new(function(resolve)
		local humanoid = character:WaitForChild("Humanoid")

		if not humanoid:IsDescendantOf(workspace) then
			humanoid.AncestryChanged:Wait()
		end
		
		resolve(humanoid)
	end)
	:andThen(function(humanoid)
		local description = info and module:ToHumanoidDescription(info)
		if description then
			applyDescriptionToHumanoid(humanoid, description)
			:catch(warn)
		end
	end)
end


local function fromHex(hex)
	local r, g, b = string.match(hex, "^#?(%w%w)(%w%w)(%w%w)$") -- owo
	return Color3.fromRGB(tonumber(r, 16), tonumber(g, 16), tonumber(b, 16))
end

local function toHex(color)
	return string.format("#%02X%02X%02X", color.R * 255, color.G * 255, color.B * 255)
end


function module:ToHumanoidDescription(info)
	-- TODO should probably check if _info_ is valid but whatever
	local description = Instance.new("HumanoidDescription")
	for k, v in pairs(info) do
		if string.find(k, "Color") then
			v = fromHex(v)
		end
		description[k] = v
	end
	
	-- TODO not sure if filter is needed here, need to get the player somehow
	--filterText(description.Name, player)
	--:andThen(function(result) --print(result)
	--	info.Name = result
	--end)
	--:catch(warn)
	
	return description
end


function module:ToAppearanceInfo(description)
	assert(typeof(description) == "Instance" and description:IsA("HumanoidDescription"), "ToAppearanceInfo is not a HumanoidDescription")
	
	local info = {}
	
	-- TODO here too
	--filterText(description.Name, player)
	--:andThen(function(result) --print(result)
	--	info.Name = result
	--end)
	--:catch(warn)
	
	info.BackAccessory = description.BackAccessory
	info.FaceAccessory = description.FaceAccessory
	info.FrontAccessory = description.FrontAccessory
	info.HairAccessory = description.HairAccessory
	info.HatAccessory = description.HatAccessory
	info.NeckAccessory = description.NeckAccessory
	info.ShouldersAccessory = description.ShouldersAccessory
	info.WaistAccessory = description.WaistAccessory
	
	info.Face = description.Face
	info.Head = description.Head
	info.LeftArm = description.LeftArm
	info.LeftLeg = description.LeftLeg
	info.RightArm = description.RightArm
	info.RightLeg = description.RightLeg
	info.Torso = description.Torso
	
	info.BodyTypeScale = description.BodyTypeScale
	info.DepthScale = description.DepthScale
	info.HeadScale = description.HeadScale
	info.HeightScale = description.HeightScale
	info.ProportionScale = description.ProportionScale
	info.WidthScale = description.WidthScale
	
	info.Pants = description.Pants
	info.Shirt = description.Shirt
	
	info.HeadColor = toHex(description.HeadColor)
	info.LeftArmColor = toHex(description.LeftArmColor)
	info.LeftLegColor = toHex(description.LeftLegColor)
	info.RightArmColor = toHex(description.RightArmColor)
	info.RightLegColor = toHex(description.RightLegColor)
	info.TorsoColor = toHex(description.TorsoColor)
	
	info.ClimbAnimation = description.ClimbAnimation
	info.FallAnimation = description.FallAnimation
	info.IdleAnimation = description.IdleAnimation
	info.JumpAnimation = description.JumpAnimation
	info.RunAnimation = description.RunAnimation
	info.SwimAnimation = description.SwimAnimation
	info.WalkAnimation = description.WalkAnimation
	
	for k, v in pairs(info) do
		if v == "" or ((v == 0) and not (string.find(k, "Scale"))) then
			info[k] = nil
		end
	end
	
	return info
end


function module:GetSettings(player)
	return settingsCache[player]
end


function module:GetOutfits(player)
	return outfitCache[player]
end


return module
