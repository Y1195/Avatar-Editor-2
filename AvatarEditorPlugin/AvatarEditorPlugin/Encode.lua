local Http = game:GetService("HttpService")

local MAX_STRING_LENGTH = 199999

return function(assets)
	local encoded = Http:JSONEncode(assets)
	local strings = {}
	local values = {}

	for i = 0, math.floor(#encoded / MAX_STRING_LENGTH) do
		table.insert(strings, string.sub(encoded, 1 + (i * MAX_STRING_LENGTH), (i + 1) * MAX_STRING_LENGTH))
	end

	for i, v in ipairs(strings) do
		local stringValue = Instance.new("StringValue")
		stringValue.Name = "Catalog" .. string.format("%05i", i)
		stringValue.Value = v
		table.insert(values, stringValue)
	end

	return values
end