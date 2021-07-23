local partsWithId = {}
local awaitRef = {}

local root = {
	ID = 0;
	Type = "TextButton";
	Properties = {
		TextSize = 20;
		Font = Enum.Font.SourceSansSemibold;
		Name = "DropdownTemplate";
		TextColor3 = Color3.new(1,1,1);
		TextXAlignment = Enum.TextXAlignment.Left;
		Size = UDim2.new(1,0,0,36);
		BorderSizePixel = 0;
		BackgroundColor3 = Color3.new(29/255,29/255,2/17);
	};
	Children = {
		{
			ID = 1;
			Type = "UIPadding";
			Properties = {
				PaddingLeft = UDim.new(0,8);
			};
			Children = {};
		};
	};
};

local function Scan(item, parent)
	local obj = Instance.new(item.Type)
	if (item.ID) then
		local awaiting = awaitRef[item.ID]
		if (awaiting) then
			awaiting[1][awaiting[2]] = obj
			awaitRef[item.ID] = nil
		else
			partsWithId[item.ID] = obj
		end
	end
	for p,v in pairs(item.Properties) do
		if (type(v) == "string") then
			local id = tonumber(v:match("^_R:(%w+)_$"))
			if (id) then
				if (partsWithId[id]) then
					v = partsWithId[id]
				else
					awaitRef[id] = {obj, p}
					v = nil
				end
			end
		end
		obj[p] = v
	end
	for _,c in pairs(item.Children) do
		Scan(c, obj)
	end
	obj.Parent = parent
	return obj
end

return function() return Scan(root, nil) end