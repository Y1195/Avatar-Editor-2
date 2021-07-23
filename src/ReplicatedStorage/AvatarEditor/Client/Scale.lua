-- Class
-- 0_1195
-- January 10, 2021

--[[



]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local AvatarEditor = ReplicatedStorage.AvatarEditor
local GuiLib = require(AvatarEditor.Client.GuiLib.LazyLoader)
local Maid = require(AvatarEditor.Shared.Util.Maid)
local Signal = require(AvatarEditor.Shared.Util.Signal)
local Promise = require(AvatarEditor.Shared.Util.Promise)
local Theme = require(AvatarEditor.Client.Theme)

local player = Players.LocalPlayer

local Class = {}
Class.__index = Class

local Slider = {}
Slider.__index = Slider


local function map(n, inMin, inMax, outMin, outMax)
	return (outMin + ((outMax - outMin) * ((n - inMin) / (inMax - inMin))))
end


local function setScale(scale, value) -- TODO disable for R6?
	local character = player.Character
	local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
	local bodyScale = (humanoid and humanoid.Health > 0) and humanoid:FindFirstChild(scale)
	if bodyScale then
		bodyScale.Value = value
	else
		warn(scale, "not found or dead")
	end
end


function Slider.new(frame, x, min, max, callback)
	local self = setmetatable({}, Slider)
	
	self.Maid = Maid.new()
	self.Changed = Signal.new()
	self.Min = min
	self.Max = max
	self.Frame = frame
	self.Callback = callback
	
	self.Slider = GuiLib.Classes.Slider.new(frame.SliderFrame)

	self.Slider.Interval = 0.01
	self.Slider.TweenClick = false
	self.Slider:Set(map(x, min, max, 0, 1))

	self:Update(map(x, min, max, 0, 1))

	self.Maid:GiveTask(self.Slider.Changed:Connect(function(value)
		value = map(value, 0, 1, min, max)
		self:Update(value)
	end))

	self.Maid:GiveTask(self.Slider.DragStop:Connect(function()
		local value = map(self.Slider:Get(), 0, 1, min, max)
		self.Changed:Fire(value)
	end))

	self.Mask = GuiLib.Classes.TextMask.new(frame.TextFrame.TextBox)

	self.Mask:SetMaskType("Integer")
	self.Mask:SetMaxLength(3)

	self.Maid:GiveTask(self.Mask.Frame.FocusLost:Connect(function()
		local value = math.clamp(self.Mask:GetValue()/100, min, max)
		self.Slider:Set(map(value, min, max, 0, 1))
		self:Update(value)
		self.Changed:Fire(value)
	end))
	
	return self
end


function Slider:Set(value)
	self.Slider:Set(map(value, self.Min, self.Max, 0, 1))
	self.Mask.Frame.Text = string.format("%d", map(value, 0, 1, 0, 100))
end


function Slider:Update(value)
	local frame = self.Frame
	local callback = self.Callback
	
	frame.TextFrame.TextBox.Text = string.format("%d", map(value, 0, 1, 0, 100))
	callback(value)
end


function Slider:Destroy()
	self.Maid:DoCleaning()
	self.Maid = nil
	self.Changed:Destroy()
	self.Changed = nil
	self.Min = nil
	self.Max = nil
	self.Frame = nil
	self.Callback = nil
	self.Slider:Destroy()
	self.Slider = nil
	self.Mask:Destroy()
	self.Mask = nil
	setmetatable(self, nil)
end


function Class.new(frame, wearingScales)
	local self = setmetatable({}, Class)
	
	self.Maid = Maid.new()
	self.ScaleUpdated = Signal.new()
	
	self.Maid:GiveTask(Theme:Bind(frame, "ScrollBarImageColor3", "Scrollbar"))
	for i, v in ipairs(frame:GetChildren()) do
		if not v:IsA("Frame") then
			continue
		end
		
		self.Maid:GiveTask(Theme:Bind(v.SliderFrame.Background.Bar, "BackgroundColor3", "DraggerBar"))
		self.Maid:GiveTask(Theme:Bind(v.SliderFrame.Dragger, "BackgroundColor3", "Dragger"))
		self.Maid:GiveTask(Theme:Bind(v.TextFrame, "BackgroundColor3", "Tertiary"))
		self.Maid:GiveTask(Theme:Bind(v.TextFrame.TextBox, "PlaceholderColor3", "PlaceholderText"))
		self.Maid:GiveTask(Theme:Bind(v.TextFrame.TextBox, "TextColor3", "Text"))
		self.Maid:GiveTask(Theme:Bind(v.TextLabel, "TextColor3", "Text"))
	end
	
	
	local bodyTypeScale = Slider.new(frame.BodyType, wearingScales.BodyTypeScale, 0, 1, function(value)
		setScale("BodyTypeScale", value)
	end)
	self.Maid.BodyTypeScale = bodyTypeScale
	self.Maid:GiveTask(bodyTypeScale.Changed:Connect(function(value)
		self.ScaleUpdated:Fire("BodyTypeScale", value)
	end))
	
	
	local heightScale = Slider.new(frame.Height, wearingScales.HeightScale, 0.9, 1.05, function(value)
		setScale("BodyHeightScale", value)
	end)
	self.Maid.HeightScale = heightScale
	self.Maid:GiveTask(heightScale.Changed:Connect(function(value)
		self.ScaleUpdated:Fire("HeightScale", value)
	end))
	
	
	local widthScale = Slider.new(frame.Width, wearingScales.WidthScale, 0.7, 1, function(value)
		setScale("BodyWidthScale", value)
	end)
	self.Maid.WidthScale = widthScale
	self.Maid:GiveTask(widthScale.Changed:Connect(function(value)
		self.ScaleUpdated:Fire("WidthScale", value)
	end))
	
	
	local headScale = Slider.new(frame.Head, wearingScales.HeadScale, 0.95, 1, function(value)
		setScale("HeadScale", value)
	end)
	self.Maid.HeadScale = headScale
	self.Maid:GiveTask(headScale.Changed:Connect(function(value)
		self.ScaleUpdated:Fire("HeadScale", value)
	end))
	
	
	local proportionScale = Slider.new(frame.Proportion, wearingScales.ProportionScale, 0, 1, function(value)
		setScale("BodyProportionScale", value)
	end)
	self.Maid.ProportionScale = proportionScale
	self.Maid:GiveTask(proportionScale.Changed:Connect(function(value)
		self.ScaleUpdated:Fire("ProportionScale", value)
	end))
	
	return self
end


function Class:UpdateWearing(scale, value)
	local slider = self.Maid[scale]
	slider:Set(value)
end


function Class:Destroy()
	self.Maid:DoCleaning()
	self.Maid = nil
	self.ScaleUpdated:Destroy()
	self.ScaleUpdated = nil
	setmetatable(self, nil)
end


return Class
