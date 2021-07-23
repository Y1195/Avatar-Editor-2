-- Class
-- 0_1195
-- January 10, 2021

--[[



]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local AvatarEditor = ReplicatedStorage.AvatarEditor
local Maid = require(AvatarEditor.Shared.Util.Maid)
local Signal = require(AvatarEditor.Shared.Util.Signal)
local Theme = require(AvatarEditor.Client.Theme)

local buttonTemplate = require(AvatarEditor.Gui.ColorTemplateToLua)()

local Class = {}
Class.__index = Class


local function fromHex(hex)
	local r, g, b = string.match(hex, "^#?(%w%w)(%w%w)(%w%w)$")
	return Color3.fromRGB(tonumber(r, 16), tonumber(g, 16), tonumber(b, 16))
end

local function toHex(color)
	return string.format("#%02X%02X%02X", color.R * 255, color.G * 255, color.B * 255)
end


local function isWearing(assets, color3)
	return toHex(assets) == toHex(color3)
end


function Class.new(frame, colorData, wearingTone)
	local self = setmetatable({}, Class)
	
	self.Frame = frame
	self.Wearing = wearingTone
	self.Children = {}
	self.Maid = Maid.new()
	self.Listeners = Maid.new()
	self.ItemSelected = Signal.new()
	
	self.Maid:GiveTask(Theme.Changed:Connect(function()
		self:Render()
	end))

	self.Maid:GiveTask(Theme:Bind(frame, "ScrollBarImageColor3", "Scrollbar"))
	
	for i, v in ipairs(colorData) do
		local button = buttonTemplate:Clone()
		button.BackgroundColor3 = v
		button.Wearing.Visible = isWearing(wearingTone, v)
		button.Parent = frame
		self.Children[i] = button
		
		self.Maid:GiveTask(Theme:Bind(button.Wearing, "ImageColor3", "Wearing"))
		
		self.Maid:GiveTask(button.Activated:Connect(function(inputObject)
			self.ItemSelected:Fire(i)
		end))
	end
	
	return self
end


function Class:Render()
	local maid = self.Listeners
	local wearingTone = self.Wearing
	
	maid:DoCleaning()
	
	for i, v in ipairs(self.Children) do
		v.Wearing.Visible = isWearing(wearingTone, v.BackgroundColor3)
	end
end


function Class:UpdateWearing(wearingTone)
	self.Wearing = wearingTone
	self:Render()
end


function Class:Destroy()
	self.Maid:Destroy()
	self.Maid = nil
	self.Listeners:Destroy()
	self.Listeners = nil
	self.Frame = nil
	self.Wearing = nil
	for i, v in ipairs(self.Children) do
		v:Destroy()
	end
	table.clear(self.Children)
	self.ItemSelected:Destroy()
	self.ItemSelected = nil
end


return Class