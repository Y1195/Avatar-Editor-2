-- Class
-- 0_1195
-- January 10, 2021

--[[



]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local AvatarEditor = ReplicatedStorage.AvatarEditor
local Spring = require(AvatarEditor.Shared.Util.Spring)
local Maid = require(AvatarEditor.Shared.Util.Maid)
local Settings = require(AvatarEditor.Shared.Settings)
local Theme = require(AvatarEditor.Client.Theme)

local Class = {}
Class.__index = Class


function Class.new(guiButton, callback)
	local self = setmetatable({}, Class)
	
	self.Button = guiButton
	
	self.ColorSpring = Spring.new(0)
	self.ColorSpring.Damper = 1
	self.ColorSpring.Speed = 20
	
	self.Maid = Maid.new()
	
	self.Maid:GiveTask(guiButton.InputBegan:Connect(function(inputObject)
		if not Settings.HOVER_INPUTS[inputObject.UserInputType] then
			return
		end
		guiButton.MaxVisibleGraphemes = -1
		guiButton.Icon.Visible = false
	end))
	
	self.Maid:GiveTask(guiButton.InputEnded:Connect(function(inputObject)
		if not Settings.HOVER_INPUTS[inputObject.UserInputType] then
			return
		end
		guiButton.MaxVisibleGraphemes = 0
		guiButton.Icon.Visible = true
	end))
	
	self.Maid:GiveTask(guiButton.Activated:Connect(callback))
	
	return self
end


function Class:OnRenderStep(delta)
	local colorSpring = self.ColorSpring
	local button = self.Button
	
	colorSpring:TimeSkip(delta)
	
	local pos = colorSpring.Position
	local color = Theme:GetColor("Deselected"):lerp(Theme:GetColor("Selected"), pos)
	button.Icon.ImageColor3 = color
	button.TextColor3 = color
end


function Class:Destroy()
	self.Maid:DoCleaning()
	self.Maid = nil
	
	self.Button = nil
	self.ColorSpring = nil
	
	setmetatable(self, nil)
end


return Class