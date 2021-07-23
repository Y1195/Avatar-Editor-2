local Http = game:GetService("HttpService")

local stringValues = script:GetChildren()
local data = table.create(#stringValues)

for i, stringValue in ipairs(stringValues) do
	if stringValue:IsA("StringValue") then
		table.insert(data, stringValue)
	end
end

table.sort(data, function(a, b)
	--return a.name < b.name
	return tonumber(a.Name:match("%d+")) < tonumber(b.Name:match("%d+"))
end)

for i = 1, #data do
	data[i] = data[i].Value
end

local _string = table.concat(data)
if _string == "" then
	_string = "{}"
end
data = Http:JSONDecode(_string)

return data