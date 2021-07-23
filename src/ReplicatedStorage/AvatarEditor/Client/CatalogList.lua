-- Class
-- 0_1195
-- January 10, 2021

--[[



]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local AvatarEditor = ReplicatedStorage.AvatarEditor
local QueryMap = require(AvatarEditor.Shared.QueryMap)
local Signal = require(AvatarEditor.Shared.Util.Signal)
local Maid = require(AvatarEditor.Shared.Util.Maid)
local Settings = require(AvatarEditor.Shared.Settings)
local Cache = require(AvatarEditor.Shared.Cache)
local Theme = require(AvatarEditor.Client.Theme)

local buttonTemplate = require(AvatarEditor.Gui.ButtonTemplateToLua)()

local cache = Cache.new(Settings.CACHE_SIZE)

local Class = {}
Class.__index = Class


local function copy(array)
	local new = {}
	table.move(array, 1, #array, 1, new)
	return new
end


local function getCacheKey(pattern, assetType, wearing, uid)
	local key = string.format("%s, %s, %s, %s", QueryMap.GetOptionName("AssetType", assetType), tostring(wearing), uid, pattern)
	return key
end


local function getFromCache(pattern, assetType, wearing, uid)
	local key = getCacheKey(pattern, assetType, wearing, uid)
	return cache:Get(key)
end


local function createCache(pattern, assetType, wearing, uid, list)
	local key = getCacheKey(pattern, assetType, wearing, uid)
	list = copy(list)
	cache:Set(key, list)
end


local function sort(list)
	table.sort(list, function(a, b)
		return a._name < b._name
	end)
end


function stringMatch(str, pattern)
	local patternIndex = 1
	local patternLength = #pattern
	local strIndex = 1
	local strLength = #str

	while patternIndex <= patternLength and strIndex <= strLength do
		local patternChar = pattern:sub(patternIndex, patternIndex):lower()
		local strChar = str:sub(strIndex, strIndex):lower()

		if patternChar == strChar then
			patternIndex = patternIndex + 1
		end

		strIndex = strIndex + 1
	end

	return patternLength > 0 and strLength > 0 and (patternIndex - 1) == patternLength
end


local function createButton()
	local button = buttonTemplate:Clone()
	return button
end


local function isWearing(assets, id)
	return assets[id]
end


function Class.new(scrollingFrame, catalogData, wearingAssets, searchState)
	local self = setmetatable({}, Class)
	
	self.ScrollingFrame = scrollingFrame
	self.All = catalogData
	self.List = catalogData
	self.Wearing = wearingAssets
	self.PageSize = Settings.PAGE_SIZE
	self.MaxPageSize = Settings.PAGE_SIZE
	self.GridLayout = scrollingFrame.UIGridLayout
	self.Maid = Maid.new()
	self.Listeners = Maid.new()
	self.Children = {}
	self.Pool = {}
	self.State = searchState
	self.ItemSelected = Signal.new()
	self.ViewDetails = Signal.new()
	
	for i = 1, 50 do
		self.Pool[i] = createButton()
	end
	
	self.Maid:GiveTask(Theme.Changed:Connect(function()
		self:Render()
	end))
	
	self.Maid:GiveTask(Theme:Bind(scrollingFrame, "ScrollBarImageColor3", "Scrollbar"))
	
	self.Maid:GiveTask(self.ScrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
		local currentPageSize = self.PageSize
		local uiGridLayout = self.GridLayout
		-- i think indexing AbsoluteContentSize is really intensive especially on larger AbsoluteContentSize
		local scrollEnough = scrollingFrame.CanvasPosition.Y >= uiGridLayout.AbsoluteContentSize.Y - scrollingFrame.AbsoluteSize.Y - 10
		if scrollEnough then
			local newPageSize = math.min(currentPageSize + Settings.PAGE_SIZE, self.MaxPageSize)
			if newPageSize ~= currentPageSize then
				self.PageSize = newPageSize
				self:Update()
			end
		end
	end))
	
	for i, v in ipairs(self.All) do
		v._name = v.name:lower()
		v._wearing = isWearing(self.Wearing, v.id)
	end
	
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
	local maid = self.Listeners
	local catalogList = self.List
	local children = self.Children
	local scrollingFrame = self.ScrollingFrame
	local uiGridLayout = self.GridLayout
	local pool = self.Pool
	local newChildren = table.create(1000)
	
	maid:DoCleaning()

	for i, v in ipairs(catalogList) do
		local button = children[i] or self:GetItem()
		button.LayoutOrder = i
		button.ItemLabel.Text = v.name
		button.Icon.Image = "rbxthumb://type=Asset&id=" .. v.id .. "&w=150&h=150"
		button.ItemLabel.Visible = false
		button.Wearing.Visible = v._wearing
		button.More.Visible = false
		newChildren[i] = button
		
		maid:GiveTask(Theme:Bind(button, "BackgroundColor3", "Button"))
		maid:GiveTask(Theme:Bind(button.ItemLabel, "TextColor3", "Text"))
		maid:GiveTask(Theme:Bind(button.ItemLabel, "TextStrokeColor3", "TextStroke"))
		maid:GiveTask(Theme:Bind(button.More, "BackgroundColor3", "Details"))
		maid:GiveTask(Theme:Bind(button.More, "TextColor3", "Text"))
		maid:GiveTask(Theme:Bind(button.Wearing, "BackgroundColor3", "Wearing"))
		
		maid:GiveTask(button.More.Activated:Connect(function(inputObject)
			self.ViewDetails:Fire(v)
		end))
		
		maid:GiveTask(button.TouchLongPress:Connect(function(touchPositions, inputState)
			button.ItemLabel.Visible = false
			button.More.Visible = false
			self.ViewDetails:Fire(v)
		end))

		maid:GiveTask(button.Activated:Connect(function(inputObject)
			self.ItemSelected:Fire(v, v._wearing)
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
		
		button.Parent = scrollingFrame
	end

	for i = #catalogList + 1, #children do
		local button = children[i]
		button.Parent = nil
		table.insert(pool, button)
	end
	
	self.Children = newChildren
	scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uiGridLayout.AbsoluteContentSize.Y)
end


function Class:Search(list, pattern, assetType, wearing, uid)
	local results = table.create(10000)
	-- umm yeaaa
	if pattern == "" then
		if wearing then
			for i, v in ipairs(list) do
				if v._wearing then
					table.insert(results, v)
				end
			end
		else
			for i, v in ipairs(list) do
				if v.assetType == assetType then
					table.insert(results, v)
				end
			end
		end
	else
		if wearing then
			for i, v in ipairs(list) do
				if stringMatch(v._name, pattern) and v._wearing then
					table.insert(results, v)
				end
			end
		else
			for i, v in ipairs(list) do
				if stringMatch(v._name, pattern) and v.assetType == assetType then
					table.insert(results, v)
				end
			end
		end
	end
	
	return results
end


function Class:Update(reset)
	local scrollingFrame = self.ScrollingFrame
	local state = self.State

	if reset then
		self.PageSize = Settings.PAGE_SIZE
		self.MaxPageSize = Settings.PAGE_SIZE
		scrollingFrame.CanvasPosition = Vector2.new(0, 0)
	end

	local filteredItems = {}
	local cacheResults = getFromCache(state.search, state.assetType, state.wearing, state.uid)
	if cacheResults then
		self.MaxPageSize = #cacheResults
		
		for i = 1, self.PageSize do
			table.insert(filteredItems, i, cacheResults[i])
		end
		
		createCache(state.search, state.assetType, state.wearing, state.uid, cacheResults)
	else
		local searchResults = self:Search(self.All, state.search, state.assetType, state.wearing, state.uid)
		sort(searchResults)
		
		self.MaxPageSize = #searchResults
		
		for i = 1, self.PageSize do
			table.insert(filteredItems, i, searchResults[i])
		end
		
		createCache(state.search, state.assetType, state.wearing, state.uid, searchResults)
	end

	self.List = filteredItems
	self:Render()
end


function Class:UpdateWearing(wearingAssets)
	self.Wearing = wearingAssets
	for i, v in ipairs(self.All) do
		v._wearing = isWearing(self.Wearing, v.id)
	end
	self:Render()
end


function Class:Destroy()
	self.ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
	self.ScrollingFrame = nil
	self.All = nil
	self.List = nil
	self.Wearing = nil
	self.PageSize = nil
	self.MaxPageSize = nil
	self.GridLayout = nil
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
	self.State = nil
	self.ItemSelected:Destroy()
	self.ItemSelected = nil
	self.ViewDetails:Destroy()
	self.ViewDetails = nil
end


return Class