-- Class
-- 0_1195
-- January 10, 2021

--[[

One button to install/update the avatar editor
One button to add items to the list

]]

local VERSION_URL = "https://raw.githubusercontent.com/Y1195/AE2/master/version.txt"
local FILELIST_URL = "https://raw.githubusercontent.com/Y1195/AE2/master/filelist.json"
local CATALOG_MODEL_URL = "http://www.roblox.com/asset/?id=7130988837"
local VERSION_OBJ_NAME = "VERSION"
local DEFAULT_SETTINGS = {
	AE_OverwriteSettings = false,
	AE_OverwriteCatalog = true,
	AE_QuickStart = true,
}
local ASSET_TYPE_MAP = {
	-- ["T-Shirt"] = 2,
	Hat = 8,
	Shirt = 11,
	Pants = 12,
	Head = 17,
	Face = 18,
	-- Gear = 19,
	-- Arms = 25,
	-- Legs = 26,
	Torso = 27,
	RightArm = 28,
	LeftArm = 29,
	LeftLeg = 30,
	RightLeg = 31,
	HairAccessory = 41,
	FaceAccessory = 42,
	NeckAccessory = 43,
	ShoulderAccessory = 44,
	FrontAccessory = 45,
	BackAccessory = 46,
	WaistAccessory = 47,
	ClimbAnimation = 48,
	DeathAnimation = 49,
	FallAnimation = 50,
	IdleAnimation = 51,
	JumpAnimation = 52,
	RunAnimation = 53,
	SwimAnimation = 54,
	WalkAnimation = 55,
	PoseAnimation = 56,
	EmoteAnimation = 61,
}

local Http = game:GetService("HttpService")
local ChangeHistory = game:GetService("ChangeHistoryService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Marketplace = game:GetService("MarketplaceService")

local CheckBoxLabel = require(script.CheckboxLabel)
local Dropdown = require(script.Dropdown)
local Theme = require(script.Theme)
local Promise = require(script.Promise)
local RequestQueue = require(script.RequestQueue)
local Encode = require(script.Encode)
-- local Maid = require(script.Maid)
local InstallerFrameToLua = require(script.Gui.InstallerFrameToLua)
local FrameToLua = require(script.Gui.FrameToLua)
local AdderFrameToLua = require(script.Gui.AdderFrameToLua)
local SuccessFrameToLua = require(script.Gui.SuccessFrameToLua)

local toolbar = plugin:CreateToolbar("Avatar Editor")
local installerButton = toolbar:CreateButton("Installer", "Install/update the Avatar Editor", "")
local adderButton = toolbar:CreateButton("Adder", "Add accessories to the database.", "")

installerButton.ClickableWhenViewportHidden = true
adderButton.ClickableWhenViewportHidden = true

local dockWidgetPluginInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Float, false, true, 250, 387, 250, 387)
local installerGui = plugin:CreateDockWidgetPluginGui("AvatarEditorInstallerPlugin", dockWidgetPluginInfo)
installerGui.Name = "AvatarEditorInstaller"
installerGui.Title = "Avatar Editor Installer"
installerGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local dockWidgetPluginInfoAdder = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Float, false, true, 250, 676, 250, 676)
local adderGui = plugin:CreateDockWidgetPluginGui("AvatarEditorAdderPlugin", dockWidgetPluginInfoAdder)
adderGui.Name = "AvatarEditorAdder"
adderGui.Title = "Avatar Editor Adder"
adderGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local installerFrame = InstallerFrameToLua()
installerFrame.Size = UDim2.new(1, 0, 1, 0)
installerFrame.Position = UDim2.new()
installerFrame.Body.UIPageLayout.ScrollWheelInputEnabled = false
installerFrame.Parent = installerGui

local adderFrame = AdderFrameToLua()
adderFrame.Size = UDim2.new(1, 0, 1, 0)
adderFrame.Position = UDim2.new()
adderFrame.Body.UIPageLayout.ScrollWheelInputEnabled = false
adderFrame.Parent = adderGui

local templateButton = FrameToLua()
local templateSuccessFrame = SuccessFrameToLua()

local installerOn = false
local adderOn = false

local pendingChanges = {}
local assetsToProcess = {}
local modelAssetType = 8


local function httpGet(url)
	return Promise.new(function(resolve, reject)
		local success, result = pcall(function()
			return Http:RequestAsync({
				Url = url,
				Method = "GET",
			})
		end)
		if success then
			resolve(result)
		else
			reject(result)
		end
	end)
end


local function httpGetJSON(url)
	return Promise.new(function(resolve, reject)
		httpGet(url)
		:andThen(function(result)
			return Promise.new(function(resolve2)
				local success, json = pcall(function()
					return Http:JSONDecode(result.Body)
				end)
				if success then
					resolve2(result, json)
				else
					reject(result, json)
				end
			end)
		end)
		:andThen(function(result, json)
			resolve(result, json)
		end)
	end)
end


local function GetScriptClass(name)
	if (name:match("%.server%.lua$")) then
		return "Script", name:match("(.+)%.server%.lua$")
	elseif (name:match("%.client%.lua$")) then
		return "LocalScript", name:match("(.+)%.client%.lua$")
	else
		return "ModuleScript", name:match("(.+)%.lua$")
	end
end

local function HasInit(dir)
	for _,child in pairs(dir.children) do
		if (child.name:match("^init%.")) then
			return true, GetScriptClass(child.name)
		end
	end
	return false
end


local function updateVersion(_version)
	local ae = ReplicatedStorage:FindFirstChild("AvatarEditor")
	if ae then
		local versionObj = ae:FindFirstChild(VERSION_OBJ_NAME)
		if ((not versionObj) or (not versionObj:IsA("StringValue"))) then
			versionObj = Instance.new("StringValue")
			versionObj.Name = VERSION_OBJ_NAME
			versionObj.Parent = ae
		end
		versionObj.Value = _version
	end
end


local function startDownload(overwriteSettings, overwriteCatalog, quickStart)

	local function displayError(text)
		local failPage = installerFrame.Body.Fail
		failPage.TextLabel.Text = text
		installerFrame.Body.UIPageLayout:JumpToIndex(3)
	end

	installerFrame.Body.UIPageLayout:JumpToIndex(1)
	
	local progressPage = installerFrame.Body.Progress
	local statusLabel = progressPage.TextFrame.TextLabel
	local progressBar = progressPage.Bar.Fill
	local progressLabel = progressPage.TextLabel

	progressBar.Size = UDim2.new(0, 0, 1, 0)

	progressLabel.Text = ""
	statusLabel.Text = "Getting latest version..."
	local versionResult = httpGet(VERSION_URL):expect()
	if not versionResult.Success then
		displayError("Failed to get version list" .. versionResult.StatusMessage)
		return
	end

	statusLabel.Text = "Getting file list..."
	local filelistRes, filelist = httpGetJSON(FILELIST_URL):expect()
	if (not filelistRes.Success) then
		displayError("Failed to get file list" .. filelistRes.StatusMessage)
		return
	end

	local numFiles = 0
	local numFilesFetched = 0

	filelist.paths.parent = {
		path = filelist.url;
	}
	filelist.paths.folder = {
		FindFirstChild = function(t, i)
			return game:GetService(i)
		end;
	}

	pendingChanges = {}

	ChangeHistory:SetWaypoint("AE_InstallBegin")

	progressLabel.Text = "0%"

	local function CountAll(dir)
		for _, v in pairs(dir.children) do
			numFiles = (numFiles + 1)
			if (v.type == "directory") then
				CountAll(v)
			end
		end
	end

	local function IncrementFilesFetched()
		numFilesFetched = (numFilesFetched + 1)
		progressBar.Size = UDim2.new(numFilesFetched / numFiles, 0, 1, 0)
		progressLabel.Text = ("%i / %i (%i%%)"):format(numFilesFetched, numFiles, (numFilesFetched / numFiles) * 100)
	end

	local function FetchSource(s, path, force)
		local sourceResult = httpGet(path):expect()
		if (not sourceResult.Success) then
			ChangeHistory:SetWaypoint("AE_InstallFail")
			displayError(sourceResult.StatusMessage)
			return
		end
		local source = sourceResult.Body
		if (force or s.Source ~= source) then
			table.insert(pendingChanges, {
				Script = s;
				NewSource = source;
			})
		end
	end

	local function BuildPath(dir)
		dir.path = (dir.parent.path .. dir.name .. "/")
		for i, item in pairs(dir.children) do
			IncrementFilesFetched()
			if (not quickStart) and (item.name == "Script" or item.name == "LocalScript") then
				continue
			end
			if (item.type == "directory") then
				local f = dir.folder:FindFirstChild(item.name)
				local hasInit, class = HasInit(item)
				if (f) then
					if (hasInit) then
						local ext = (class == "Script" and ".server.lua" or class == "LocalScript" and ".client.lua" or ".lua")
						FetchSource(f, dir.path .. item.name .. "/init" .. ext, false)
					end
				else
					f = Instance.new(class or "Folder")
					f.Name = item.name
					if (hasInit) then
						local ext = (class == "Script" and ".server.lua" or class == "LocalScript" and ".client.lua" or ".lua")
						FetchSource(f, dir.path .. item.name .. "/init" .. ext, true)
					end
					f.Parent = dir.folder
				end
				item.folder = f
				item.parent = dir
				BuildPath(item)
			elseif (item.type == "file") then
				if (not item.name:match("^init%.")) then
					local class, scriptName = GetScriptClass(item.name)
					local s = dir.folder:FindFirstChild(scriptName)
					-- local originalS = nil
					if (s and s.ClassName ~= class) then
						-- originalS = s
						s.Parent = nil
						s = nil
					end
					if (s) then
						FetchSource(s, dir.path .. item.name, false)
					else
						s = Instance.new(class)
						s.Name = scriptName
						s.Parent = dir.folder
						FetchSource(s, dir.path .. item.name, true)
					end
				end
			else
				error("Unknown type: " .. tostring(item.type))
			end
		end
	end

	CountAll(filelist.paths)
	BuildPath(filelist.paths)

	for _, update in ipairs(pendingChanges) do
		if (not overwriteSettings) and (update.Script.Name == "Settings") and not (update.Script.Source == "") then
			continue
		end
		-- if (update.Selected) then
			update.Script.Source = update.NewSource
		-- end
	end
	pendingChanges = {}

	if overwriteCatalog then
		wait(0.5)

		progressLabel.Text = "0%"
		progressBar.Size = UDim2.new(0, 0, 1, 0)

		statusLabel.Text = "Getting catalog data..."
		local items = game:GetObjects(CATALOG_MODEL_URL)
		ReplicatedStorage.AvatarEditor.Shared.CatalogData:ClearAllChildren()
		for _, v in ipairs(items) do
			v.Parent = ReplicatedStorage.AvatarEditor.Shared.CatalogData
		end

		wait(0.5) -- LOL

		progressLabel.Text = "100%"
		progressBar.Size = UDim2.new(1, 0, 1, 0)
	end

	wait(0.5)

	progressLabel.Text = ""
	statusLabel.Text = "Done"
	updateVersion(versionResult.Body)
	ChangeHistory:SetWaypoint("AE_InstallEnd")

	wait(0.5)

	installerFrame.Body.UIPageLayout:JumpToIndex(2)
end


local function updateIdList()
	for i, v in ipairs(adderFrame.Body.Main.ScrollingFrame:GetChildren()) do
		if v:IsA("Frame") then
			v:Destroy()
		end
	end

	for i, data in ipairs(assetsToProcess) do
		-- TODO bind to theme
		local button = templateButton:Clone()
		button.TextLabel.Text = data.id
		button.LayoutOrder = i
		if data.add then
			button.IconLabel.Text = "+"
			button.IconLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
		else
			button.IconLabel.Text = "-"
			button.IconLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
		end
		button.TextButton.Activated:Connect(function(inputObject)
			table.remove(assetsToProcess, i)
			updateIdList() -- not sure if this will cause problems
		end)
		button.Parent = adderFrame.Body.Main.ScrollingFrame
	end
end


local function addAssetId(data)
	assert(typeof(data) == "table", "addAssetId needs to be table")

	for i, v in ipairs(assetsToProcess) do
		if v.id == data.id then
			print("id already added")
			return
		end
	end

	table.insert(assetsToProcess, data)
	updateIdList()
end


local function clearSuccessPage()
	local successPage = adderFrame.Body.Success
	for i, v in ipairs(successPage.ScrollingFrame:GetChildren()) do
		if v:IsA("Frame") then
			v:Destroy()
		end
	end
end


local function startUpdating()

	local function displayError(text)
		local failPage = adderFrame.Body.Fail
		failPage.TextLabel.Text = text
		adderFrame.Body.UIPageLayout:JumpToIndex(3)
	end

	adderFrame.Body.UIPageLayout:JumpToIndex(1)

	local progressPage = adderFrame.Body.Progress
	local statusLabel = progressPage.TextFrame.TextLabel
	local progressBar = progressPage.Bar.Fill
	local progressLabel = progressPage.TextLabel

	progressBar.Size = UDim2.new(0, 0, 1, 0)

	progressLabel.Text = ""
	statusLabel.Text = "Confirming AvatarEditor..."

	local aeFolder = ReplicatedStorage:FindFirstChild("AvatarEditor")
	local sharedFolder = aeFolder and aeFolder:FindFirstChild("Shared")
	local catalogData = sharedFolder and sharedFolder:FindFirstChild("CatalogData")
	if not catalogData then
		displayError("AvatarEditor is not installed.")
		return
	end

	statusLabel.Text = "Caching catalog data..."

	local list = {}
	local assets = require(catalogData)
	for i, v in ipairs(assets) do
		list[v.id] = {
			data = v,
			index = i,
		}
	end

	local assetsProcessed = 0
	local numAssets = #assetsToProcess

	local successCount, failCount = 0, 0
	local successStatus = {}

	local function incrementAssetsProcess()
		assetsProcessed += 1
		progressBar.Size = UDim2.new(assetsProcessed / numAssets, 0, 1, 0)
		progressLabel.Text = ("%i / %i (%i%%)"):format(assetsProcessed, numAssets, (assetsProcessed / numAssets) * 100)
	end

	local function updateData()
		local stringValues = Encode(assets)
		catalogData:ClearAllChildren()
		for i, v in ipairs(stringValues) do
			v.Parent = catalogData
		end
	end

	clearSuccessPage()

	local queue = RequestQueue.new(false, RequestQueue.RejectionHandling.WARN)

	queue:resolved(function(productInfos)
		wait(0.5)
		
		statusLabel.Text = "Encoding..."
		progressLabel.Text = "0%"
		progressBar.Size = UDim2.new(0, 0, 1, 0)

		assetsToProcess = {}
		updateIdList()

		for i, productInfo in ipairs(productInfos) do
			if list[productInfo.AssetId] then
				-- print(productInfo.AssetId, "is already added")
				continue
			end

			local data = {
				id = productInfo.AssetId,
				name = productInfo.Name,
				assetType = productInfo.AssetTypeId,
			}
			-- print("added", productInfo.AssetId)
			successStatus[productInfo.AssetId] = true
			successCount += 1
			table.insert(assets, data)
			list[productInfo.AssetId] = {
				data = data,
				index = #assets,
			}
		end

		wait(0.5)

		updateData()

		progressLabel.Text = "100%"
		progressBar.Size = UDim2.new(1, 0, 1, 0)
		statusLabel.Text = "Done"
		ChangeHistory:SetWaypoint("AE_CatalogUpdateEnd")
		
		wait(0.5)

		local successFrame = adderFrame.Body.Success
		successFrame.TextLabel.Text = string.format("%d Success | %d Failed", successCount, failCount)

		for id, status in pairs(successStatus) do
			-- TODO bind to theme
			local frame = templateSuccessFrame:Clone()
			frame.TextLabel.Text = id
			if status then
				frame.SuccessLabel.Text = "Success"
				frame.SuccessLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
			else
				frame.SuccessLabel.Text = "Failed"
				frame.SuccessLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
			end
			frame.Parent = successFrame.ScrollingFrame
		end

		adderFrame.Body.UIPageLayout:JumpToIndex(2)
	end)

	statusLabel.Text = "Processing ids..."
	progressLabel.Text = "0%"

	for i, v in ipairs(assetsToProcess) do
		if not v.add then
			queue:enqueue(function()
				if list[v.id] then
					table.remove(assets, list[v.id].index)
				end
				return nil
			end)
		else
			queue:enqueue(function()
				local productInfo = Marketplace:GetProductInfo(v.id)
				local isValid = false
				for k, v in pairs(ASSET_TYPE_MAP) do
					if v == productInfo.AssetTypeId then
						isValid = true
						break
					end
				end
				if productInfo.AssetTypeId == 10 then
					productInfo.AssetTypeId = v.assetType
					isValid = true
				end
				if isValid then
					return productInfo
				end
				return error(v.id .. " is not a valid accessory or model")
			end):catch(function()
				successStatus[v.id] = false
				failCount += 1
				-- print(v.id, "failed to add")
			end):finally(function()
				incrementAssetsProcess()
			end)
		end
	end
end


local function installerActivate()
	clearSuccessPage()
	installerFrame.Body.UIPageLayout:JumpToIndex(0)
end


local function installerDeactivate()
	clearSuccessPage()
end


local function adderActivate()
	adderFrame.Body.UIPageLayout:JumpToIndex(0)
end


local function adderDeactivate()
end


local function setupPages()
	local overwriteSettingsSetting = plugin:GetSetting("AE_OverwriteSettings") or DEFAULT_SETTINGS.AE_OverwriteSettings
	local overwriteCatalogSetting = plugin:GetSetting("AE_OverwriteCatalog") or DEFAULT_SETTINGS.AE_OverwriteCatalog
	local quickStartSetting = plugin:GetSetting("AE_QuickStart") or DEFAULT_SETTINGS.AE_QuickStart

	do
		local mainFrame = installerFrame.Body.Main
		local dataFrame = mainFrame.Frame.DataFrame
		Theme:BindColor(installerFrame, "BackgroundColor3", Enum.StudioStyleGuideColor.MainBackground)
		Theme:BindColor(dataFrame.Frame.CheckContainer.CheckButton, "BackgroundColor3", Enum.StudioStyleGuideColor.CheckedFieldBackground)
		Theme:BindColor(dataFrame.Frame.CheckContainer.CheckButton.UIStroke, "Color", Enum.StudioStyleGuideColor.CheckedFieldBorder)
		Theme:BindColor(dataFrame.Frame.CheckContainer.CheckButton.Checkmark, "ImageColor3", Enum.StudioStyleGuideColor.MainText)
		Theme:BindColor(dataFrame.Frame.TextLabel, "TextColor3", Enum.StudioStyleGuideColor.MainText)
		Theme:BindColor(dataFrame.Line, "BackgroundColor3", Enum.StudioStyleGuideColor.BrightText)
		Theme:BindColor(dataFrame.TextLabel, "TextColor3", Enum.StudioStyleGuideColor.SubText)
		local settingsFrame = mainFrame.Frame.SettingsFrame
		Theme:BindColor(settingsFrame.Frame.CheckContainer.CheckButton, "BackgroundColor3", Enum.StudioStyleGuideColor.CheckedFieldBackground)
		Theme:BindColor(settingsFrame.Frame.CheckContainer.CheckButton.UIStroke, "Color", Enum.StudioStyleGuideColor.CheckedFieldBorder)
		Theme:BindColor(settingsFrame.Frame.CheckContainer.CheckButton.Checkmark, "ImageColor3", Enum.StudioStyleGuideColor.MainText)
		Theme:BindColor(settingsFrame.Frame.TextLabel, "TextColor3", Enum.StudioStyleGuideColor.MainText)
		Theme:BindColor(settingsFrame.Line, "BackgroundColor3", Enum.StudioStyleGuideColor.BrightText)
		Theme:BindColor(settingsFrame.TextLabel, "TextColor3", Enum.StudioStyleGuideColor.SubText)
		local starterFrame = mainFrame.Frame.StarterFrame
		Theme:BindColor(starterFrame.Frame.CheckContainer.CheckButton, "BackgroundColor3", Enum.StudioStyleGuideColor.CheckedFieldBackground)
		Theme:BindColor(starterFrame.Frame.CheckContainer.CheckButton.UIStroke, "Color", Enum.StudioStyleGuideColor.CheckedFieldBorder)
		Theme:BindColor(starterFrame.Frame.CheckContainer.CheckButton.Checkmark, "ImageColor3", Enum.StudioStyleGuideColor.MainText)
		Theme:BindColor(starterFrame.Frame.TextLabel, "TextColor3", Enum.StudioStyleGuideColor.MainText)
		Theme:BindColor(starterFrame.Line, "BackgroundColor3", Enum.StudioStyleGuideColor.BrightText)
		Theme:BindColor(starterFrame.TextLabel, "TextColor3", Enum.StudioStyleGuideColor.SubText)
		Theme:BindColor(mainFrame.TextButton, "TextColor3", Enum.StudioStyleGuideColor.ButtonText)
		Theme:BindColor(mainFrame.TextButton.UIStroke, "Color", Enum.StudioStyleGuideColor.ButtonBorder)
		local overwriteCatalogCheckbox = CheckBoxLabel.new(dataFrame.Frame)
		overwriteCatalogCheckbox:SetValue(overwriteCatalogSetting)
		overwriteCatalogCheckbox.Changed:Connect(function(bool)
			overwriteCatalogSetting = bool
			plugin:SetSetting("AE_OverwriteCatalog", overwriteCatalogSetting)
		end)
		local overwriteSettingsCheckbox = CheckBoxLabel.new(settingsFrame.Frame)
		overwriteSettingsCheckbox:SetValue(overwriteSettingsSetting)
		overwriteSettingsCheckbox.Changed:Connect(function(bool)
			overwriteSettingsSetting = bool
			plugin:SetSetting("AE_OverwriteSettings", overwriteSettingsSetting)
		end)
		local quickStartCheckbox = CheckBoxLabel.new(starterFrame.Frame)
		quickStartCheckbox:SetValue(quickStartSetting)
		quickStartCheckbox.Changed:Connect(function(bool)
			quickStartSetting = bool
			plugin:SetSetting("AE_QuickStart", quickStartSetting)
		end)
		mainFrame.TextButton.Activated:Connect(function(inputObject)
			startDownload(overwriteSettingsSetting, overwriteCatalogSetting, quickStartSetting)
		end)

		local progressPage = installerFrame.Body.Progress
		Theme:BindColor(progressPage.Bar, "BackgroundColor3", Enum.StudioStyleGuideColor.Titlebar)
		Theme:BindColor(progressPage.TextFrame.TextLabel, "TextColor3", Enum.StudioStyleGuideColor.MainText)
		Theme:BindColor(progressPage.TextLabel, "TextColor3", Enum.StudioStyleGuideColor.SubText)

		local successPage = installerFrame.Body.Success
		Theme:BindColor(successPage.TextFrame.TextLabel, "TextColor3", Enum.StudioStyleGuideColor.MainText)
		Theme:BindColor(successPage.TextButton, "TextColor3", Enum.StudioStyleGuideColor.ButtonText)
		Theme:BindColor(successPage.TextButton.UIStroke, "Color", Enum.StudioStyleGuideColor.ButtonBorder)
		successPage.TextButton.Activated:Connect(function(inputObject)
			installerGui.Enabled = false
		end)
		
		local failPage = installerFrame.Body.Fail
		Theme:BindColor(failPage.TextLabel, "TextColor3", Enum.StudioStyleGuideColor.ErrorText)
		Theme:BindColor(failPage.TextButton, "TextColor3", Enum.StudioStyleGuideColor.ButtonText)
		Theme:BindColor(failPage.TextButton.UIStroke, "Color", Enum.StudioStyleGuideColor.ButtonBorder)
		failPage.TextButton.Activated:Connect(function(inputObject)
			startDownload(overwriteSettingsSetting, overwriteCatalogSetting, quickStartSetting)
		end) -- TODO cancel button?

		local headerFrame = installerFrame.Header
		Theme:BindColor(headerFrame.Line, "BackgroundColor3", Enum.StudioStyleGuideColor.BrightText)
		Theme:BindColor(headerFrame.TextLabel, "TextColor3", Enum.StudioStyleGuideColor.MainText)
	end

	do
		local mainFrame = adderFrame.Body.Main
		local catalogFrame = mainFrame.Frame.CatalogFrame
		Theme:BindColor(adderFrame, "BackgroundColor3", Enum.StudioStyleGuideColor.MainBackground)
		Theme:BindColor(catalogFrame.Line, "BackgroundColor3", Enum.StudioStyleGuideColor.BrightText)
		Theme:BindColor(catalogFrame.TextFrame.TextLabel, "TextColor3", Enum.StudioStyleGuideColor.MainText)
		Theme:BindColor(catalogFrame.TextBox, "BackgroundColor3", Enum.StudioStyleGuideColor.InputFieldBackground)
		Theme:BindColor(catalogFrame.TextBox, "TextColor3", Enum.StudioStyleGuideColor.MainText)
		Theme:BindColor(catalogFrame.TextBox, "PlaceholderColor3", Enum.StudioStyleGuideColor.SubText)
		Theme:BindColor(catalogFrame.TextBox.UIStroke, "Color", Enum.StudioStyleGuideColor.InputFieldBorder)
		Theme:BindColor(catalogFrame.Buttons.Button1, "TextColor3", Enum.StudioStyleGuideColor.ButtonText)
		Theme:BindColor(catalogFrame.Buttons.Button1.UIStroke, "Color", Enum.StudioStyleGuideColor.ButtonBorder)
		Theme:BindColor(catalogFrame.Buttons.Button2, "BackgroundColor3", Enum.StudioStyleGuideColor.ErrorText)
		Theme:BindColor(catalogFrame.Buttons.Button2, "TextColor3", Enum.StudioStyleGuideColor.ButtonText)
		Theme:BindColor(catalogFrame.Buttons.Button2.UIStroke, "Color", Enum.StudioStyleGuideColor.ButtonBorder)
		Theme:BindColor(catalogFrame.TextLabel, "TextColor3", Enum.StudioStyleGuideColor.SubText)
		catalogFrame.Buttons.Button1.Activated:Connect(function(inputObject)
			local num = tonumber(catalogFrame.TextBox.Text)
			if num then
				catalogFrame.TextBox.Text = ""
				local data = {
					id = num,
					add = true
				}
				addAssetId(data)
			end
		end)
		catalogFrame.Buttons.Button2.Activated:Connect(function(inputObject)
			local num = tonumber(catalogFrame.TextBox.Text)
			if num then
				catalogFrame.TextBox.Text = ""
				local data = {
					id = num,
					add = false,
				}
				addAssetId(data)
			end
		end)
		local modelFrame = mainFrame.Frame.ModelFrame
		Theme:BindColor(modelFrame.Line, "BackgroundColor3", Enum.StudioStyleGuideColor.BrightText)
		Theme:BindColor(modelFrame.TextFrame.TextLabel, "TextColor3", Enum.StudioStyleGuideColor.MainText)
		Theme:BindColor(modelFrame.DropdownButton, "BackgroundColor3", Enum.StudioStyleGuideColor.Dropdown)
		Theme:BindColor(modelFrame.DropdownButton.UIStroke, "Color", Enum.StudioStyleGuideColor.InputFieldBorder)
		Theme:BindColor(modelFrame.DropdownButton.ListFrame, "BackgroundColor3", Enum.StudioStyleGuideColor.Dropdown)
		Theme:BindColor(modelFrame.DropdownButton.ListFrame.UIStroke, "Color", Enum.StudioStyleGuideColor.InputFieldBorder)
		Theme:BindColor(modelFrame.DropdownButton.ListFrame.ScrollFrame, "ScrollBarImageColor3", Enum.StudioStyleGuideColor.ScrollBar)
		Theme:BindColor(modelFrame.DropdownButton.Arrow, "ImageColor3", Enum.StudioStyleGuideColor.MainText)
		Theme:BindColor(modelFrame.DropdownButton.Option, "TextColor3", Enum.StudioStyleGuideColor.MainText)
		Theme:BindColor(modelFrame.TextBox, "BackgroundColor3", Enum.StudioStyleGuideColor.InputFieldBackground)
		Theme:BindColor(modelFrame.TextBox, "TextColor3", Enum.StudioStyleGuideColor.MainText)
		Theme:BindColor(modelFrame.TextBox, "PlaceholderColor3", Enum.StudioStyleGuideColor.SubText)
		Theme:BindColor(modelFrame.TextBox.UIStroke, "Color", Enum.StudioStyleGuideColor.InputFieldBorder)
		Theme:BindColor(modelFrame.TextButton, "TextColor3", Enum.StudioStyleGuideColor.ButtonText)
		Theme:BindColor(modelFrame.TextButton.UIStroke, "Color", Enum.StudioStyleGuideColor.ButtonBorder)
		Theme:BindColor(modelFrame.TextLabel, "TextColor3", Enum.StudioStyleGuideColor.SubText)
		for i, v in ipairs(modelFrame.DropdownButton.ListFrame.ScrollFrame:GetChildren()) do
			if v:IsA("GuiButton") then
				Theme:BindColor(v, "BackgroundColor3", Enum.StudioStyleGuideColor.Dropdown)
				Theme:BindColor(v, "TextColor3", Enum.StudioStyleGuideColor.MainText)
			end
		end
		local assetDropDown = Dropdown.new(modelFrame.DropdownButton, modelFrame.DropdownButton.ListFrame)
		assetDropDown:Set(modelFrame.DropdownButton.ListFrame.ScrollFrame.Hat)
		assetDropDown.Changed:Connect(function(option)
			-- print(option)
			modelAssetType = ASSET_TYPE_MAP[option]
		end)
		modelFrame.TextButton.Activated:Connect(function(inputObject)
			local num = tonumber(modelFrame.TextBox.Text)
			if num then
				modelFrame.TextBox.Text = ""
				local data = {
					id = num,
					add = true,
					assetType = modelAssetType
				}
				addAssetId(data)
			end
		end)
		modelFrame.DropdownButton.ListFrame.ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, modelFrame.DropdownButton.ListFrame.ScrollFrame.UIListLayout.AbsoluteContentSize.Y)
		Theme:BindColor(mainFrame.ScrollingFrame, "BackgroundColor3", Enum.StudioStyleGuideColor.ViewPortBackground)
		Theme:BindColor(mainFrame.ScrollingFrame.UIStroke, "Color", Enum.StudioStyleGuideColor.InputFieldBorder)
		Theme:BindColor(mainFrame.TextFrame.TextLabel, "TextColor3", Enum.StudioStyleGuideColor.MainText)
		Theme:BindColor(mainFrame.TextButton, "TextColor3", Enum.StudioStyleGuideColor.ButtonText)
		Theme:BindColor(mainFrame.TextButton.UIStroke, "Color", Enum.StudioStyleGuideColor.ButtonBorder)
		mainFrame.TextButton.Activated:Connect(function(inputObject)
			if #assetsToProcess > 0 then
				startUpdating()
			end
		end)

		local progressPage = adderFrame.Body.Progress
		Theme:BindColor(progressPage.Bar, "BackgroundColor3", Enum.StudioStyleGuideColor.Titlebar)
		Theme:BindColor(progressPage.TextFrame.TextLabel, "TextColor3", Enum.StudioStyleGuideColor.MainText)
		Theme:BindColor(progressPage.TextLabel, "TextColor3", Enum.StudioStyleGuideColor.SubText)

		local successPage = adderFrame.Body.Success
		Theme:BindColor(successPage.TextFrame.TextLabel, "TextColor3", Enum.StudioStyleGuideColor.MainText)
		Theme:BindColor(successPage.TextButton, "TextColor3", Enum.StudioStyleGuideColor.ButtonText)
		Theme:BindColor(successPage.TextButton.UIStroke, "Color", Enum.StudioStyleGuideColor.ButtonBorder)
		Theme:BindColor(successPage.ScrollingFrame, "BackgroundColor3", Enum.StudioStyleGuideColor.ViewPortBackground)
		Theme:BindColor(successPage.ScrollingFrame.UIStroke, "Color", Enum.StudioStyleGuideColor.InputFieldBorder)
		Theme:BindColor(successPage.TextLabel, "TextColor3", Enum.StudioStyleGuideColor.SubText)
		successPage.TextButton.Activated:Connect(function(inputObject)
			adderFrame.Body.UIPageLayout:JumpToIndex(0)
			clearSuccessPage()
		end)

		local failPage = adderFrame.Body.Fail
		Theme:BindColor(failPage.TextLabel, "TextColor3", Enum.StudioStyleGuideColor.ErrorText)
		Theme:BindColor(failPage.TextButton, "TextColor3", Enum.StudioStyleGuideColor.ButtonText)
		Theme:BindColor(failPage.TextButton.UIStroke, "Color", Enum.StudioStyleGuideColor.ButtonBorder)
		failPage.TextButton.Activated:Connect(function(inputObject)
			adderFrame.Body.UIPageLayout:JumpToIndex(0)
		end)

		local headerFrame = adderFrame.Header
		Theme:BindColor(headerFrame.Line, "BackgroundColor3", Enum.StudioStyleGuideColor.BrightText)
		Theme:BindColor(headerFrame.TextLabel, "TextColor3", Enum.StudioStyleGuideColor.MainText)
	end
end

setupPages()

local function onInstallerClick()
	installerOn = not installerOn
	installerButton:SetActive(installerOn)
	installerGui.Enabled = installerOn
	if installerOn then
		installerActivate()
	else
		installerDeactivate()
	end
end

local function onAdderClick()
	adderOn = not adderOn
	adderButton:SetActive(adderOn)
	adderGui.Enabled = adderOn
	if adderOn then
		adderActivate()
	else
		adderDeactivate()
	end
end

installerButton.Click:Connect(onInstallerClick)
adderButton.Click:Connect(onAdderClick)

installerGui:GetPropertyChangedSignal("Enabled"):Connect(function()
	if installerOn ~= installerGui.Enabled then
		onInstallerClick()
	end
end)

adderGui:GetPropertyChangedSignal("Enabled"):Connect(function()
	if adderOn ~= adderGui.Enabled then
		onAdderClick()
	end
end)