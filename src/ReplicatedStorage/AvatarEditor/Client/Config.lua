-- Class
-- 0_1195
-- January 10, 2021

--[[



]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local AvatarEditor = ReplicatedStorage.AvatarEditor
local Maid = require(AvatarEditor.Shared.Util.Maid)
local Promise = require(AvatarEditor.Shared.Util.Promise)
local GuiLib = require(AvatarEditor.Client.GuiLib.LazyLoader)
local Theme = require(AvatarEditor.Client.Theme)

local buttonTemplate = require(AvatarEditor.Gui.DropdownTemplateToLua)()

local player = Players.LocalPlayer

local Class = {}
Class.__index = Class


function Class.new(frame)
	local self = setmetatable({}, Class)
	
	self.Frame = frame
	self.ScrollingFrame = self.Frame.ScrollingFrame
	self.Maid = Maid.new()

	self.Maid:GiveTask(Theme:Bind(self.ScrollingFrame, "ScrollBarImageColor3", "Scrollbar"))
	self.Maid:GiveTask(Theme:Bind(self.ScrollingFrame.Theme.DropdownButton, "BackgroundColor3", "Tertiary"))
	self.Maid:GiveTask(Theme:Bind(self.ScrollingFrame.Theme.DropdownButton.ListFrame, "BackgroundColor3", "Tertiary"))
	self.Maid:GiveTask(Theme:Bind(self.ScrollingFrame.Theme.DropdownButton.Arrow, "ImageColor3", "Deselected"))
	self.Maid:GiveTask(Theme:Bind(self.ScrollingFrame.Theme.DropdownButton.Option, "TextColor3", "Text"))
	self.Maid:GiveTask(Theme:Bind(self.ScrollingFrame.Theme.TextLabel, "TextColor3", "Text"))
	
	local dropdownButton = self.ScrollingFrame.Theme.DropdownButton
	for i, v in ipairs(Theme:GetAll()) do
		local button = buttonTemplate:Clone()
		button.LayoutOrder = i
		button.Text = v
		button.Name = v
		self.Maid:GiveTask(Theme:Bind(button, "BackgroundColor3", "Tertiary"))
		self.Maid:GiveTask(Theme:Bind(button, "TextColor3", "Text"))
		self.Maid:GiveTask(button)
		button.Parent = dropdownButton.ListFrame.ScrollFrame
	end
	self.Maid:GiveTask(Theme:Bind(dropdownButton.ListFrame.ScrollFrame, "ScrollBarImageColor3", "Scrollbar"))
	
	-- for some reason AutomaticCanvasSize doesnt want to work here...
	dropdownButton.ListFrame.ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, dropdownButton.ListFrame.ScrollFrame.UIListLayout.AbsoluteContentSize.Y)
	
	local themeDropdown = GuiLib.Classes.Dropdown.new(dropdownButton, dropdownButton.ListFrame)
	self.Maid:GiveTask(themeDropdown)
	
	self.Maid:GiveTask(themeDropdown.Changed:Connect(function(button)
		local theme = button.Name
		Theme:Set(theme)
	end))
	
	Promise.new(function(resolve, reject)
		local folder = player:WaitForChild("AE_Settings")
		resolve(folder)
	end)
	:andThen(function(folder)
		self.Folder = folder
		
		themeDropdown:Set(dropdownButton.ListFrame.ScrollFrame[self.Folder:GetAttribute("Theme")])
		Theme:Set(themeDropdown:Get().Name)
	end)
	:catch(warn)
	
	return self
end


function Class:Destroy()
	self.Maid:DoCleaning()
	self.Maid = nil
	setmetatable(self, nil)
end


return Class