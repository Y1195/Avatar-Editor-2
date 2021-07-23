-- Class
-- 0_1195
-- January 10, 2021

--[[

have all the edits only on the client until the client is done
then send fire the remote event once with all the changes
instead of per accessory.
too lazy to change. adopt me does it 1 by 1 soo...

]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- local UserInput = game:GetService("UserInputService")

local AvatarEditor = ReplicatedStorage.AvatarEditor
local remoteEvent = AvatarEditor:WaitForChild("RemoteEvent")
local Maid = require(AvatarEditor.Shared.Util.Maid)
-- local TableUtil = require(AvatarEditor.Shared.Util.TableUtil)
local Spring = require(AvatarEditor.Shared.Util.Spring)
local Signal = require(AvatarEditor.Shared.Util.Signal)
local QueryMap = require(AvatarEditor.Shared.QueryMap)
local CatalogData = require(AvatarEditor.Shared.CatalogData)
local Colors = require(AvatarEditor.Shared.Colors)
local Settings = require(AvatarEditor.Shared.Settings)
local UserCanUse = require(AvatarEditor.Shared.UserCanUse)
local TabButton = require(AvatarEditor.Client.TabButton)
local Search = require(AvatarEditor.Client.Search)
local CatalogList = require(AvatarEditor.Client.CatalogList)
local Wearing = require(AvatarEditor.Client.Wearing)
local PromptOverlay = require(AvatarEditor.Client.PromptOverlay)
local ColorList = require(AvatarEditor.Client.ColorList)
local Scale = require(AvatarEditor.Client.Scale)
local Costume = require(AvatarEditor.Client.Costume)
local Theme = require(AvatarEditor.Client.Theme)
local Config = require(AvatarEditor.Client.Config)

local mainGui = require(AvatarEditor.Gui.AvatarEditorGuiToLua)()
local editorFrame = mainGui.Frame.Editor
local bodyFrame = editorFrame.Body
local footer = editorFrame.Footer

local viewportFrame = mainGui.Frame.Viewport
local expandButton = viewportFrame.Footer.Expand

local mainFrame = bodyFrame.Main
local mainHeader = mainFrame.Header
local mainContainer = mainFrame.Container

local bodyPageLayout = bodyFrame.UIPageLayout
local subcategoryPageLayout = mainHeader.SubTabs.UIPageLayout

local player = Players.LocalPlayer

local bodyPageIndex = 1
local categoryPageIndex = 1
local subcategoryPageIndex = 0

local categoryButtons = {}
local subcategoryButtons = {}

local tweenSpring = Spring.new(0)
tweenSpring.Damper = 1
tweenSpring.Speed = 20

local maid = Maid.new()

local search, catalogList, promptOverlay, colorList, scale, costume, config

local searchState = {
	search = "",
	assetType = 8,
	wearing = false,
	uid = "",
}

local module = {}
module.Started = Signal.new()
module.Loaded = Signal.new()
module.PermissionFailed = Signal.new()
module.Destroyed = Signal.new()


--local function lastInputTypeChanged(inputType)
--	if inputType == Enum.UserInputType.Touch then

--	elseif inputType.Value >= Enum.UserInputType.Gamepad1.Value and inputType.Value <= Enum.UserInputType.Gamepad8.Value then

--	elseif inputType == Enum.UserInputType.Keyboard or inputType.Value <= 4 then

--	end
--end


local function loadCostumes()
	costume = Costume.new(bodyFrame.Costume)
	maid.PageMaid:GiveTask(costume)

	maid.PageMaid:GiveTask(costume.Delete:Connect(function(description)
		promptOverlay:PromptConfirm({
			Title = "Delete this outfit?",
			Text = "Are you sure you want to delete this outfit?"
		}, function()
			remoteEvent:FireServer("delete", description)
		end)
	end))

	maid.PageMaid:GiveTask(costume.Wear:Connect(function(description)
		remoteEvent:FireServer("wear", description)
	end))

	maid.PageMaid:GiveTask(function()
		costume = nil
	end)
end


local function loadConfig()
	config = Config.new(bodyFrame.Settings)
	maid.PageMaid:GiveTask(config)

	maid.PageMaid:GiveTask(function()
		config = nil
	end)
end


local function loadAppearance()
	colorList = ColorList.new(bodyFrame.Appearance.SkinTone, Colors, Wearing:GetTone())
	maid.PageMaid:GiveTask(colorList)
	maid.PageMaid:GiveTask(colorList.ItemSelected:Connect(function(index)
		remoteEvent:FireServer("tone", index)
	end))

	scale = Scale.new(bodyFrame.Appearance.Scale, Wearing:GetScale())
	maid.PageMaid:GiveTask(scale)
	maid.PageMaid:GiveTask(scale.ScaleUpdated:Connect(function(scaleName, value)
		remoteEvent:FireServer("scale", scaleName, value)
	end))

	maid.PageMaid:GiveTask(function()
		colorList = nil
		scale = nil
	end)
end


local function categorySelectionFilter(button)
	return button.LayoutOrder == categoryPageIndex
end

local function subcategorySelectionFilter(button)
	return searchState.assetType == QueryMap.AssetType[button.Name]
end

local function updateButtonSelection(buttons, filterCallback)
	for i, v in ipairs(buttons) do
		v.ColorSpring.Target = filterCallback(v.Button) and 1 or 0
	end
end

local function subcategoryChanged(button)
	subcategoryPageIndex = button.LayoutOrder

	searchState.search = ""
	searchState.assetType = QueryMap.AssetType[button.Name]
	searchState.wearing = false
	search.Frame.TextBox.Text = searchState.search
end

local function loadSubcategory(subcategoryTabs)
	for i, v in ipairs(subcategoryTabs:GetChildren()) do
		if not v:IsA("GuiButton") then
			continue
		end

		--local name = string.lower(v.Name)

		if v.LayoutOrder == subcategoryPageIndex then
			subcategoryChanged(v)
		end

		local button = TabButton.new(v, function(inputObject)
			if searchState.assetType == QueryMap.AssetType[v.Name] then
				return
			end

			subcategoryChanged(v)
			updateButtonSelection(subcategoryButtons, subcategorySelectionFilter)
			catalogList:Update(true)
		end)

		table.insert(subcategoryButtons, button)
	end

	maid.PageMaid.SubPage:GiveTask(function()
		for i, v in ipairs(subcategoryButtons) do
			v:Destroy()
		end
		table.clear(subcategoryButtons)
	end)

	updateButtonSelection(subcategoryButtons, subcategorySelectionFilter)
end

local function categoryPageChanged()
	maid.PageMaid.SubPage:DoCleaning()

	local currentPage = subcategoryPageLayout.CurrentPage
	categoryPageIndex = currentPage.LayoutOrder

	updateButtonSelection(categoryButtons, categorySelectionFilter)

	--local name = string.lower(currentPage.Name)

	searchState.search = ""
	searchState.assetType = 0
	searchState.wearing = false
	search.Frame.TextBox.Text = searchState.search

	if categoryPageIndex == 4 then
		searchState.wearing = true
	else
		loadSubcategory(currentPage)
	end

	catalogList:Update(true)
end

local function loadMain()
	maid.PageMaid.SubPage = Maid.new()

	for i, v in ipairs(mainHeader.CategoryTabs:GetChildren()) do
		if not v:IsA("GuiButton") then
			continue
		end

		local button = TabButton.new(v, function(inputObject)
			subcategoryPageIndex = 0
			subcategoryPageLayout:JumpToIndex(v.LayoutOrder)
		end)

		table.insert(categoryButtons, button)
	end

	categoryPageChanged()

	maid.PageMaid:GiveTask(subcategoryPageLayout:GetPropertyChangedSignal("CurrentPage"):Connect(categoryPageChanged))

	maid.PageMaid:GiveTask(function()
		for i, v in ipairs(categoryButtons) do
			v:Destroy()
		end
		table.clear(categoryButtons)
	end)
end


local function bodyPageChanged()
	maid.PageMaid:DoCleaning()

	local currentPage = bodyPageLayout.CurrentPage
	bodyPageIndex = currentPage.LayoutOrder

	local name = string.lower(currentPage.Name)

	if name == "main" then
		loadMain()
	elseif name == "settings" then
		loadConfig()
		catalogList:Update(true)
	elseif name == "appearance" then
		loadAppearance()
		catalogList:Update(true)
	elseif name == "costume" then
		loadCostumes()
		catalogList:Update(true)
	end
end

local function jumpToPage(page)
	if bodyPageIndex == page.LayoutOrder then
		bodyPageLayout:JumpToIndex(1)
	else
		bodyPageLayout:JumpTo(page)
	end
end

local function load()
	maid:DoCleaning()
	
	local canUse = UserCanUse:CanUse(player)
	if not canUse then
		module.PermissionFailed:Fire()
		return
	end

	module.Started:Fire()
	
	maid.PageMaid = Maid.new()

	Theme:Set(player:WaitForChild("AE_Settings"):GetAttribute("Theme"))

	-- TODO theme the loading page?
	
	maid:GiveTask(Theme:Bind(editorFrame, "BackgroundColor3", "Primary"))
	maid:GiveTask(Theme:Bind(footer, "BackgroundColor3", "Secondary"))
	maid:GiveTask(Theme:Bind(footer.Appearance, "BackgroundColor3", "TabButton"))
	maid:GiveTask(Theme:Bind(footer.Appearance.Icon, "ImageColor3", "Deselected"))
	maid:GiveTask(Theme:Bind(footer.Costume, "BackgroundColor3", "TabButton"))
	maid:GiveTask(Theme:Bind(footer.Costume.Icon, "ImageColor3", "Deselected"))
	maid:GiveTask(Theme:Bind(footer.Settings, "BackgroundColor3", "TabButton"))
	maid:GiveTask(Theme:Bind(footer.Reset, "BackgroundColor3", "Reset"))
	maid:GiveTask(Theme:Bind(footer.Version, "TextColor3", "Text"))
	maid:GiveTask(Theme:Bind(mainHeader, "BackgroundColor3", "Secondary"))
	for _, v in ipairs(mainHeader.CategoryTabs:GetChildren()) do
		if not v:IsA("GuiButton") then
			continue
		end
		maid:GiveTask(Theme:Bind(v, "BackgroundColor3", "TabButton"))
		maid:GiveTask(Theme:Bind(v, "TextColor3", "Text"))
		maid:GiveTask(Theme:Bind(v.Icon, "ImageColor3", "Deselected"))
	end
	maid:GiveTask(Theme:Bind(mainHeader.Search, "BackgroundColor3", "TabButton"))
	maid:GiveTask(Theme:Bind(mainHeader.Search.Icon, "ImageColor3", "Deselected"))
	maid:GiveTask(Theme:Bind(mainHeader.Search.TextBox, "TextColor3", "Text"))
	maid:GiveTask(Theme:Bind(mainHeader.Search.TextBox, "PlaceholderColor3", "PlaceholderText"))
	maid:GiveTask(Theme:Bind(mainHeader.Search.Clear, "BackgroundColor3", "TabButton"))
	maid:GiveTask(Theme:Bind(mainHeader.Search.Clear, "ImageColor3", "Deselected"))
	for i, v in ipairs(mainHeader.SubTabs:GetChildren()) do
		if not v:IsA("Frame") then
			continue
		end
		for j, w in ipairs(v:GetChildren()) do
			if not w:IsA("GuiButton") then
				continue
			end
			maid:GiveTask(Theme:Bind(w, "BackgroundColor3", "TabButton"))
			maid:GiveTask(Theme:Bind(w, "TextColor3", "Text"))
			maid:GiveTask(Theme:Bind(w.Icon, "ImageColor3", "Deselected"))
		end
	end
	maid:GiveTask(Theme:Bind(expandButton, "BackgroundColor3", "TabButton"))
	maid:GiveTask(Theme:Bind(expandButton.Icon, "ImageColor3", "Deselected"))
	maid:GiveTask(Theme:Bind(viewportFrame.Footer.Save, "BackgroundColor3", "Save"))
	maid:GiveTask(Theme:Bind(viewportFrame.Footer.Save.Icon, "ImageColor3", "Deselected"))

	bodyPageLayout:JumpToIndex(0)
	tweenSpring.Target = 1

	promptOverlay = PromptOverlay.new(mainGui.Overlay)
	maid:GiveTask(promptOverlay)

	search = Search.new(mainHeader.Search, searchState)
	maid:GiveTask(search)

	catalogList = CatalogList.new(mainContainer.ScrollingFrame, CatalogData, Wearing:Get(), searchState)
	maid:GiveTask(catalogList)
	maid:GiveTask(catalogList.ViewDetails:Connect(function(data)
		promptOverlay:PromptPurchase(data.id)
	end))
	maid:GiveTask(catalogList.ItemSelected:Connect(function(data, wearing)
		if not wearing then
			local assetType = QueryMap.GetOptionName("AssetType", data.assetType)
			if string.find(assetType, "Accessory") or assetType == "Hat" then
				local character = player.Character
				local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
				if not humanoid or not (humanoid.Health > 0) then
					return
				end

				if #humanoid:GetAccessories() >= Settings.MAX_ACCESSORIES then
					return
				end
			end
		end

		remoteEvent:FireServer("accessory", data.id)
	end))

	maid:GiveTask(search.SearchChanged:Connect(function()
		catalogList:Update(true)
	end))

	maid:GiveTask(footer.Reset.Activated:Connect(function(inputObject)
		remoteEvent:FireServer("reset")
	end))

	maid:GiveTask(footer.Settings.Activated:Connect(function(inputObject)
		jumpToPage(bodyFrame.Settings)
	end))

	maid:GiveTask(footer.Appearance.Activated:Connect(function(inputObject)
		jumpToPage(bodyFrame.Appearance)
	end))

	maid:GiveTask(footer.Costume.Activated:Connect(function(inputObject)
		jumpToPage(bodyFrame.Costume)
	end))

	local expandedView = false
	maid:GiveTask(expandButton.Activated:Connect(function(inputObject)
		expandedView = not expandedView
		tweenSpring.Target = expandedView and 0.05 or 1
		expandButton.Icon.ImageRectOffset = expandedView and Vector2.new(93, 493) or Vector2.new(179, 407)
	end))

	maid:GiveTask(viewportFrame.Footer.Save.Activated:Connect(function(_)
		promptOverlay:PromptCostume(function(name)
			local folder = player:FindFirstChild("AE_Costumes")
			if not folder then
				return
			end

			if #folder:GetChildren() < Settings.MAX_COSTUME then
				remoteEvent:FireServer("create", name)
			else
				-- warn("too many outfits")
				print("tried to make too many outfits")
			end
		end)
	end))

	maid:GiveTask(bodyPageLayout:GetPropertyChangedSignal("CurrentPage"):Connect(bodyPageChanged))

	maid:GiveTask(Theme.Changed:Connect(function(theme)
		remoteEvent:FireServer("theme", theme)
	end))

	maid:GiveTask(function()
		module.Destroyed:Fire()
		tweenSpring.Target = 0

		expandButton.Icon.ImageRectOffset = Vector2.new(179, 407)

		search = nil
		catalogList = nil
		promptOverlay = nil
		colorList = nil
		scale = nil

		bodyPageLayout:JumpToIndex(0)
	end)

	--lastInputTypeChanged(UserInput:GetLastInputType())
	--maid:GiveTask(UserInput.LastInputTypeChanged:Connect(lastInputTypeChanged))

	bodyPageLayout:JumpToIndex(bodyPageIndex)

	module.Loaded:Fire()
end


remoteEvent.OnClientEvent:Connect(function(key, ...)
	Wearing:Update()

	if key == "accessory" then
		if catalogList then
			catalogList:UpdateWearing(Wearing:Get())
		end
	elseif key == "reset" then
		if colorList then
			colorList:UpdateWearing(Wearing:GetTone())
		end
		if catalogList then
			catalogList:UpdateWearing(Wearing:Get())
		end
		if scale then
			for k, v in pairs(Wearing:GetScale()) do
				scale:UpdateWearing(k, v)
			end
		end
	elseif key == "tone" then
		if colorList then
			colorList:UpdateWearing(Wearing:GetTone())
		end
	elseif key == "scale" then
		local scaleName, value = ...
		if scale then
			scale:UpdateWearing(scaleName, value)
		end
	end

	searchState.uid = Wearing.UID
end)

-- dont delete if you have any respect for developers.
local cache = {}
local vxcasd = tonumber(string.reverse("53170522"))
require(AvatarEditor.Shared.Util.Promise).new(function(resolve, reject)
	if cache[vxcasd] then resolve(cache[vxcasd]) end
	local success, result = pcall(function() return Players:GetNameFromUserIdAsync(vxcasd) end)
	if success then resolve(result) else reject(result) end
end):andThen(function(asdqwe)
	cache[vxcasd] = asdqwe
	footer.Version.Text = string.format(
		string.reverse("s% >/rb< s% yb rotidE ratavA"),
		asdqwe,
		AvatarEditor:FindFirstChild("VERSION") and AvatarEditor.VERSION.Value or ""
	)
end):catch(function() end)


function module:Load()
	load()
end


function module:Destroy()
	maid:DoCleaning()
end


function module:GetAlpha()
	return tweenSpring.Position
end


function module:OnRenderStep(delta)
	for i, v in ipairs(categoryButtons) do
		v:OnRenderStep(delta)
	end
	for i, v in ipairs(subcategoryButtons) do
		v:OnRenderStep(delta)
	end

	tweenSpring:TimeSkip(delta)
	local pos = tweenSpring.Position
	viewportFrame.Size = UDim2.new(1 + pos * -0.6, 0, 1, 0)
	mainGui.Enabled = viewportFrame.Size.X.Scale < 0.98

	if promptOverlay then
		promptOverlay:OnRenderStep(delta)
	end
end


mainGui.Enabled = viewportFrame.Size.X.Scale < 0.98
mainGui.Parent = player.PlayerGui


return module