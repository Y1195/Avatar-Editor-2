-- Class
-- 0_1195
-- January 10, 2021

--[[



]]

local Class = {}
Class.__index = Class


function Class.new(size)
	local self = setmetatable({}, Class)
	
	assert(typeof(size) == "number", "Cache expecting number, got " .. typeof(size))
	
	self._cache = table.create(size)
	self._size = size
	
	return self
end


function Class:Get(key)
	assert(typeof(key) == "string")
	
	for i, v in ipairs(self._cache) do
		if v.key == key then
			return v.value, i
		end
	end
	
	return nil
end


function Class:Set(key, value)
	assert(typeof(key) == "string")
	assert(value)
	
	local cachedValue, index = self:Get(key)
	if index then
		local data = table.remove(self._cache, index)
		table.insert(self._cache, data)
	else
		local data = {
			key = key,
			value = value,
		}
		if #self._cache > self._size then
			table.remove(self._cache, 1)
			table.insert(self._cache, self._size, data)
		else
			table.insert(self._cache, data)
		end
	end
end


function Class:Destroy()
	table.clear(self._cache)
	self._cache = nil
	self._size = nil
	setmetatable(self, nil)
end


return Class