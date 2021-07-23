-- Class
-- 0_1195
-- January 10, 2021

--[[



]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Http = game:GetService("HttpService")

local AvatarEditor = ReplicatedStorage.AvatarEditor
local Promise = require(AvatarEditor.Shared.Util.Promise)
local Colors = require(AvatarEditor.Shared.Colors)

local player = Players.LocalPlayer

local ids = nil
local skintone = nil
local scales = nil

local idProperties = {
	"BackAccessory",
	"FaceAccessory",
	"FrontAccessory",
	"HairAccessory",
	"HatAccessory",
	"NeckAccessory",
	"ShouldersAccessory",
	"WaistAccessory",
	"Face",
	"Head",
	"LeftArm",
	"LeftLeg",
	"RightArm",
	"RightLeg",
	"Torso",
	"ClimbAnimation",
	"FallAnimation",
	"IdleAnimation",
	"JumpAnimation",
	"RunAnimation",
	"SwimAnimation",
	"WalkAnimation",
	"Pants",
	"Shirt",
}

local scaleProperties = {
	"BodyTypeScale",
	--"DepthScale",
	"HeadScale",
	"HeightScale",
	"ProportionScale",
	"WidthScale",
}

local module = {}
module.UID = Http:GenerateGUID(false)


local function getHumanoid()
	local character = player.Character
	local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
	if humanoid then
		return humanoid
	end
end


local function getHumanoidDescription()
	return Promise.new(function(resolve, reject)
		local humanoid = getHumanoid()
		if not humanoid then
			return Promise.reject("no humanoid")
		end
		
		local description = humanoid:GetAppliedDescription()
		if description then
			resolve(description)
		else
			reject("description not found")
		end
	end)
	:andThen(function(description)
		ids = {}
		for i, v in ipairs(idProperties) do
			local values = string.split(description[v], ",")
			for j, k in ipairs(values) do
				if k == "" or k == "0" then
					continue
				end
				ids[tonumber(k)] = true
			end
		end
		scales = {}
		for i, v in ipairs(scaleProperties) do
			scales[v] = description[v]
		end
		skintone = description.HeadColor
	end)
	:catch(warn)
	:finally(function()
		if ids == nil then
			ids = {}
		end
	end)
end


function module:Get()
	if ids == nil then
		getHumanoidDescription():await()
	end
	return ids
end


function module:GetTone()
	if skintone == nil then
		getHumanoidDescription():await()
	end
	return skintone
end


function module:GetScale()
	if scales == nil then
		getHumanoidDescription():await()
	end
	return scales
end


function module:Update()
	getHumanoidDescription():await()
	self.UID = Http:GenerateGUID(false)
end

return module

