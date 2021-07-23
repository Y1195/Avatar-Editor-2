-- Theme
-- Crazyman32
-- August 15, 2018
-- Modified by 0_1195

--[[
	
	theme:Get()
	theme:GetColor(color, modifier)
	theme:BindColor(object, property, color [, modifier])
	
--]]



local Theme = {}

local studio = settings().Studio
local themeChanged = Instance.new("BindableEvent")

Theme.Changed = themeChanged.Event

studio.ThemeChanged:Connect(function()
	themeChanged:Fire(studio.Theme)
end)


function Theme:Get()
	return studio.Theme
end


function Theme:GetColor(color, modifier)
	return self:Get():GetColor(color, modifier or Enum.StudioStyleGuideModifier.Default)
end


function Theme:_bind(object, property, color, modifier)
	local themeChangedConnection
	local parentChangedConnection

	if (not modifier) then
		modifier = Enum.StudioStyleGuideModifier.Default
	end

	local function update(theme)
		object[property] = theme:GetColor(color, modifier)
	end

	themeChangedConnection = themeChanged.Event:Connect(update)
	parentChangedConnection = object:GetPropertyChangedSignal("Parent"):Connect(function()
		if (not object.Parent) then
			themeChangedConnection:Disconnect()
			parentChangedConnection:Disconnect()
			update = nil
		end
	end)
	update(self:Get())
end


function Theme:BindColor(object, property, color, modifier)
	self:_bind(object, property, color, modifier)
end


return Theme