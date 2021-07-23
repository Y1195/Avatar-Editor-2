local partsWithId = {}
local awaitRef = {}

local root = {
	ID = 0;
	Type = "TextButton";
	Properties = {
		TextSize = 14;
		Font = Enum.Font.SourceSans;
		Name = "CostumeTemplate";
		TextColor3 = Color3.new(0,0,0);
		Size = UDim2.new(0,200,0,50);
		Text = "";
		BorderSizePixel = 0;
		BackgroundColor3 = Color3.new(52/255,18/85,56/255);
	};
	Children = {
		{
			ID = 1;
			Type = "UICorner";
			Properties = {};
			Children = {};
		};
		{
			ID = 2;
			Type = "TextLabel";
			Properties = {
				Visible = false;
				RichText = true;
				TextWrapped = true;
				TextColor3 = Color3.new(1,1,1);
				TextXAlignment = Enum.TextXAlignment.Left;
				Text = "Your Head, a Marshmallow Floating in Hot Chocolate";
				BackgroundTransparency = 1;
				TextStrokeTransparency = 0;
				Size = UDim2.new(1,0,0,24);
				Font = Enum.Font.SourceSansSemibold;
				Name = "ItemLabel";
				TextTruncate = Enum.TextTruncate.AtEnd;
				TextYAlignment = Enum.TextYAlignment.Top;
				ZIndex = 3;
				TextSize = 20;
				BackgroundColor3 = Color3.new(1,1,1);
			};
			Children = {
				{
					ID = 3;
					Type = "UIPadding";
					Properties = {
						PaddingLeft = UDim.new(0,4);
						PaddingTop = UDim.new(0,4);
					};
					Children = {};
				};
			};
		};
		{
			ID = 4;
			Type = "TextButton";
			Properties = {
				Visible = false;
				TextWrapped = true;
				AnchorPoint = Vector2.new(1,1);
				TextTruncate = Enum.TextTruncate.AtEnd;
				SizeConstraint = Enum.SizeConstraint.RelativeYY;
				ZIndex = 4;
				BorderSizePixel = 0;
				Size = UDim2.new(0.20000000298023,0,0.20000000298023,0);
				TextColor3 = Color3.new(1,1,1);
				BorderColor3 = Color3.new(0,0,0);
				Text = "x";
				Font = Enum.Font.GothamBlack;
				Name = "More";
				Position = UDim2.new(0.98000001907349,0,0.98000001907349,0);
				TextSize = 14;
				TextScaled = true;
				BackgroundColor3 = Color3.new(1,0,0);
			};
			Children = {
				{
					ID = 5;
					Type = "UICorner";
					Properties = {};
					Children = {};
				};
			};
		};
		{
			ID = 6;
			Type = "ViewportFrame";
			Properties = {
				BackgroundTransparency = 1;
				Ambient = Color3.new(1,1,1);
				Size = UDim2.new(1,0,1,0);
				LightColor = Color3.new(1,1,1);
				LightDirection = Vector3.new(-1,-1,1);
				BackgroundColor3 = Color3.new(19/51,19/51,19/51);
			};
			Children = {
				{
					ID = 7;
					Type = "WorldModel";
					Properties = {};
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