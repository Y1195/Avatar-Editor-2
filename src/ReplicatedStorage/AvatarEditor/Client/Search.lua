-- Class
-- 0_1195
-- January 10, 2021

--[[



]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local AvatarEditor = ReplicatedStorage.AvatarEditor
local GuiLib = require(AvatarEditor.Client.GuiLib.LazyLoader)
local Maid = require(AvatarEditor.Shared.Util.Maid)
local Signal = require(AvatarEditor.Shared.Util.Signal)
local Promise = require(AvatarEditor.Shared.Util.Promise)
local Settings = require(AvatarEditor.Shared.Settings)

local Class = {}
Class.__index = Class


function Class.new(frame, searchState)
	local self = setmetatable({}, Class)
	
	self.State = searchState
	self.SearchChanged = Signal.new()
	self.Maid = Maid.new()
	self.NextSearch = nil
	self.SearchPromise = nil
	self.Frame = frame
	
	local searchBox = frame.TextBox
	
	local mask = GuiLib.Classes.TextMask.new(searchBox)
	self.Maid:GiveTask(mask)

	mask:SetMaskType("String")
	mask:SetMaxLength(50)
	
	self.Maid:GiveTask(mask.Frame.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
		if not enterPressed then
			return
		end
		local value = mask:GetValue()
		self:OnSearchChanged(value, true)
	end))

	self.Maid:GiveTask(mask.Frame:GetPropertyChangedSignal("Text"):Connect(function()
		local value = mask:GetValue()
		self:OnSearchChanged(value)
	end))

	self.Maid:GiveTask(frame.Clear.Activated:Connect(function(inputObject)
		searchBox.Text = ""
	end))
	
	return self
end


function Class:OnSearchChanged(pattern, focusLost)
	local state = self.State
	local searchPromise = self.SearchPromise
	
	self.NextSearch = pattern

	if searchPromise then
		searchPromise:cancel()
	end
	-- cant believe this works
	self.SearchPromise = Promise.new(function(resolve, reject, onCancel)
		Promise.delay(Settings.SEARCH_DELAY):andThen(function()
			if not onCancel(function() end) then
				if state.search == self.NextSearch then
					reject("same search")
				else
					state.search = self.NextSearch
					self.SearchChanged:Fire()
					resolve()
				end
			end
		end)
	end):catch(function()

	end)
end


function Class:Destroy()
	self.State = nil
	self.SearchChanged:Destroy()
	self.SearchChanged = nil
	self.Maid:DoCleaning()
	self.Maid = nil
	self.NextSearch = nil
	self.SearchPromise = nil
	self.Frame = nil
	setmetatable(self, nil)
end


return Class