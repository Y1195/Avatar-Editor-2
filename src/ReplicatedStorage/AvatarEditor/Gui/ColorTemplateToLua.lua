local partsWithId = {}
local awaitRef = {}

local root = {
	ID = 0;
	Type = "TextButton";
	Properties = {
		Font = Enum.Font.SourceSans;
		Name = "ColorTemplate";
		TextColor3 = Color3.new(0,0,0);
		Size = UDim2.new(0,100,0,100);
		Text = "";
		TextSize = 14;
		BackgroundColor3 = Color3.new(1,1,1);
	};
	Children = {
		{
			ID = 1;
			Type = "UICorner";
			Properties = {
				CornerRadius = UDim.new(0.5);
			};
			Children = {};
		};
		{
			ID = 2;
			Type = "ImageLabel";
			Properties = {
				Visible = false;
				ScaleType = Enum.ScaleType.Fit;
				ImageColor3 = Color3.new(0,1,127/255);
				BackgroundTransparency = 1;
				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
				Name = "Wearing";
				ImageRectSize = Vector2.new(94,94);
				ImageRectOffset = Vector2.new(604,574);
				Size = UDim2.new(1,0,1,0);
				BackgroundColor3 = Color3.new(1,1,1);
				SliceCenter = Rect.new(Vector2.new(49,49),Vector2.new(49,49));
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