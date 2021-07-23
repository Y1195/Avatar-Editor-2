local partsWithId = {}
local awaitRef = {}

local root = {
	ID = 0;
	Type = "Frame";
	Properties = {
		BackgroundColor3 = Color3.new(37/255,37/255,37/255);
		BorderSizePixel = 0;
		Size = UDim2.new(1,0,0,30);
	};
	Children = {
		{
			ID = 1;
			Type = "TextLabel";
			Properties = {
				LayoutOrder = 1;
				TextColor3 = Color3.new(4/5,4/5,4/5);
				Selectable = true;
				Text = "123";
				Font = Enum.Font.SourceSansSemibold;
				BackgroundTransparency = 1;
				TextXAlignment = Enum.TextXAlignment.Left;
				Size = UDim2.new(1,-60,1,0);
				TextSize = 20;
				BackgroundColor3 = Color3.new(1,1,1);
			};
			Children = {};
		};
		{
			ID = 2;
			Type = "TextButton";
			Properties = {
				LayoutOrder = 2;
				TextColor3 = Color3.new(1,4/15,4/15);
				Text = "x";
				AnchorPoint = Vector2.new(1,0);
				Font = Enum.Font.GothamBlack;
				Position = UDim2.new(1,0,0,0);
				SizeConstraint = Enum.SizeConstraint.RelativeYY;
				Size = UDim2.new(1,0,1,0);
				TextSize = 20;
				BackgroundColor3 = Color3.new(37/255,37/255,37/255);
			};
			Children = {
				{
					ID = 3;
					Type = "UICorner";
					Properties = {
						CornerRadius = UDim.new(0,4);
					};
					Children = {};
				};
			};
		};
		{
			ID = 4;
			Type = "TextLabel";
			Properties = {
				TextColor3 = Color3.new(0,1,0);
				Selectable = true;
				Text = "+";
				Size = UDim2.new(1,0,1,0);
				Font = Enum.Font.GothamBlack;
				Name = "IconLabel";
				TextXAlignment = Enum.TextXAlignment.Left;
				SizeConstraint = Enum.SizeConstraint.RelativeYY;
				BackgroundTransparency = 1;
				TextSize = 20;
				BackgroundColor3 = Color3.new(1,1,1);
			};
			Children = {
				{
					ID = 5;
					Type = "UIPadding";
					Properties = {
						PaddingLeft = UDim.new(0,10);
					};
					Children = {};
				};
			};
		};
		{
			ID = 6;
			Type = "UIListLayout";
			Properties = {
				SortOrder = Enum.SortOrder.LayoutOrder;
				FillDirection = Enum.FillDirection.Horizontal;
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