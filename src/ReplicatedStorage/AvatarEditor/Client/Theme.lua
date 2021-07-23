-- Class
-- 0_1195
-- January 10, 2021

--[[



]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local AvatarEditor = ReplicatedStorage.AvatarEditor
local Signal = require(AvatarEditor.Shared.Util.Signal)
local Maid = require(AvatarEditor.Shared.Util.Maid)
local Settings = require(AvatarEditor.Shared.Settings)

local themesFolder = AvatarEditor.Themes

local currentTheme = require(themesFolder[Settings.DEFAULT_THEME])
local currentName = Settings.DEFAULT_THEME


local module = {}
module.Changed = Signal.new()


function module:GetColor(style)
	return currentTheme[style]
end


function module:Set(themeName)
	if currentName == themeName then
		return
	end
	
	local themeModule = themesFolder:FindFirstChild(themeName)
	if themeModule then
		currentTheme = nil
		currentTheme = require(themeModule)
		currentName = themeModule.Name
		
		module.Changed:Fire(themeName)
	else
		warn(themeName, "not a valid theme")
	end
end


function module:Bind(frame, property, style)
	local connections = Maid.new()
	--maid:GiveTask(connections)
	--local ancestorChangedConnection, themeChangedConnection
	local function update()
		frame[property] = self:GetColor(style)
	end
	update()
	connections:GiveTask(module.Changed:Connect(update))
	connections:GiveTask(frame.AncestryChanged:Connect(function(_, parent)
		if not parent then
			connections:DoCleaning()
			update = nil
		end
	end))
	return connections
end


function module:GetAll()
	local themes = {}
	local themeModules = themesFolder:GetChildren()
	table.sort(themeModules, function(a, b)
		return a.Name < b.Name
	end)
	for i, v in ipairs(themeModules) do
		table.insert(themes, v.Name)
	end
	return themes
end


return module
