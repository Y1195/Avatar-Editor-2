local function isBlacklist(instance)
	return (instance == game.ServerStorage.Garbage) or instance:IsDescendantOf(game.ServerStorage.Garbage) or instance:IsA("StarterCharacterScripts")
end

local function isWhitelist(instance)
	return instance:IsA("Folder") or instance:IsA("StarterPlayerScripts")
		or instance:IsA("ReplicatedStorage") or instance:IsA("ServerScriptService") or instance:IsA("ServerStorage") or instance:IsA("StarterPlayer")
end

local function countBaseScript(parent)
	local count = 0
	for i, v in ipairs(parent:GetChildren()) do
		if v:IsA("LuaSourceContainer") then
			count += 1
		end
	end
	return count
end

local function getName(baseScript, useInit)
	local name = useInit and "init" or baseScript.Name
	if baseScript:IsA("LocalScript") then
		return name .. ".client.lua"
	elseif baseScript:IsA("ModuleScript") then
		return name .. ".lua"
	elseif baseScript:IsA("Script") then
		return name .. ".server.lua"
	end
end

local function getPath(parent)
	local path = {
		children = {},
		name = "src",
		type = "directory",
	}
	
	if isWhitelist(parent) then
		path.type = "directory"
		path.name = parent.Name
	elseif parent:IsA("LuaSourceContainer") then
		if countBaseScript(parent) > 0 then
			path.type = "directory"
			path.name = parent.name
			
			local initPath = {
				children = {},
				name = "init.lua",
				type = "file",
			}
			initPath.name = getName(parent, true)
			table.insert(path.children, initPath)
			
		else
			path.type = "file"
			path.name = getName(parent)
		end
	else
		return
	end
	
	return path
end


local function getPathRecursive(parent, path)
	local a = getPath(parent)
	if a then
		for i, v in ipairs(parent:GetChildren()) do
			if isBlacklist(v) then continue end
			getPathRecursive(v, a.children)
		end
		table.insert(path, a)
	end
end


return function()
	local list = {
		url = "https://raw.githubusercontent.com/Y1195/Avatar-Editor-2/master/",
		paths = {
			children = {},
			name = "src",
			type = "directory",
		},
	}
	
	getPathRecursive(game.ReplicatedStorage, list.paths.children)
	getPathRecursive(game.ServerStorage, list.paths.children)
	getPathRecursive(game.ServerScriptService, list.paths.children)
	getPathRecursive(game.StarterPlayer, list.paths.children)
	
	print(game:GetService("HttpService"):JSONEncode(list))
end