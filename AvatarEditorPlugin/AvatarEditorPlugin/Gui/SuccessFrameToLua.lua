local partsWithId = {}
local awaitRef = {}

local root = {
	ID = 0;
	Type = "Frame";
	Properties = {
		BackgroundColor3 = Color3.new(1,1,1);
		BackgroundTransparency = 1;
		Name = "SuccessFrame";
		Size = UDim2.new(1,0,0,30);
	};
	Children = {
		{
			ID = 1;
			Type = "TextLabel";
			Properties = {
				Size = UDim2.new(1,0,1,0);
				Font = Enum.Font.SourceSansSemibold;
				BackgroundTransparency = 1;
				TextColor3 = Color3.new(1,1,1);
				TextXAlignment = Enum.TextXAlignment.Left;
				Text = "1231231";
				TextSize = 20;
				BackgroundColor3 = Color3.new(1,1,1);
			};
			Children = {
				{
					ID = 2;
					Type = "UIPadding";
					Properties = {
						PaddingLeft = UDim.new(0,10);
					};
					Children = {};
				};
			};
		};
		{
			ID = 3;
			Type = "TextLabel";
			Properties = {
				TextColor3 = Color3.new(0,1,0);
				Text = "Success";
				Font = Enum.Font.SourceSansSemibold;
				BackgroundTransparency = 1;
				TextXAlignment = Enum.TextXAlignment.Right;
				Size = UDim2.new(1,0,1,0);
				Name = "SuccessLabel";
				TextSize = 20;
				BackgroundColor3 = Color3.new(1,1,1);
			};
			Children = {
				{
					ID = 4;
					Type = "UIPadding";
					Properties = {
						PaddingRight = UDim.new(0,10);
					};
					Children = {};
				};
			};
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