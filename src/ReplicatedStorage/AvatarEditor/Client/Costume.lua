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
local Signal = require(AvatarEditor.Shared.Util.Signal)
local Settings = require(AvatarEditor.Shared.Settings)
local Theme = require(AvatarEditor.Client.Theme)

local buttonTemplate = require(AvatarEditor.Gui.CostumeTemplateToLua)()

local player = Players.LocalPlayer

local Class = {}
Class.__index = Class


local function createButton()
	local button = buttonTemplate:Clone()
	return button
end


function Class.new(frame)
	local self = setmetatable({}, Class)
	
	self.Maid = Maid.new()
	self.Listeners = Maid.new()
	self.ScrollingFrame = frame.ScrollingFrame
	self.GridLayout = self.ScrollingFrame.UIGridLayout
	self.Wear = Signal.new()
	self.Delete = Signal.new()
	self.Children = {}
	self.Pool = {}
	
	for i = 1, 50 do
		self.Pool[i] = createButton()
	end
	
	self.Maid:GiveTask(Theme.Changed:Connect(function()
		self:Render()
	end))
	
	self.Maid:GiveTask(Theme:Bind(self.ScrollingFrame, "ScrollBarImageColor3", "Scrollbar"))
	
	Promise.new(function(resolve, reject)
		local folder = player:WaitForChild("AE_Costumes")
		resolve(folder)
	end)
	:andThen(function(folder)
		self.Folder = folder
		self.Maid:GiveTask(folder.ChildAdded:Connect(function()
			self:Render()
		end))
		self.Maid:GiveTask(folder.ChildRemoved:Connect(function()
			self:Render()
		end))
		self:Render()
	end)
	:catch(warn)
	
	return self
end


function Class:GetItem()
	local pool = self.Pool
	local button = table.remove(pool, #pool)
	if not button then
		button = createButton()
	end
	return button
end


function Class:Render()
	if not self.Folder then
		return
	end
	
	local folder = self.Folder
	local maid = self.Listeners
	local children = self.Children
	local scrollingFrame = self.ScrollingFrame
	local uiGridLayout = self.GridLayout
	local pool = self.Pool
	
	local list = folder:GetChildren()
	local newChildren = {}
	
	maid:DoCleaning()
	
	for i, v in ipairs(list) do
		local button = children[i] or self:GetItem()
		newChildren[i] = button
		
		button.ItemLabel.Text = v.Name
		button.More.Visible = false
		
		maid:GiveTask(Theme:Bind(button, "BackgroundColor3", "Button"))
		maid:GiveTask(Theme:Bind(button.ItemLabel, "TextColor3", "Text"))
		maid:GiveTask(Theme:Bind(button.ItemLabel, "TextStrokeColor3", "TextStroke"))
		maid:GiveTask(Theme:Bind(button.More, "BackgroundColor3", "Delete"))
		maid:GiveTask(Theme:Bind(button.More, "TextColor3", "Text"))
		
		Promise.new(function(resolve, reject)
			local success, result = pcall(function()
				return Players:CreateHumanoidModelFromDescription(v, Enum.HumanoidRigType.R15, Enum.AssetTypeVerification.ClientOnly)
			end)
			if success then
				resolve(result)
			else
				reject(result)
			end
		end)
		:andThen(function(result)
			maid:GiveTask(result)
			result:SetPrimaryPartCFrame(CFrame.new())
			
			local humanoid = result.Humanoid
			humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
			humanoid.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
			result.Animate:Destroy()
			
			local viewport = button.ViewportFrame
			local camera = Instance.new("Camera")
			maid:GiveTask(camera)
			camera.CFrame = CFrame.lookAt(Vector3.new(-2, 2, -5), result.PrimaryPart.Position)
			camera.Parent = button
			viewport.CurrentCamera = camera
			result.Parent = viewport.WorldModel
			maid:GiveTask(function()
				viewport.CurrentCamera = nil
			end)
		end)
		:catch(warn)
		
		maid:GiveTask(button.More.Activated:Connect(function(inputObject)
			self.Delete:Fire(v)
		end))
		
		maid:GiveTask(button.TouchLongPress:Connect(function(touchPositions, inputState)
			button.ItemLabel.Visible = false
			button.More.Visible = false
			self.Delete:Fire(v)
		end))
		
		maid:GiveTask(button.InputBegan:Connect(function(inputObject)
			if not Settings.HOVER_INPUTS[inputObject.UserInputType] then
				return
			end

			button.ItemLabel.Visible = true
			if inputObject.UserInputType == Enum.UserInputType.MouseMovement then
				button.More.Visible = true
			end
		end))

		maid:GiveTask(button.InputEnded:Connect(function(inputObject)
			if not Settings.HOVER_INPUTS[inputObject.UserInputType] then
				return
			end

			button.ItemLabel.Visible = false
			button.More.Visible = false
		end))
		
		maid:GiveTask(button.Activated:Connect(function(inputObject)
			self.Wear:Fire(v)
		end))
		
		button.Parent = scrollingFrame
	end
	
	for i = #list + 1, #children do
		local button = children[i]
		button.Parent = nil
		table.insert(pool, button)
	end
	
	self.Children = newChildren
	scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uiGridLayout.AbsoluteContentSize.Y)
end


function Class:Destroy()
	self.Maid:DoCleaning()
	self.Maid = nil
	self.Listeners:DoCleaning()
	self.Listeners = nil
	for i, v in ipairs(self.Children) do
		v:Destroy()
	end
	table.clear(self.Children)
	for i, v in ipairs(self.Pool) do
		v:Destroy()
	end
	table.clear(self.Pool)
	setmetatable(self, nil)
end


return Class