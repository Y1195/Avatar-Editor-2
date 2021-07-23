local partsWithId = {}
local awaitRef = {}

local root = {
	ID = 0;
	Type = "ScreenGui";
	Properties = {
		Name = "AvatarEditorGui";
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
		ResetOnSpawn = false;
		IgnoreGuiInset = true;
		DisplayOrder = 7;
	};
	Children = {
		{
			ID = 1;
			Type = "ImageButton";
			Properties = {
				Visible = false;
				ScaleType = Enum.ScaleType.Fit;
				Modal = true;
				Selectable = false;
				AutoButtonColor = false;
				Name = "Overlay";
				BackgroundTransparency = 0.5;
				Size = UDim2.new(1,0,1,0);
				ZIndex = 2;
				BorderSizePixel = 0;
				BackgroundColor3 = Color3.new(0,0,0);
			};
			Children = {
				{
					ID = 2;
					Type = "Frame";
					Properties = {
						Visible = false;
						Position = UDim2.new(0.5,0,0.5,0);
						BackgroundColor3 = Color3.new(7/51,37/255,13/85);
						AnchorPoint = Vector2.new(0.5,0.5);
						Size = UDim2.new(0,328,0,192);
					};
					Children = {
						{
							ID = 3;
							Type = "UICorner";
							Properties = {};
							Children = {};
						};
						{
							ID = 4;
							Type = "Frame";
							Properties = {
								BackgroundColor3 = Color3.new(1,1,1);
								BackgroundTransparency = 1;
								Name = "Body";
								Size = UDim2.new(1,0,0,148);
							};
							Children = {
								{
									ID = 5;
									Type = "Frame";
									Properties = {
										LayoutOrder = 1;
										Name = "ProductInfo";
										BackgroundTransparency = 1;
										BorderSizePixel = 0;
										Size = UDim2.new(0,328,0,118);
									};
									Children = {
										{
											ID = 6;
											Type = "Frame";
											Properties = {
												LayoutOrder = 1;
												Name = "ItemPreviewImage";
												BackgroundTransparency = 1;
												BorderSizePixel = 0;
												Size = UDim2.new(0,118,0,118);
											};
											Children = {
												{
													ID = 7;
													Type = "Frame";
													Properties = {
														AnchorPoint = Vector2.new(0.5,0.5);
														Name = "ItemPreviewImageContainer";
														Position = UDim2.new(0.5,0,0.5,0);
														BackgroundColor3 = Color3.new(1,1,1);
														BorderSizePixel = 0;
														Size = UDim2.new(0,68,0,68);
													};
													Children = {
														{
															ID = 8;
															Type = "ImageLabel";
															Properties = {
																AnchorPoint = Vector2.new(0.5,0.5);
																Image = "https://www.roblox.com/thumbs/asset.ashx?assetid=4367427794&x=100&y=100&format=png";
																Name = "ItemImage";
																Position = UDim2.new(0.5,0,0.5,0);
																BackgroundTransparency = 1;
																ScaleType = Enum.ScaleType.Fit;
																BorderSizePixel = 0;
																Size = UDim2.new(0,64,0,64);
															};
															Children = {};
														};
													};
												};
											};
										};
										{
											ID = 9;
											Type = "UIListLayout";
											Properties = {
												SortOrder = Enum.SortOrder.LayoutOrder;
												FillDirection = Enum.FillDirection.Horizontal;
											};
											Children = {};
										};
										{
											ID = 10;
											Type = "Frame";
											Properties = {
												LayoutOrder = 2;
												Name = "ProductDescription";
												BackgroundTransparency = 1;
												BorderSizePixel = 0;
												Size = UDim2.new(0,210,0,106);
											};
											Children = {
												{
													ID = 11;
													Type = "UIListLayout";
													Properties = {
														Name = "ProductDescriptionListLayout";
														SortOrder = Enum.SortOrder.LayoutOrder;
													};
													Children = {};
												};
												{
													ID = 12;
													Type = "UIPadding";
													Properties = {
														Name = "ProductDescriptionPadding";
														PaddingTop = UDim.new(0,18);
													};
													Children = {};
												};
												{
													ID = 13;
													Type = "TextLabel";
													Properties = {
														LayoutOrder = 1;
														TextWrapped = true;
														TextColor3 = Color3.new(1,1,1);
														Text = "Your Head, a Marshmallow Floating in Hot Chocolate";
														TextSize = 18;
														BackgroundTransparency = 1;
														Font = Enum.Font.SourceSans;
														Name = "ProductDescriptionText";
														TextXAlignment = Enum.TextXAlignment.Left;
														TextScaled = true;
														TextYAlignment = Enum.TextYAlignment.Top;
														BorderSizePixel = 0;
														Size = UDim2.new(0,185,0,64);
													};
													Children = {
														{
															ID = 14;
															Type = "UITextSizeConstraint";
															Properties = {
																Name = "TextSizeConstraint";
																MaxTextSize = 18;
															};
															Children = {};
														};
													};
												};
											};
										};
									};
								};
								{
									ID = 15;
									Type = "TextLabel";
									Properties = {
										LayoutOrder = 2;
										TextWrapped = true;
										TextColor3 = Color3.new(1,1,1);
										Text = "Buy this item from the Roblox Avatar Shop!";
										TextSize = 14;
										Font = Enum.Font.SourceSans;
										Name = "AdditionalDetails";
										BackgroundTransparency = 1;
										TextScaled = true;
										TextYAlignment = Enum.TextYAlignment.Top;
										BorderSizePixel = 0;
										Size = UDim2.new(1,0,0,30);
									};
									Children = {
										{
											ID = 16;
											Type = "UITextSizeConstraint";
											Properties = {
												Name = "TextSizeConstraint";
												MaxTextSize = 14;
											};
											Children = {};
										};
									};
								};
								{
									ID = 17;
									Type = "UIListLayout";
									Properties = {
										SortOrder = Enum.SortOrder.LayoutOrder;
									};
									Children = {};
								};
							};
						};
						{
							ID = 18;
							Type = "UIListLayout";
							Properties = {
								SortOrder = Enum.SortOrder.LayoutOrder;
							};
							Children = {};
						};
						{
							ID = 19;
							Type = "Frame";
							Properties = {
								LayoutOrder = 1;
								Name = "Buttons";
								BackgroundColor3 = Color3.new(1,1,1);
								BackgroundTransparency = 1;
								Size = UDim2.new(1,0,0,44);
							};
							Children = {
								{
									ID = 20;
									Type = "TextButton";
									Properties = {
										Font = Enum.Font.SourceSansSemibold;
										Name = "Button1";
										TextColor3 = Color3.new(1,1,1);
										Size = UDim2.new(0.5,0,1,0);
										Text = "Cancel";
										TextSize = 24;
										BackgroundColor3 = Color3.new(4/17,4/17,4/17);
									};
									Children = {
										{
											ID = 21;
											Type = "UICorner";
											Properties = {};
											Children = {};
										};
									};
								};
								{
									ID = 22;
									Type = "TextButton";
									Properties = {
										LayoutOrder = 1;
										Font = Enum.Font.SourceSansSemibold;
										Name = "Button2";
										TextColor3 = Color3.new(1,1,1);
										Size = UDim2.new(0.5,0,1,0);
										Text = "$1000";
										TextSize = 24;
										BackgroundColor3 = Color3.new(0,176/255,37/85);
									};
									Children = {
										{
											ID = 23;
											Type = "UICorner";
											Properties = {};
											Children = {};
										};
									};
								};
								{
									ID = 24;
									Type = "UIListLayout";
									Properties = {
										SortOrder = Enum.SortOrder.LayoutOrder;
										FillDirection = Enum.FillDirection.Horizontal;
									};
									Children = {};
								};
							};
						};
					};
				};
				{
					ID = 25;
					Type = "Frame";
					Properties = {
						AnchorPoint = Vector2.new(0.5,0.5);
						Name = "Confirm";
						Position = UDim2.new(0.5,0,0.5,0);
						BackgroundColor3 = Color3.new(7/51,37/255,13/85);
						ZIndex = 2;
						Visible = false;
						Size = UDim2.new(0,328,0,192);
					};
					Children = {
						{
							ID = 26;
							Type = "UICorner";
							Properties = {};
							Children = {};
						};
						{
							ID = 27;
							Type = "UIListLayout";
							Properties = {
								SortOrder = Enum.SortOrder.LayoutOrder;
							};
							Children = {};
						};
						{
							ID = 28;
							Type = "Frame";
							Properties = {
								LayoutOrder = 1;
								Name = "Buttons";
								BackgroundColor3 = Color3.new(1,1,1);
								BackgroundTransparency = 1;
								Size = UDim2.new(1,0,0,44);
							};
							Children = {
								{
									ID = 29;
									Type = "TextButton";
									Properties = {
										Font = Enum.Font.SourceSansSemibold;
										Name = "Button1";
										TextColor3 = Color3.new(1,1,1);
										Size = UDim2.new(0.5,0,1,0);
										Text = "Cancel";
										TextSize = 24;
										BackgroundColor3 = Color3.new(4/17,4/17,4/17);
									};
									Children = {
										{
											ID = 30;
											Type = "UICorner";
											Properties = {};
											Children = {};
										};
									};
								};
								{
									ID = 31;
									Type = "TextButton";
									Properties = {
										LayoutOrder = 2;
										Font = Enum.Font.SourceSansSemibold;
										Name = "Button2";
										TextColor3 = Color3.new(1,1,1);
										Size = UDim2.new(0.5,0,1,0);
										Text = "Yes";
										TextSize = 24;
										BackgroundColor3 = Color3.new(0,176/255,37/85);
									};
									Children = {
										{
											ID = 32;
											Type = "UICorner";
											Properties = {};
											Children = {};
										};
									};
								};
								{
									ID = 33;
									Type = "UIListLayout";
									Properties = {
										SortOrder = Enum.SortOrder.LayoutOrder;
										FillDirection = Enum.FillDirection.Horizontal;
									};
									Children = {};
								};
							};
						};
						{
							ID = 34;
							Type = "Frame";
							Properties = {
								BackgroundColor3 = Color3.new(1,1,1);
								BackgroundTransparency = 1;
								Name = "Body";
								Size = UDim2.new(1,0,0,148);
							};
							Children = {
								{
									ID = 35;
									Type = "UIListLayout";
									Properties = {
										SortOrder = Enum.SortOrder.LayoutOrder;
									};
									Children = {};
								};
								{
									ID = 36;
									Type = "TextLabel";
									Properties = {
										Font = Enum.Font.SourceSansSemibold;
										BackgroundTransparency = 1;
										TextColor3 = Color3.new(1,1,1);
										Size = UDim2.new(1,0,0,44);
										Text = "Are you sure?";
										TextSize = 28;
										BackgroundColor3 = Color3.new(1,1,1);
									};
									Children = {
										{
											ID = 37;
											Type = "Frame";
											Properties = {
												AnchorPoint = Vector2.new(0,1);
												Name = "Line";
												Position = UDim2.new(0,0,1,0);
												BackgroundColor3 = Color3.new(1,1,1);
												BackgroundTransparency = 0.5;
												Size = UDim2.new(1,0,0,1);
											};
											Children = {};
										};
									};
								};
								{
									ID = 38;
									Type = "TextLabel";
									Properties = {
										TextWrapped = true;
										TextColor3 = Color3.new(1,1,1);
										Text = "Are you sure you want to delete this outfit?";
										Font = Enum.Font.SourceSansSemibold;
										Name = "MessageLabel";
										Size = UDim2.new(1,0,0,104);
										BackgroundTransparency = 1;
										TextSize = 24;
										BackgroundColor3 = Color3.new(1,1,1);
									};
									Children = {
										{
											ID = 39;
											Type = "UIPadding";
											Properties = {
												PaddingRight = UDim.new(0,8);
												PaddingLeft = UDim.new(0,8);
											};
											Children = {};
										};
									};
								};
							};
						};
					};
				};
				{
					ID = 40;
					Type = "Frame";
					Properties = {
						AnchorPoint = Vector2.new(0.5,0.5);
						Name = "CreateOutfit";
						Position = UDim2.new(0.5,0,0.5,0);
						BackgroundColor3 = Color3.new(7/51,37/255,13/85);
						Visible = false;
						Size = UDim2.new(0,328,0,192);
					};
					Children = {
						{
							ID = 41;
							Type = "UICorner";
							Properties = {};
							Children = {};
						};
						{
							ID = 42;
							Type = "Frame";
							Properties = {
								BackgroundColor3 = Color3.new(1,1,1);
								BackgroundTransparency = 1;
								Name = "Body";
								Size = UDim2.new(1,0,0,148);
							};
							Children = {
								{
									ID = 43;
									Type = "UIListLayout";
									Properties = {
										SortOrder = Enum.SortOrder.LayoutOrder;
									};
									Children = {};
								};
								{
									ID = 44;
									Type = "TextLabel";
									Properties = {
										Font = Enum.Font.SourceSansSemibold;
										BackgroundTransparency = 1;
										TextColor3 = Color3.new(1,1,1);
										Size = UDim2.new(1,0,0,44);
										Text = "Create New Outfit";
										TextSize = 28;
										BackgroundColor3 = Color3.new(1,1,1);
									};
									Children = {
										{
											ID = 45;
											Type = "Frame";
											Properties = {
												AnchorPoint = Vector2.new(0,1);
												Name = "Line";
												Position = UDim2.new(0,0,1,0);
												BackgroundColor3 = Color3.new(1,1,1);
												BackgroundTransparency = 0.5;
												Size = UDim2.new(1,0,0,1);
											};
											Children = {};
										};
									};
								};
								{
									ID = 46;
									Type = "Frame";
									Properties = {
										BackgroundColor3 = Color3.new(1,1,1);
										BackgroundTransparency = 1;
										Name = "Info";
										Size = UDim2.new(1,0,0,104);
									};
									Children = {
										{
											ID = 47;
											Type = "Frame";
											Properties = {
												Name = "Search";
												BorderColor3 = Color3.new(0,0,0);
												BackgroundColor3 = Color3.new(47/255,16/85,52/255);
												BorderSizePixel = 0;
												Size = UDim2.new(1,0,0,36);
											};
											Children = {
												{
													ID = 48;
													Type = "TextBox";
													Properties = {
														LayoutOrder = 1;
														ClearTextOnFocus = false;
														ClipsDescendants = true;
														BorderColor3 = Color3.new(0,0,0);
														Text = "";
														TextXAlignment = Enum.TextXAlignment.Left;
														TextColor3 = Color3.new(1,1,1);
														Size = UDim2.new(1,-16,0,36);
														Font = Enum.Font.SourceSansSemibold;
														BackgroundTransparency = 1;
														Position = UDim2.new(0,8,0,0);
														TextSize = 28;
														PlaceholderText = "Name your outfit";
														BorderSizePixel = 0;
														BackgroundColor3 = Color3.new(1,1,1);
													};
													Children = {};
												};
												{
													ID = 49;
													Type = "UICorner";
													Properties = {};
													Children = {};
												};
											};
										};
										{
											ID = 50;
											Type = "UIPadding";
											Properties = {
												PaddingBottom = UDim.new(0,8);
												PaddingTop = UDim.new(0,8);
												PaddingRight = UDim.new(0,8);
												PaddingLeft = UDim.new(0,8);
											};
											Children = {};
										};
										{
											ID = 51;
											Type = "TextLabel";
											Properties = {
												LayoutOrder = 1;
												Font = Enum.Font.SourceSansSemibold;
												BackgroundTransparency = 1;
												TextColor3 = Color3.new(1,0,0);
												Size = UDim2.new(1,0,0,36);
												Text = "error message";
												TextSize = 28;
												BackgroundColor3 = Color3.new(1,1,1);
											};
											Children = {};
										};
										{
											ID = 52;
											Type = "UIListLayout";
											Properties = {
												SortOrder = Enum.SortOrder.LayoutOrder;
												Padding = UDim.new(0,8);
											};
											Children = {};
										};
									};
								};
							};
						};
						{
							ID = 53;
							Type = "UIListLayout";
							Properties = {
								SortOrder = Enum.SortOrder.LayoutOrder;
							};
							Children = {};
						};
						{
							ID = 54;
							Type = "Frame";
							Properties = {
								LayoutOrder = 1;
								Name = "Buttons";
								BackgroundColor3 = Color3.new(1,1,1);
								BackgroundTransparency = 1;
								Size = UDim2.new(1,0,0,44);
							};
							Children = {
								{
									ID = 55;
									Type = "TextButton";
									Properties = {
										Font = Enum.Font.SourceSansSemibold;
										Name = "Button1";
										TextColor3 = Color3.new(1,1,1);
										Size = UDim2.new(0.5,0,1,0);
										Text = "Cancel";
										TextSize = 24;
										BackgroundColor3 = Color3.new(4/17,4/17,4/17);
									};
									Children = {
										{
											ID = 56;
											Type = "UICorner";
											Properties = {};
											Children = {};
										};
									};
								};
								{
									ID = 57;
									Type = "TextButton";
									Properties = {
										LayoutOrder = 1;
										Font = Enum.Font.SourceSansSemibold;
										Name = "Button2";
										TextColor3 = Color3.new(1,1,1);
										Size = UDim2.new(0.5,0,1,0);
										Text = "Create";
										TextSize = 24;
										BackgroundColor3 = Color3.new(0,176/255,37/85);
									};
									Children = {
										{
											ID = 58;
											Type = "UICorner";
											Properties = {};
											Children = {};
										};
									};
								};
								{
									ID = 59;
									Type = "UIListLayout";
									Properties = {
										SortOrder = Enum.SortOrder.LayoutOrder;
										FillDirection = Enum.FillDirection.Horizontal;
									};
									Children = {};
								};
							};
						};
					};
				};
			};
		};
		{
			ID = 60;
			Type = "Frame";
			Properties = {
				BackgroundColor3 = Color3.new(1,1,1);
				BackgroundTransparency = 1;
				Size = UDim2.new(1,0,1,0);
			};
			Children = {
				{
					ID = 61;
					Type = "Frame";
					Properties = {
						LayoutOrder = 1;
						Name = "Editor";
						Position = UDim2.new(1,0,0,0);
						BackgroundColor3 = Color3.new(7/51,37/255,13/85);
						AnchorPoint = Vector2.new(1,0);
						BorderSizePixel = 0;
						Size = UDim2.new(0.60000002384186,0,1,0);
					};
					Children = {
						{
							ID = 62;
							Type = "UIPadding";
							Properties = {
								PaddingTop = UDim.new(0,40);
							};
							Children = {};
						};
						{
							ID = 63;
							Type = "Frame";
							Properties = {
								LayoutOrder = 2;
								Name = "Footer";
								BackgroundColor3 = Color3.new(5/51,9/85,29/255);
								BorderSizePixel = 0;
								Size = UDim2.new(1,0,0,52);
							};
							Children = {
								{
									ID = 64;
									Type = "TextButton";
									Properties = {
										TextWrapped = true;
										TextColor3 = Color3.new(1,1,1);
										BorderColor3 = Color3.new(0,0,0);
										Text = "";
										TextSize = 28;
										Size = UDim2.new(1,0,1,0);
										Font = Enum.Font.SourceSansSemibold;
										Name = "Settings";
										Position = UDim2.new(0,88,0,0);
										SizeConstraint = Enum.SizeConstraint.RelativeYY;
										MaxVisibleGraphemes = 0;
										BorderSizePixel = 0;
										BackgroundColor3 = Color3.new(47/255,16/85,52/255);
									};
									Children = {
										{
											ID = 65;
											Type = "ImageLabel";
											Properties = {
												LayoutOrder = 1;
												ScaleType = Enum.ScaleType.Fit;
												Selectable = true;
												BackgroundTransparency = 1;
												AnchorPoint = Vector2.new(0.5,0.5);
												Image = "rbxasset://textures/GameSettings/ToolbarIcon.png";
												Name = "Icon";
												Position = UDim2.new(0.5,0,0.5,0);
												BorderColor3 = Color3.new(0,0,0);
												Size = UDim2.new(0,24,0,24);
												BorderSizePixel = 0;
												BackgroundColor3 = Color3.new(1,1,1);
											};
											Children = {};
										};
										{
											ID = 66;
											Type = "UICorner";
											Properties = {};
											Children = {};
										};
										{
											ID = 67;
											Type = "TextLabel";
											Properties = {
												Visible = false;
												Selectable = true;
												Active = true;
												BorderColor3 = Color3.new(0,0,0);
												Text = "Settings";
												TextSize = 18;
												TextColor3 = Color3.new(1,1,1);
												AnchorPoint = Vector2.new(0.5,1);
												Font = Enum.Font.SourceSansSemibold;
												Name = "Tooltip";
												Position = UDim2.new(0.5,0,0,-6);
												Size = UDim2.new(0,10,0,24);
												AutomaticSize = Enum.AutomaticSize.X;
												BorderSizePixel = 0;
												BackgroundColor3 = Color3.new(97/255,97/255,97/255);
											};
											Children = {
												{
													ID = 68;
													Type = "UIPadding";
													Properties = {
														PaddingRight = UDim.new(0,10);
														PaddingLeft = UDim.new(0,10);
													};
													Children = {};
												};
												{
													ID = 69;
													Type = "UICorner";
													Properties = {
														CornerRadius = UDim.new(0.5);
													};
													Children = {};
												};
												{
													ID = 70;
													Type = "UIScale";
													Properties = {};
													Children = {};
												};
											};
										};
									};
								};
								{
									ID = 71;
									Type = "UIPadding";
									Properties = {
										PaddingBottom = UDim.new(0,8);
										PaddingTop = UDim.new(0,8);
										PaddingRight = UDim.new(0,8);
										PaddingLeft = UDim.new(0,8);
									};
									Children = {};
								};
								{
									ID = 72;
									Type = "TextButton";
									Properties = {
										TextWrapped = true;
										TextColor3 = Color3.new(1,1,1);
										BorderColor3 = Color3.new(0,0,0);
										Text = "";
										TextSize = 28;
										Size = UDim2.new(1,0,1,0);
										AnchorPoint = Vector2.new(1,0);
										Font = Enum.Font.SourceSansSemibold;
										Name = "Reset";
										Position = UDim2.new(1,0,0,0);
										SizeConstraint = Enum.SizeConstraint.RelativeYY;
										MaxVisibleGraphemes = 0;
										BorderSizePixel = 0;
										BackgroundColor3 = Color3.new(1,1/3,0);
									};
									Children = {
										{
											ID = 73;
											Type = "ImageLabel";
											Properties = {
												LayoutOrder = 1;
												ScaleType = Enum.ScaleType.Fit;
												Selectable = true;
												BorderColor3 = Color3.new(0,0,0);
												BackgroundTransparency = 1;
												AnchorPoint = Vector2.new(0.5,0.5);
												Image = "rbxasset://textures/ui/ResetIcon.png";
												Name = "Icon";
												Position = UDim2.new(0.5,0,0.5,0);
												SliceScale = 0;
												Size = UDim2.new(0,36,0,36);
												BorderSizePixel = 0;
												BackgroundColor3 = Color3.new(1,1,1);
											};
											Children = {};
										};
										{
											ID = 74;
											Type = "UICorner";
											Properties = {};
											Children = {};
										};
										{
											ID = 75;
											Type = "TextLabel";
											Properties = {
												Visible = false;
												Selectable = true;
												Active = true;
												BorderColor3 = Color3.new(0,0,0);
												Text = "Reset Avatar";
												TextSize = 18;
												TextColor3 = Color3.new(1,1,1);
												AnchorPoint = Vector2.new(0.5,1);
												Font = Enum.Font.SourceSansSemibold;
												Name = "Tooltip";
												Position = UDim2.new(0.5,0,0,-6);
												Size = UDim2.new(0,10,0,24);
												AutomaticSize = Enum.AutomaticSize.X;
												BorderSizePixel = 0;
												BackgroundColor3 = Color3.new(97/255,97/255,97/255);
											};
											Children = {
												{
													ID = 76;
													Type = "UIPadding";
													Properties = {
														PaddingRight = UDim.new(0,10);
														PaddingLeft = UDim.new(0,10);
													};
													Children = {};
												};
												{
													ID = 77;
													Type = "UICorner";
													Properties = {
														CornerRadius = UDim.new(0.5);
													};
													Children = {};
												};
												{
													ID = 78;
													Type = "UIScale";
													Properties = {};
													Children = {};
												};
											};
										};
									};
								};
								{
									ID = 79;
									Type = "TextButton";
									Properties = {
										TextWrapped = true;
										TextColor3 = Color3.new(1,1,1);
										BorderColor3 = Color3.new(0,0,0);
										Text = "";
										TextSize = 28;
										Font = Enum.Font.SourceSansSemibold;
										Name = "Appearance";
										Size = UDim2.new(1,0,1,0);
										SizeConstraint = Enum.SizeConstraint.RelativeYY;
										MaxVisibleGraphemes = 0;
										BorderSizePixel = 0;
										BackgroundColor3 = Color3.new(47/255,16/85,52/255);
									};
									Children = {
										{
											ID = 80;
											Type = "UICorner";
											Properties = {};
											Children = {};
										};
										{
											ID = 81;
											Type = "TextLabel";
											Properties = {
												Visible = false;
												Selectable = true;
												Active = true;
												BorderColor3 = Color3.new(0,0,0);
												Text = "Settings";
												TextSize = 18;
												TextColor3 = Color3.new(1,1,1);
												AnchorPoint = Vector2.new(0.5,1);
												Font = Enum.Font.SourceSansSemibold;
												Name = "Tooltip";
												Position = UDim2.new(0.5,0,0,-6);
												Size = UDim2.new(0,10,0,24);
												AutomaticSize = Enum.AutomaticSize.X;
												BorderSizePixel = 0;
												BackgroundColor3 = Color3.new(97/255,97/255,97/255);
											};
											Children = {
												{
													ID = 82;
													Type = "UIPadding";
													Properties = {
														PaddingRight = UDim.new(0,10);
														PaddingLeft = UDim.new(0,10);
													};
													Children = {};
												};
												{
													ID = 83;
													Type = "UICorner";
													Properties = {
														CornerRadius = UDim.new(0.5);
													};
													Children = {};
												};
												{
													ID = 84;
													Type = "UIScale";
													Properties = {};
													Children = {};
												};
											};
										};
										{
											ID = 85;
											Type = "ImageLabel";
											Properties = {
												LayoutOrder = 1;
												ScaleType = Enum.ScaleType.Fit;
												Selectable = true;
												BackgroundTransparency = 1;
												ImageRectOffset = Vector2.new(609,493);
												Position = UDim2.new(0.5,0,0.5,0);
												AnchorPoint = Vector2.new(0.5,0.5);
												Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
												Name = "Icon";
												ImageRectSize = Vector2.new(72,72);
												BorderColor3 = Color3.new(0,0,0);
												Size = UDim2.new(0,24,0,24);
												BorderSizePixel = 0;
												BackgroundColor3 = Color3.new(1,1,1);
											};
											Children = {};
										};
									};
								};
								{
									ID = 86;
									Type = "TextButton";
									Properties = {
										TextWrapped = true;
										TextColor3 = Color3.new(1,1,1);
										BorderColor3 = Color3.new(0,0,0);
										Text = "";
										TextSize = 28;
										Size = UDim2.new(1,0,1,0);
										Font = Enum.Font.SourceSansSemibold;
										Name = "Costume";
										Position = UDim2.new(0,44,0,0);
										SizeConstraint = Enum.SizeConstraint.RelativeYY;
										MaxVisibleGraphemes = 0;
										BorderSizePixel = 0;
										BackgroundColor3 = Color3.new(47/255,16/85,52/255);
									};
									Children = {
										{
											ID = 87;
											Type = "UICorner";
											Properties = {};
											Children = {};
										};
										{
											ID = 88;
											Type = "TextLabel";
											Properties = {
												Visible = false;
												Selectable = true;
												Active = true;
												BorderColor3 = Color3.new(0,0,0);
												Text = "Settings";
												TextSize = 18;
												TextColor3 = Color3.new(1,1,1);
												AnchorPoint = Vector2.new(0.5,1);
												Font = Enum.Font.SourceSansSemibold;
												Name = "Tooltip";
												Position = UDim2.new(0.5,0,0,-6);
												Size = UDim2.new(0,10,0,24);
												AutomaticSize = Enum.AutomaticSize.X;
												BorderSizePixel = 0;
												BackgroundColor3 = Color3.new(97/255,97/255,97/255);
											};
											Children = {
												{
													ID = 89;
													Type = "UIPadding";
													Properties = {
														PaddingRight = UDim.new(0,10);
														PaddingLeft = UDim.new(0,10);
													};
													Children = {};
												};
												{
													ID = 90;
													Type = "UICorner";
													Properties = {
														CornerRadius = UDim.new(0.5);
													};
													Children = {};
												};
												{
													ID = 91;
													Type = "UIScale";
													Properties = {};
													Children = {};
												};
											};
										};
										{
											ID = 92;
											Type = "ImageLabel";
											Properties = {
												LayoutOrder = 1;
												ScaleType = Enum.ScaleType.Fit;
												Selectable = true;
												BackgroundTransparency = 1;
												ImageRectOffset = Vector2.new(672,321);
												Position = UDim2.new(0.5,0,0.5,0);
												AnchorPoint = Vector2.new(0.5,0.5);
												Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
												Name = "Icon";
												ImageRectSize = Vector2.new(72,72);
												BorderColor3 = Color3.new(0,0,0);
												Size = UDim2.new(0,24,0,24);
												BorderSizePixel = 0;
												BackgroundColor3 = Color3.new(1,1,1);
											};
											Children = {};
										};
									};
								};
								{
									ID = 93;
									Type = "TextLabel";
									Properties = {
										RichText = true;
										TextColor3 = Color3.new(1,1,1);
										Text = "";
										Size = UDim2.new(0,200,1,0);
										AnchorPoint = Vector2.new(1,0);
										Font = Enum.Font.SourceSansBold;
										Name = "Version";
										Position = UDim2.new(1,-44,0,0);
										TextXAlignment = Enum.TextXAlignment.Right;
										BackgroundTransparency = 1;
										TextSize = 18;
										BackgroundColor3 = Color3.new(1,1,1);
									};
									Children = {};
								};
							};
						};
						{
							ID = 94;
							Type = "Frame";
							Properties = {
								Name = "Body";
								ClipsDescendants = true;
								BackgroundColor3 = Color3.new(1,1,1);
								BackgroundTransparency = 1;
								Size = UDim2.new(1,0,1,-52);
							};
							Children = {
								{
									ID = 95;
									Type = "Frame";
									Properties = {
										LayoutOrder = 1;
										Name = "Main";
										BackgroundColor3 = Color3.new(1,1,1);
										BackgroundTransparency = 1;
										Size = UDim2.new(1,0,1,0);
									};
									Children = {
										{
											ID = 96;
											Type = "Frame";
											Properties = {
												Name = "Header";
												BackgroundColor3 = Color3.new(5/51,9/85,29/255);
												BorderColor3 = Color3.new(0,0,0);
												ZIndex = 2;
												BorderSizePixel = 0;
												Size = UDim2.new(1,0,0,140);
											};
											Children = {
												{
													ID = 97;
													Type = "UIListLayout";
													Properties = {
														Padding = UDim.new(0,8);
														HorizontalAlignment = Enum.HorizontalAlignment.Center;
														SortOrder = Enum.SortOrder.LayoutOrder;
													};
													Children = {};
												};
												{
													ID = 98;
													Type = "Frame";
													Properties = {
														BackgroundColor3 = Color3.new(1,1,1);
														Name = "CategoryTabs";
														BackgroundTransparency = 1;
														BorderColor3 = Color3.new(0,0,0);
														ZIndex = 3;
														BorderSizePixel = 0;
														Size = UDim2.new(1,0,0,36);
													};
													Children = {
														{
															ID = 99;
															Type = "UIGridLayout";
															Properties = {
																CellPadding = UDim2.new(0,8,0,0);
																SortOrder = Enum.SortOrder.LayoutOrder;
																HorizontalAlignment = Enum.HorizontalAlignment.Center;
																CellSize = UDim2.new(0.20000000298023,-8,1,0);
															};
															Children = {};
														};
														{
															ID = 100;
															Type = "TextButton";
															Properties = {
																TextWrapped = true;
																TextColor3 = Color3.new(1,1,1);
																BorderColor3 = Color3.new(0,0,0);
																Text = "Accessories";
																TextSize = 28;
																Font = Enum.Font.SourceSansSemibold;
																Name = "Accessories";
																Size = UDim2.new(0,48,1,0);
																ClipsDescendants = true;
																MaxVisibleGraphemes = 0;
																BorderSizePixel = 0;
																BackgroundColor3 = Color3.new(47/255,16/85,52/255);
															};
															Children = {
																{
																	ID = 101;
																	Type = "ImageLabel";
																	Properties = {
																		LayoutOrder = 1;
																		ScaleType = Enum.ScaleType.Fit;
																		Selectable = true;
																		BackgroundTransparency = 1;
																		ImageRectOffset = Vector2.new(523,492);
																		Position = UDim2.new(0.5,0,0.5,0);
																		AnchorPoint = Vector2.new(0.5,0.5);
																		Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																		Name = "Icon";
																		ImageRectSize = Vector2.new(72,72);
																		BorderColor3 = Color3.new(0,0,0);
																		Size = UDim2.new(0,24,0,24);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(1,1,1);
																	};
																	Children = {};
																};
																{
																	ID = 102;
																	Type = "UICorner";
																	Properties = {};
																	Children = {};
																};
																{
																	ID = 103;
																	Type = "TextLabel";
																	Properties = {
																		Visible = false;
																		Selectable = true;
																		Active = true;
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Accessories";
																		TextSize = 18;
																		TextColor3 = Color3.new(1,1,1);
																		AnchorPoint = Vector2.new(0.5,0);
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "Tooltip";
																		Position = UDim2.new(0.5,0,1,6);
																		Size = UDim2.new(0,10,0,24);
																		AutomaticSize = Enum.AutomaticSize.X;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																	};
																	Children = {
																		{
																			ID = 104;
																			Type = "UIPadding";
																			Properties = {
																				PaddingRight = UDim.new(0,10);
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 105;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0.5);
																			};
																			Children = {};
																		};
																		{
																			ID = 106;
																			Type = "UIScale";
																			Properties = {};
																			Children = {};
																		};
																	};
																};
															};
														};
														{
															ID = 107;
															Type = "TextButton";
															Properties = {
																LayoutOrder = 3;
																TextWrapped = true;
																TextColor3 = Color3.new(1,1,1);
																BorderColor3 = Color3.new(0,0,0);
																Text = "Animations";
																TextSize = 28;
																Font = Enum.Font.SourceSansSemibold;
																Name = "Animations";
																Size = UDim2.new(0,48,1,0);
																ClipsDescendants = true;
																MaxVisibleGraphemes = 0;
																BorderSizePixel = 0;
																BackgroundColor3 = Color3.new(47/255,16/85,52/255);
															};
															Children = {
																{
																	ID = 108;
																	Type = "ImageLabel";
																	Properties = {
																		LayoutOrder = 1;
																		ScaleType = Enum.ScaleType.Fit;
																		Selectable = true;
																		BackgroundTransparency = 1;
																		ImageRectOffset = Vector2.new(1639,407);
																		Position = UDim2.new(0.5,0,0.5,0);
																		AnchorPoint = Vector2.new(0.5,0.5);
																		Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																		Name = "Icon";
																		ImageRectSize = Vector2.new(72,72);
																		BorderColor3 = Color3.new(0,0,0);
																		Size = UDim2.new(0,24,0,24);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(1,1,1);
																	};
																	Children = {};
																};
																{
																	ID = 109;
																	Type = "UICorner";
																	Properties = {};
																	Children = {};
																};
																{
																	ID = 110;
																	Type = "TextLabel";
																	Properties = {
																		Visible = false;
																		Selectable = true;
																		Active = true;
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Animations";
																		TextSize = 18;
																		TextColor3 = Color3.new(1,1,1);
																		AnchorPoint = Vector2.new(0.5,0);
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "Tooltip";
																		Position = UDim2.new(0.5,0,1,6);
																		Size = UDim2.new(0,10,0,24);
																		AutomaticSize = Enum.AutomaticSize.X;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																	};
																	Children = {
																		{
																			ID = 111;
																			Type = "UIPadding";
																			Properties = {
																				PaddingRight = UDim.new(0,10);
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 112;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0.5);
																			};
																			Children = {};
																		};
																		{
																			ID = 113;
																			Type = "UIScale";
																			Properties = {};
																			Children = {};
																		};
																	};
																};
															};
														};
														{
															ID = 114;
															Type = "TextButton";
															Properties = {
																Visible = false;
																TextWrapped = true;
																TextColor3 = Color3.new(1,1,1);
																BorderColor3 = Color3.new(0,0,0);
																Text = "Appearance";
																TextSize = 28;
																Size = UDim2.new(0,48,1,0);
																Font = Enum.Font.SourceSansSemibold;
																Name = "Appearance";
																ClipsDescendants = true;
																LayoutOrder = 5;
																MaxVisibleGraphemes = 0;
																BorderSizePixel = 0;
																BackgroundColor3 = Color3.new(47/255,16/85,52/255);
															};
															Children = {
																{
																	ID = 115;
																	Type = "ImageLabel";
																	Properties = {
																		LayoutOrder = 1;
																		ScaleType = Enum.ScaleType.Fit;
																		Selectable = true;
																		BackgroundTransparency = 1;
																		ImageRectOffset = Vector2.new(672,321);
																		Position = UDim2.new(0.5,0,0.5,0);
																		AnchorPoint = Vector2.new(0.5,0.5);
																		Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																		Name = "Icon";
																		ImageRectSize = Vector2.new(72,72);
																		BorderColor3 = Color3.new(0,0,0);
																		Size = UDim2.new(0,24,0,24);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(1,1,1);
																	};
																	Children = {};
																};
																{
																	ID = 116;
																	Type = "UICorner";
																	Properties = {};
																	Children = {};
																};
																{
																	ID = 117;
																	Type = "TextLabel";
																	Properties = {
																		Visible = false;
																		Selectable = true;
																		Active = true;
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Appearance";
																		TextSize = 18;
																		TextColor3 = Color3.new(1,1,1);
																		AnchorPoint = Vector2.new(0.5,0);
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "Tooltip";
																		Position = UDim2.new(0.5,0,1,6);
																		Size = UDim2.new(0,10,0,24);
																		AutomaticSize = Enum.AutomaticSize.X;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																	};
																	Children = {
																		{
																			ID = 118;
																			Type = "UIPadding";
																			Properties = {
																				PaddingRight = UDim.new(0,10);
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 119;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0.5);
																			};
																			Children = {};
																		};
																		{
																			ID = 120;
																			Type = "UIScale";
																			Properties = {};
																			Children = {};
																		};
																	};
																};
															};
														};
														{
															ID = 121;
															Type = "TextButton";
															Properties = {
																LayoutOrder = 2;
																TextWrapped = true;
																TextColor3 = Color3.new(1,1,1);
																BorderColor3 = Color3.new(0,0,0);
																Text = "Body";
																TextSize = 28;
																Font = Enum.Font.SourceSansSemibold;
																Name = "Body";
																Size = UDim2.new(0,48,1,0);
																ClipsDescendants = true;
																MaxVisibleGraphemes = 0;
																BorderSizePixel = 0;
																BackgroundColor3 = Color3.new(47/255,16/85,52/255);
															};
															Children = {
																{
																	ID = 122;
																	Type = "ImageLabel";
																	Properties = {
																		LayoutOrder = 1;
																		ScaleType = Enum.ScaleType.Fit;
																		Selectable = true;
																		BackgroundTransparency = 1;
																		ImageRectOffset = Vector2.new(1297,407);
																		Position = UDim2.new(0.5,0,0.5,0);
																		AnchorPoint = Vector2.new(0.5,0.5);
																		Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																		Name = "Icon";
																		ImageRectSize = Vector2.new(72,72);
																		BorderColor3 = Color3.new(0,0,0);
																		Size = UDim2.new(0,24,0,24);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(1,1,1);
																	};
																	Children = {};
																};
																{
																	ID = 123;
																	Type = "UICorner";
																	Properties = {};
																	Children = {};
																};
																{
																	ID = 124;
																	Type = "TextLabel";
																	Properties = {
																		Visible = false;
																		Selectable = true;
																		Active = true;
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Body";
																		TextSize = 18;
																		TextColor3 = Color3.new(1,1,1);
																		AnchorPoint = Vector2.new(0.5,0);
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "Tooltip";
																		Position = UDim2.new(0.5,0,1,6);
																		Size = UDim2.new(0,10,0,24);
																		AutomaticSize = Enum.AutomaticSize.X;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																	};
																	Children = {
																		{
																			ID = 125;
																			Type = "UIPadding";
																			Properties = {
																				PaddingRight = UDim.new(0,10);
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 126;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0.5);
																			};
																			Children = {};
																		};
																		{
																			ID = 127;
																			Type = "UIScale";
																			Properties = {};
																			Children = {};
																		};
																	};
																};
															};
														};
														{
															ID = 128;
															Type = "TextButton";
															Properties = {
																LayoutOrder = 1;
																TextWrapped = true;
																TextColor3 = Color3.new(1,1,1);
																BorderColor3 = Color3.new(0,0,0);
																Text = "Clothes";
																TextSize = 28;
																Font = Enum.Font.SourceSansSemibold;
																Name = "Clothes";
																Size = UDim2.new(0,48,1,0);
																ClipsDescendants = true;
																MaxVisibleGraphemes = 0;
																BorderSizePixel = 0;
																BackgroundColor3 = Color3.new(47/255,16/85,52/255);
															};
															Children = {
																{
																	ID = 129;
																	Type = "ImageLabel";
																	Properties = {
																		LayoutOrder = 1;
																		ScaleType = Enum.ScaleType.Fit;
																		Selectable = true;
																		BackgroundTransparency = 1;
																		ImageRectOffset = Vector2.new(1211,407);
																		Position = UDim2.new(0.5,0,0.5,0);
																		AnchorPoint = Vector2.new(0.5,0.5);
																		Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																		Name = "Icon";
																		ImageRectSize = Vector2.new(72,72);
																		BorderColor3 = Color3.new(0,0,0);
																		Size = UDim2.new(0,24,0,24);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(1,1,1);
																	};
																	Children = {};
																};
																{
																	ID = 130;
																	Type = "UICorner";
																	Properties = {};
																	Children = {};
																};
															};
														};
														{
															ID = 131;
															Type = "TextButton";
															Properties = {
																LayoutOrder = 4;
																TextWrapped = true;
																TextColor3 = Color3.new(1,1,1);
																BorderColor3 = Color3.new(0,0,0);
																Text = "Wearing";
																TextSize = 28;
																Font = Enum.Font.SourceSansSemibold;
																Name = "Wearing";
																Size = UDim2.new(0,48,1,0);
																ClipsDescendants = true;
																MaxVisibleGraphemes = 0;
																BorderSizePixel = 0;
																BackgroundColor3 = Color3.new(47/255,16/85,52/255);
															};
															Children = {
																{
																	ID = 132;
																	Type = "ImageLabel";
																	Properties = {
																		LayoutOrder = 1;
																		ScaleType = Enum.ScaleType.Fit;
																		Selectable = true;
																		BackgroundTransparency = 1;
																		ImageRectOffset = Vector2.new(1535,321);
																		Position = UDim2.new(0.5,0,0.5,0);
																		AnchorPoint = Vector2.new(0.5,0.5);
																		Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																		Name = "Icon";
																		ImageRectSize = Vector2.new(72,72);
																		BorderColor3 = Color3.new(0,0,0);
																		Size = UDim2.new(0,24,0,24);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(1,1,1);
																	};
																	Children = {};
																};
																{
																	ID = 133;
																	Type = "UICorner";
																	Properties = {};
																	Children = {};
																};
															};
														};
													};
												};
												{
													ID = 134;
													Type = "UIPadding";
													Properties = {
														PaddingBottom = UDim.new(0,8);
														PaddingTop = UDim.new(0,8);
														PaddingRight = UDim.new(0,8);
														PaddingLeft = UDim.new(0,8);
													};
													Children = {};
												};
												{
													ID = 135;
													Type = "Frame";
													Properties = {
														LayoutOrder = 2;
														Name = "Search";
														BorderColor3 = Color3.new(0,0,0);
														BackgroundColor3 = Color3.new(47/255,16/85,52/255);
														BorderSizePixel = 0;
														Size = UDim2.new(1,0,0,36);
													};
													Children = {
														{
															ID = 136;
															Type = "TextBox";
															Properties = {
																LayoutOrder = 1;
																ClearTextOnFocus = false;
																ClipsDescendants = true;
																BorderColor3 = Color3.new(0,0,0);
																Text = "";
																TextXAlignment = Enum.TextXAlignment.Left;
																TextColor3 = Color3.new(1,1,1);
																Size = UDim2.new(1,-64,0,36);
																Font = Enum.Font.SourceSansSemibold;
																BackgroundTransparency = 1;
																Position = UDim2.new(0,10,0,0);
																TextSize = 28;
																PlaceholderText = "Search";
																BorderSizePixel = 0;
																BackgroundColor3 = Color3.new(1,1,1);
															};
															Children = {};
														};
														{
															ID = 137;
															Type = "ImageLabel";
															Properties = {
																ScaleType = Enum.ScaleType.Fit;
																BackgroundTransparency = 1;
																Active = true;
																Selectable = true;
																ImageRectOffset = Vector2.new(304,156);
																Position = UDim2.new(0,0,0.5,0);
																BorderColor3 = Color3.new(0,0,0);
																AnchorPoint = Vector2.new(0,0.5);
																Image = "rbxasset://textures/ui/ImageSet/LuaApp/img_set_2x_3.png";
																Name = "Icon";
																ImageRectSize = Vector2.new(48,50);
																SizeConstraint = Enum.SizeConstraint.RelativeYY;
																Size = UDim2.new(0,24,0,24);
																BorderSizePixel = 0;
																BackgroundColor3 = Color3.new(248/255,248/255,248/255);
															};
															Children = {};
														};
														{
															ID = 138;
															Type = "UIPadding";
															Properties = {
																PaddingRight = UDim.new(0,8);
																PaddingLeft = UDim.new(0,8);
															};
															Children = {};
														};
														{
															ID = 139;
															Type = "ImageButton";
															Properties = {
																LayoutOrder = 2;
																ScaleType = Enum.ScaleType.Fit;
																BorderColor3 = Color3.new(0,0,0);
																ImageRectOffset = Vector2.new(0,325);
																AnchorPoint = Vector2.new(1,0.5);
																Image = "rbxasset://textures/ui/ImageSet/AE/img_set_1x_2.png";
																Name = "Clear";
																ImageRectSize = Vector2.new(24,24);
																Position = UDim2.new(1,0,0.5,0);
																Size = UDim2.new(0,24,0,24);
																BorderSizePixel = 0;
																BackgroundColor3 = Color3.new(47/255,16/85,52/255);
															};
															Children = {
																{
																	ID = 140;
																	Type = "UICorner";
																	Properties = {};
																	Children = {};
																};
															};
														};
														{
															ID = 141;
															Type = "UIListLayout";
															Properties = {
																VerticalAlignment = Enum.VerticalAlignment.Center;
																FillDirection = Enum.FillDirection.Horizontal;
																SortOrder = Enum.SortOrder.LayoutOrder;
																Padding = UDim.new(0,8);
															};
															Children = {};
														};
														{
															ID = 142;
															Type = "UICorner";
															Properties = {};
															Children = {};
														};
													};
												};
												{
													ID = 143;
													Type = "Frame";
													Properties = {
														LayoutOrder = 1;
														ClipsDescendants = true;
														BorderColor3 = Color3.new(0,0,0);
														Name = "SubTabs";
														BackgroundColor3 = Color3.new(1,1,1);
														BackgroundTransparency = 1;
														ZIndex = 2;
														BorderSizePixel = 0;
														Size = UDim2.new(1,0,0,36);
													};
													Children = {
														{
															ID = 144;
															Type = "Frame";
															Properties = {
																Name = "Accessories";
																BackgroundColor3 = Color3.new(1,1,1);
																BorderColor3 = Color3.new(0,0,0);
																BackgroundTransparency = 1;
																BorderSizePixel = 0;
																Size = UDim2.new(1,0,1,0);
															};
															Children = {
																{
																	ID = 145;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 6;
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Back";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "BackAccessory";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 146;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(1555,407);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 147;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 148;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Back";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 149;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 150;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 151;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 152;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 2;
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Face";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "FaceAccessory";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 153;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(1274,321);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 154;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 155;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Face";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 156;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 157;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 158;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 159;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 5;
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Front";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "FrontAccessory";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 160;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(1039,407);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 161;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 162;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Front";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 163;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 164;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 165;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 166;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 1;
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Hair";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "HairAccessory";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 167;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(695,407);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 168;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 169;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Hair";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 170;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 171;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 172;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 173;
																	Type = "TextButton";
																	Properties = {
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Hat";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "Hat";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 174;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(93,407);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 175;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 176;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Hats";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 177;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 178;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 179;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 180;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 3;
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Neck";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "NeckAccessory";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 181;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(953,493);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 182;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 183;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Neck";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 184;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 185;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 186;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 187;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 4;
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Shoulder";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "ShoulderAccessory";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 188;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(930,321);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 189;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 190;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Shoulder";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 191;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 192;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 193;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 194;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 7;
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Waist";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "WaistAccessory";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 195;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(1016,321);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 196;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 197;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Waist";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 198;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 199;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 200;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 201;
																	Type = "UIGridLayout";
																	Properties = {
																		CellPadding = UDim2.new(0,8,0,0);
																		SortOrder = Enum.SortOrder.LayoutOrder;
																		HorizontalAlignment = Enum.HorizontalAlignment.Center;
																		CellSize = UDim2.new(0.125,-8,1,0);
																	};
																	Children = {};
																};
															};
														};
														{
															ID = 202;
															Type = "Frame";
															Properties = {
																LayoutOrder = 5;
																BackgroundColor3 = Color3.new(1,1,1);
																Name = "Appearance";
																Visible = false;
																BorderColor3 = Color3.new(0,0,0);
																BackgroundTransparency = 1;
																BorderSizePixel = 0;
																Size = UDim2.new(1,0,1,0);
															};
															Children = {
																{
																	ID = 203;
																	Type = "UIGridLayout";
																	Properties = {
																		CellPadding = UDim2.new(0,8,0,0);
																		SortOrder = Enum.SortOrder.LayoutOrder;
																		HorizontalAlignment = Enum.HorizontalAlignment.Center;
																		CellSize = UDim2.new(0.5,-8,1,0);
																	};
																	Children = {};
																};
																{
																	ID = 204;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 1;
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Scale";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "Scale";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 205;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(609,493);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 206;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 207;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Scale";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 208;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 209;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 210;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 211;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 1;
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Skin Tone";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "SkinTone";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 212;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(7,493);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 213;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 214;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Skin Tone";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 215;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 216;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 217;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
															};
														};
														{
															ID = 218;
															Type = "Frame";
															Properties = {
																LayoutOrder = 2;
																Name = "Body";
																BackgroundColor3 = Color3.new(1,1,1);
																BorderColor3 = Color3.new(0,0,0);
																BackgroundTransparency = 1;
																BorderSizePixel = 0;
																Size = UDim2.new(1,0,1,0);
															};
															Children = {
																{
																	ID = 219;
																	Type = "UIGridLayout";
																	Properties = {
																		CellPadding = UDim2.new(0,8,0,0);
																		SortOrder = Enum.SortOrder.LayoutOrder;
																		HorizontalAlignment = Enum.HorizontalAlignment.Center;
																		CellSize = UDim2.new(0.14300000667572,-8,1,0);
																	};
																	Children = {};
																};
																{
																	ID = 220;
																	Type = "TextButton";
																	Properties = {
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Face";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "Face";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 221;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(7,407);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 222;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 223;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Face";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 224;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 225;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 226;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 227;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 2;
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Head";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "Head";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 228;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(437,579);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 229;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 230;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Head";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 231;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 232;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 233;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 234;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 3;
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Left Arm";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "LeftArm";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 235;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(1126,493);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 236;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 237;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Left Arm";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 238;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 239;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 240;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 241;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 5;
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Left Leg";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "LeftLeg";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 242;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(1039,493);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 243;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 244;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Left Leg";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 245;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 246;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 247;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 248;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 4;
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Right Arm";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "RightArm";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 249;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(1731,493);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 250;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 251;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Right Arm";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 252;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 253;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 254;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 255;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 6;
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Right Leg";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "RightLeg";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 256;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(1641,493);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 257;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 258;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Right Leg";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 259;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 260;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 261;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 262;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 2;
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Torso";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "Torso";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 263;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(242,321);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 264;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 265;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Torso";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 266;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 267;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 268;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
															};
														};
														{
															ID = 269;
															Type = "Frame";
															Properties = {
																LayoutOrder = 1;
																Name = "Clothes";
																BackgroundColor3 = Color3.new(1,1,1);
																BorderColor3 = Color3.new(0,0,0);
																BackgroundTransparency = 1;
																BorderSizePixel = 0;
																Size = UDim2.new(1,0,1,0);
															};
															Children = {
																{
																	ID = 270;
																	Type = "UIGridLayout";
																	Properties = {
																		CellPadding = UDim2.new(0,8,0,0);
																		SortOrder = Enum.SortOrder.LayoutOrder;
																		HorizontalAlignment = Enum.HorizontalAlignment.Center;
																		CellSize = UDim2.new(0.5,-8,1,0);
																	};
																	Children = {};
																};
																{
																	ID = 271;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 1;
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Pants";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "Pants";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 272;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(695,493);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 273;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 274;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Pants";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 275;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 276;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 277;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 278;
																	Type = "TextButton";
																	Properties = {
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Shirt";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "Shirt";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 279;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(586,321);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 280;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 281;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Shirt";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 282;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 283;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 284;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
															};
														};
														{
															ID = 285;
															Type = "Frame";
															Properties = {
																LayoutOrder = 3;
																Name = "Animations";
																BackgroundColor3 = Color3.new(1,1,1);
																BorderColor3 = Color3.new(0,0,0);
																BackgroundTransparency = 1;
																BorderSizePixel = 0;
																Size = UDim2.new(1,0,1,0);
															};
															Children = {
																{
																	ID = 286;
																	Type = "UIGridLayout";
																	Properties = {
																		CellPadding = UDim2.new(0,8,0,0);
																		SortOrder = Enum.SortOrder.LayoutOrder;
																		HorizontalAlignment = Enum.HorizontalAlignment.Center;
																		CellSize = UDim2.new(0.14300000667572,-8,1,0);
																	};
																	Children = {};
																};
																{
																	ID = 287;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 5;
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Climb";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "ClimbAnimation";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 288;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(179,493);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 289;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 290;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Climb";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 291;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 292;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 293;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 294;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 4;
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Fall";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "FallAnimation";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 295;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(523,407);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 296;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 297;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Fall";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 298;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 299;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 300;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 301;
																	Type = "TextButton";
																	Properties = {
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Idle";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "IdleAnimation";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 302;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(265,579);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 303;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 304;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Idle";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 305;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 306;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 307;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 308;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 3;
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Jump";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "JumpAnimation";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 309;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(94,579);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 310;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 311;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Jump";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 312;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 313;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 314;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 315;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 2;
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Run";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "RunAnimation";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 316;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(1639,407);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 317;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 318;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Run";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 319;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 320;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 321;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 322;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 6;
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Swim";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "SwimAnimation";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 323;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(328,324);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 324;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 325;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Swim";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 326;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 327;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 328;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 329;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 2;
																		TextWrapped = true;
																		TextColor3 = Color3.new(1,1,1);
																		BorderColor3 = Color3.new(0,0,0);
																		Text = "Walk";
																		TextSize = 28;
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "WalkAnimation";
																		Size = UDim2.new(0,48,1,0);
																		ClipsDescendants = true;
																		MaxVisibleGraphemes = 0;
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(47/255,16/85,52/255);
																	};
																	Children = {
																		{
																			ID = 330;
																			Type = "ImageLabel";
																			Properties = {
																				LayoutOrder = 1;
																				ScaleType = Enum.ScaleType.Fit;
																				Selectable = true;
																				BackgroundTransparency = 1;
																				ImageRectOffset = Vector2.new(1706,321);
																				Position = UDim2.new(0.5,0,0.5,0);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
																				Name = "Icon";
																				ImageRectSize = Vector2.new(72,72);
																				BorderColor3 = Color3.new(0,0,0);
																				Size = UDim2.new(0,24,0,24);
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {};
																		};
																		{
																			ID = 331;
																			Type = "UICorner";
																			Properties = {};
																			Children = {};
																		};
																		{
																			ID = 332;
																			Type = "TextLabel";
																			Properties = {
																				Visible = false;
																				Selectable = true;
																				Active = true;
																				BorderColor3 = Color3.new(0,0,0);
																				Text = "Walk";
																				TextSize = 18;
																				TextColor3 = Color3.new(1,1,1);
																				AnchorPoint = Vector2.new(0.5,0);
																				Font = Enum.Font.SourceSansSemibold;
																				Name = "Tooltip";
																				Position = UDim2.new(0.5,0,1,6);
																				Size = UDim2.new(0,10,0,24);
																				AutomaticSize = Enum.AutomaticSize.X;
																				BorderSizePixel = 0;
																				BackgroundColor3 = Color3.new(97/255,97/255,97/255);
																			};
																			Children = {
																				{
																					ID = 333;
																					Type = "UIPadding";
																					Properties = {
																						PaddingRight = UDim.new(0,10);
																						PaddingLeft = UDim.new(0,10);
																					};
																					Children = {};
																				};
																				{
																					ID = 334;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																				{
																					ID = 335;
																					Type = "UIScale";
																					Properties = {};
																					Children = {};
																				};
																			};
																		};
																	};
																};
															};
														};
														{
															ID = 336;
															Type = "UIPageLayout";
															Properties = {
																SortOrder = Enum.SortOrder.LayoutOrder;
																Circular = true;
																GamepadInputEnabled = false;
																ScrollWheelInputEnabled = false;
																Animated = false;
																TouchInputEnabled = false;
																FillDirection = Enum.FillDirection.Vertical;
															};
															Children = {};
														};
														{
															ID = 337;
															Type = "Frame";
															Properties = {
																LayoutOrder = 4;
																Name = "Wearing";
																BackgroundColor3 = Color3.new(1,1,1);
																BorderColor3 = Color3.new(0,0,0);
																BackgroundTransparency = 1;
																BorderSizePixel = 0;
																Size = UDim2.new(1,0,1,0);
															};
															Children = {};
														};
													};
												};
											};
										};
										{
											ID = 338;
											Type = "Frame";
											Properties = {
												LayoutOrder = 1;
												Name = "Container";
												BackgroundColor3 = Color3.new(1,1,1);
												BorderColor3 = Color3.new(0,0,0);
												BackgroundTransparency = 1;
												BorderSizePixel = 0;
												Size = UDim2.new(1,0,1,-140);
											};
											Children = {
												{
													ID = 339;
													Type = "ScrollingFrame";
													Properties = {
														MidImage = "rbxasset://textures/SurfacesDefault.png";
														Active = true;
														Selectable = false;
														ScrollBarThickness = 8;
														BorderColor3 = Color3.new(0,0,0);
														ElasticBehavior = Enum.ElasticBehavior.Always;
														VerticalScrollBarInset = Enum.ScrollBarInset.Always;
														Size = UDim2.new(1,0,1,0);
														TopImage = "rbxasset://textures/SurfacesDefault.png";
														ScrollingDirection = Enum.ScrollingDirection.Y;
														BackgroundTransparency = 1;
														BottomImage = "rbxasset://textures/SurfacesDefault.png";
														BorderSizePixel = 0;
														BackgroundColor3 = Color3.new(1,1,1);
													};
													Children = {
														{
															ID = 340;
															Type = "UIGridLayout";
															Properties = {
																SortOrder = Enum.SortOrder.LayoutOrder;
																CellSize = UDim2.new(0.25,-8,1,0);
																CellPadding = UDim2.new(0,8,0,8);
															};
															Children = {
																{
																	ID = 341;
																	Type = "UIAspectRatioConstraint";
																	Properties = {};
																	Children = {};
																};
															};
														};
													};
												};
												{
													ID = 342;
													Type = "UIPadding";
													Properties = {
														PaddingBottom = UDim.new(0,8);
														PaddingTop = UDim.new(0,8);
														PaddingRight = UDim.new(0,8);
														PaddingLeft = UDim.new(0,8);
													};
													Children = {};
												};
											};
										};
										{
											ID = 343;
											Type = "UIListLayout";
											Properties = {
												SortOrder = Enum.SortOrder.LayoutOrder;
											};
											Children = {};
										};
									};
								};
								{
									ID = 344;
									Type = "Frame";
									Properties = {
										BackgroundColor3 = Color3.new(1,1,1);
										BackgroundTransparency = 1;
										Name = "Loading";
										Size = UDim2.new(1,0,1,0);
									};
									Children = {
										{
											ID = 345;
											Type = "TextLabel";
											Properties = {
												TextWrapped = true;
												TextColor3 = Color3.new(1,1,1);
												Text = "loading...";
												Font = Enum.Font.GothamBlack;
												BackgroundTransparency = 1;
												TextSize = 14;
												Size = UDim2.new(1,0,1,0);
												TextScaled = true;
												BackgroundColor3 = Color3.new(1,1,1);
											};
											Children = {};
										};
									};
								};
								{
									ID = 346;
									Type = "Frame";
									Properties = {
										LayoutOrder = 2;
										Name = "Appearance";
										BackgroundColor3 = Color3.new(1,1,1);
										BackgroundTransparency = 1;
										Size = UDim2.new(1,0,1,0);
									};
									Children = {
										{
											ID = 347;
											Type = "UIListLayout";
											Properties = {
												SortOrder = Enum.SortOrder.LayoutOrder;
												FillDirection = Enum.FillDirection.Horizontal;
											};
											Children = {};
										};
										{
											ID = 348;
											Type = "ScrollingFrame";
											Properties = {
												ElasticBehavior = Enum.ElasticBehavior.Always;
												MidImage = "rbxasset://textures/SurfacesDefault.png";
												Name = "Scale";
												Active = true;
												Selectable = false;
												ScrollBarThickness = 8;
												BackgroundTransparency = 1;
												AutomaticCanvasSize = Enum.AutomaticSize.Y;
												VerticalScrollBarInset = Enum.ScrollBarInset.Always;
												Size = UDim2.new(0.5,0,1,0);
												TopImage = "rbxasset://textures/SurfacesDefault.png";
												ScrollingDirection = Enum.ScrollingDirection.Y;
												BackgroundColor3 = Color3.new(1,1,1);
												BottomImage = "rbxasset://textures/SurfacesDefault.png";
												BorderSizePixel = 0;
												CanvasSize = UDim2.new(0,0,1,0);
											};
											Children = {
												{
													ID = 349;
													Type = "Frame";
													Properties = {
														BackgroundColor3 = Color3.new(1,1,1);
														BackgroundTransparency = 1;
														Name = "Height";
														Size = UDim2.new(1,0,0,56);
													};
													Children = {
														{
															ID = 350;
															Type = "TextLabel";
															Properties = {
																Size = UDim2.new(0,200,0,28);
																Font = Enum.Font.SourceSansSemibold;
																BackgroundTransparency = 1;
																TextColor3 = Color3.new(1,1,1);
																TextXAlignment = Enum.TextXAlignment.Left;
																Text = "Height";
																TextSize = 28;
																BackgroundColor3 = Color3.new(1,1,1);
															};
															Children = {};
														};
														{
															ID = 351;
															Type = "Frame";
															Properties = {
																BackgroundColor3 = Color3.new(29/255,29/255,2/17);
																Name = "SliderFrame";
																Position = UDim2.new(0,0,0,36);
																BackgroundTransparency = 1;
																ZIndex = 2;
																BorderSizePixel = 0;
																Size = UDim2.new(1,0,0,20);
															};
															Children = {
																{
																	ID = 352;
																	Type = "Frame";
																	Properties = {
																		AnchorPoint = Vector2.new(0.5,0.5);
																		Name = "Background";
																		Position = UDim2.new(0.5,0,0.5,0);
																		BackgroundColor3 = Color3.new(1,1,1);
																		BackgroundTransparency = 1;
																		Size = UDim2.new(1,0,1,0);
																	};
																	Children = {
																		{
																			ID = 353;
																			Type = "Frame";
																			Properties = {
																				LayoutOrder = 1;
																				Name = "Bar";
																				Position = UDim2.new(0.5,0,0.5,0);
																				BackgroundColor3 = Color3.new(5/51,9/85,29/255);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				BorderSizePixel = 0;
																				Size = UDim2.new(1,0,0,8);
																			};
																			Children = {
																				{
																					ID = 354;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 355;
																	Type = "Frame";
																	Properties = {
																		Active = true;
																		Selectable = true;
																		AnchorPoint = Vector2.new(0.5,0.5);
																		Name = "Dragger";
																		Position = UDim2.new(0.5,0,0.5,0);
																		SizeConstraint = Enum.SizeConstraint.RelativeXX;
																		ZIndex = 4;
																		BackgroundColor3 = Color3.new(1,1,1);
																		Size = UDim2.new(0,20,0,20);
																	};
																	Children = {
																		{
																			ID = 356;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0.5);
																			};
																			Children = {};
																		};
																	};
																};
															};
														};
														{
															ID = 357;
															Type = "Frame";
															Properties = {
																AnchorPoint = Vector2.new(1,0);
																Name = "TextFrame";
																Position = UDim2.new(1,0,0,0);
																BackgroundColor3 = Color3.new(29/255,29/255,2/17);
																ZIndex = 2;
																BorderSizePixel = 0;
																Size = UDim2.new(0,50,0,30);
															};
															Children = {
																{
																	ID = 358;
																	Type = "TextBox";
																	Properties = {
																		Font = Enum.Font.SourceSansSemibold;
																		BackgroundTransparency = 1;
																		TextColor3 = Color3.new(1,1,1);
																		Size = UDim2.new(1,0,1,0);
																		Text = "100";
																		TextSize = 20;
																		BackgroundColor3 = Color3.new(1,1,1);
																	};
																	Children = {};
																};
																{
																	ID = 359;
																	Type = "UICorner";
																	Properties = {};
																	Children = {};
																};
															};
														};
													};
												};
												{
													ID = 360;
													Type = "UIPadding";
													Properties = {
														PaddingBottom = UDim.new(0,8);
														PaddingTop = UDim.new(0,8);
														PaddingRight = UDim.new(0,8);
														PaddingLeft = UDim.new(0,8);
													};
													Children = {};
												};
												{
													ID = 361;
													Type = "UIListLayout";
													Properties = {
														SortOrder = Enum.SortOrder.LayoutOrder;
														Padding = UDim.new(0,8);
													};
													Children = {};
												};
												{
													ID = 362;
													Type = "Frame";
													Properties = {
														LayoutOrder = 1;
														Name = "Width";
														BackgroundColor3 = Color3.new(1,1,1);
														BackgroundTransparency = 1;
														Size = UDim2.new(1,0,0,56);
													};
													Children = {
														{
															ID = 363;
															Type = "TextLabel";
															Properties = {
																Size = UDim2.new(0,200,0,28);
																Font = Enum.Font.SourceSansSemibold;
																BackgroundTransparency = 1;
																TextColor3 = Color3.new(1,1,1);
																TextXAlignment = Enum.TextXAlignment.Left;
																Text = "Width";
																TextSize = 28;
																BackgroundColor3 = Color3.new(1,1,1);
															};
															Children = {};
														};
														{
															ID = 364;
															Type = "Frame";
															Properties = {
																BackgroundColor3 = Color3.new(29/255,29/255,2/17);
																Name = "SliderFrame";
																Position = UDim2.new(0,0,0,36);
																BackgroundTransparency = 1;
																ZIndex = 2;
																BorderSizePixel = 0;
																Size = UDim2.new(1,0,0,20);
															};
															Children = {
																{
																	ID = 365;
																	Type = "Frame";
																	Properties = {
																		AnchorPoint = Vector2.new(0.5,0.5);
																		Name = "Background";
																		Position = UDim2.new(0.5,0,0.5,0);
																		BackgroundColor3 = Color3.new(1,1,1);
																		BackgroundTransparency = 1;
																		Size = UDim2.new(1,0,1,0);
																	};
																	Children = {
																		{
																			ID = 366;
																			Type = "Frame";
																			Properties = {
																				LayoutOrder = 1;
																				Name = "Bar";
																				Position = UDim2.new(0.5,0,0.5,0);
																				BackgroundColor3 = Color3.new(5/51,9/85,29/255);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				BorderSizePixel = 0;
																				Size = UDim2.new(1,0,0,8);
																			};
																			Children = {
																				{
																					ID = 367;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 368;
																	Type = "Frame";
																	Properties = {
																		Active = true;
																		Selectable = true;
																		AnchorPoint = Vector2.new(0.5,0.5);
																		Name = "Dragger";
																		Position = UDim2.new(0.5,0,0.5,0);
																		SizeConstraint = Enum.SizeConstraint.RelativeXX;
																		ZIndex = 4;
																		BackgroundColor3 = Color3.new(1,1,1);
																		Size = UDim2.new(0,20,0,20);
																	};
																	Children = {
																		{
																			ID = 369;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0.5);
																			};
																			Children = {};
																		};
																	};
																};
															};
														};
														{
															ID = 370;
															Type = "Frame";
															Properties = {
																AnchorPoint = Vector2.new(1,0);
																Name = "TextFrame";
																Position = UDim2.new(1,0,0,0);
																BackgroundColor3 = Color3.new(29/255,29/255,2/17);
																ZIndex = 2;
																BorderSizePixel = 0;
																Size = UDim2.new(0,50,0,30);
															};
															Children = {
																{
																	ID = 371;
																	Type = "TextBox";
																	Properties = {
																		Font = Enum.Font.SourceSansSemibold;
																		BackgroundTransparency = 1;
																		TextColor3 = Color3.new(1,1,1);
																		Size = UDim2.new(1,0,1,0);
																		Text = "100";
																		TextSize = 20;
																		BackgroundColor3 = Color3.new(1,1,1);
																	};
																	Children = {};
																};
																{
																	ID = 372;
																	Type = "UICorner";
																	Properties = {};
																	Children = {};
																};
															};
														};
													};
												};
												{
													ID = 373;
													Type = "Frame";
													Properties = {
														LayoutOrder = 2;
														Name = "Head";
														BackgroundColor3 = Color3.new(1,1,1);
														BackgroundTransparency = 1;
														Size = UDim2.new(1,0,0,56);
													};
													Children = {
														{
															ID = 374;
															Type = "TextLabel";
															Properties = {
																Size = UDim2.new(0,200,0,28);
																Font = Enum.Font.SourceSansSemibold;
																BackgroundTransparency = 1;
																TextColor3 = Color3.new(1,1,1);
																TextXAlignment = Enum.TextXAlignment.Left;
																Text = "Head";
																TextSize = 28;
																BackgroundColor3 = Color3.new(1,1,1);
															};
															Children = {};
														};
														{
															ID = 375;
															Type = "Frame";
															Properties = {
																BackgroundColor3 = Color3.new(29/255,29/255,2/17);
																Name = "SliderFrame";
																Position = UDim2.new(0,0,0,36);
																BackgroundTransparency = 1;
																ZIndex = 2;
																BorderSizePixel = 0;
																Size = UDim2.new(1,0,0,20);
															};
															Children = {
																{
																	ID = 376;
																	Type = "Frame";
																	Properties = {
																		AnchorPoint = Vector2.new(0.5,0.5);
																		Name = "Background";
																		Position = UDim2.new(0.5,0,0.5,0);
																		BackgroundColor3 = Color3.new(1,1,1);
																		BackgroundTransparency = 1;
																		Size = UDim2.new(1,0,1,0);
																	};
																	Children = {
																		{
																			ID = 377;
																			Type = "Frame";
																			Properties = {
																				LayoutOrder = 1;
																				Name = "Bar";
																				Position = UDim2.new(0.5,0,0.5,0);
																				BackgroundColor3 = Color3.new(5/51,9/85,29/255);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				BorderSizePixel = 0;
																				Size = UDim2.new(1,0,0,8);
																			};
																			Children = {
																				{
																					ID = 378;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 379;
																	Type = "Frame";
																	Properties = {
																		Active = true;
																		Selectable = true;
																		AnchorPoint = Vector2.new(0.5,0.5);
																		Name = "Dragger";
																		Position = UDim2.new(0.5,0,0.5,0);
																		SizeConstraint = Enum.SizeConstraint.RelativeXX;
																		ZIndex = 4;
																		BackgroundColor3 = Color3.new(1,1,1);
																		Size = UDim2.new(0,20,0,20);
																	};
																	Children = {
																		{
																			ID = 380;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0.5);
																			};
																			Children = {};
																		};
																	};
																};
															};
														};
														{
															ID = 381;
															Type = "Frame";
															Properties = {
																AnchorPoint = Vector2.new(1,0);
																Name = "TextFrame";
																Position = UDim2.new(1,0,0,0);
																BackgroundColor3 = Color3.new(29/255,29/255,2/17);
																ZIndex = 2;
																BorderSizePixel = 0;
																Size = UDim2.new(0,50,0,30);
															};
															Children = {
																{
																	ID = 382;
																	Type = "TextBox";
																	Properties = {
																		Font = Enum.Font.SourceSansSemibold;
																		BackgroundTransparency = 1;
																		TextColor3 = Color3.new(1,1,1);
																		Size = UDim2.new(1,0,1,0);
																		Text = "100";
																		TextSize = 20;
																		BackgroundColor3 = Color3.new(1,1,1);
																	};
																	Children = {};
																};
																{
																	ID = 383;
																	Type = "UICorner";
																	Properties = {};
																	Children = {};
																};
															};
														};
													};
												};
												{
													ID = 384;
													Type = "Frame";
													Properties = {
														LayoutOrder = 3;
														Name = "Proportion";
														BackgroundColor3 = Color3.new(1,1,1);
														BackgroundTransparency = 1;
														Size = UDim2.new(1,0,0,56);
													};
													Children = {
														{
															ID = 385;
															Type = "TextLabel";
															Properties = {
																Size = UDim2.new(0,200,0,28);
																Font = Enum.Font.SourceSansSemibold;
																BackgroundTransparency = 1;
																TextColor3 = Color3.new(1,1,1);
																TextXAlignment = Enum.TextXAlignment.Left;
																Text = "Proportions";
																TextSize = 28;
																BackgroundColor3 = Color3.new(1,1,1);
															};
															Children = {};
														};
														{
															ID = 386;
															Type = "Frame";
															Properties = {
																BackgroundColor3 = Color3.new(29/255,29/255,2/17);
																Name = "SliderFrame";
																Position = UDim2.new(0,0,0,36);
																BackgroundTransparency = 1;
																ZIndex = 2;
																BorderSizePixel = 0;
																Size = UDim2.new(1,0,0,20);
															};
															Children = {
																{
																	ID = 387;
																	Type = "Frame";
																	Properties = {
																		AnchorPoint = Vector2.new(0.5,0.5);
																		Name = "Background";
																		Position = UDim2.new(0.5,0,0.5,0);
																		BackgroundColor3 = Color3.new(1,1,1);
																		BackgroundTransparency = 1;
																		Size = UDim2.new(1,0,1,0);
																	};
																	Children = {
																		{
																			ID = 388;
																			Type = "Frame";
																			Properties = {
																				LayoutOrder = 1;
																				Name = "Bar";
																				Position = UDim2.new(0.5,0,0.5,0);
																				BackgroundColor3 = Color3.new(5/51,9/85,29/255);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				BorderSizePixel = 0;
																				Size = UDim2.new(1,0,0,8);
																			};
																			Children = {
																				{
																					ID = 389;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 390;
																	Type = "Frame";
																	Properties = {
																		Active = true;
																		Selectable = true;
																		AnchorPoint = Vector2.new(0.5,0.5);
																		Name = "Dragger";
																		Position = UDim2.new(0.5,0,0.5,0);
																		SizeConstraint = Enum.SizeConstraint.RelativeXX;
																		ZIndex = 4;
																		BackgroundColor3 = Color3.new(1,1,1);
																		Size = UDim2.new(0,20,0,20);
																	};
																	Children = {
																		{
																			ID = 391;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0.5);
																			};
																			Children = {};
																		};
																	};
																};
															};
														};
														{
															ID = 392;
															Type = "Frame";
															Properties = {
																AnchorPoint = Vector2.new(1,0);
																Name = "TextFrame";
																Position = UDim2.new(1,0,0,0);
																BackgroundColor3 = Color3.new(29/255,29/255,2/17);
																ZIndex = 2;
																BorderSizePixel = 0;
																Size = UDim2.new(0,50,0,30);
															};
															Children = {
																{
																	ID = 393;
																	Type = "TextBox";
																	Properties = {
																		Font = Enum.Font.SourceSansSemibold;
																		BackgroundTransparency = 1;
																		TextColor3 = Color3.new(1,1,1);
																		Size = UDim2.new(1,0,1,0);
																		Text = "100";
																		TextSize = 20;
																		BackgroundColor3 = Color3.new(1,1,1);
																	};
																	Children = {};
																};
																{
																	ID = 394;
																	Type = "UICorner";
																	Properties = {};
																	Children = {};
																};
															};
														};
													};
												};
												{
													ID = 395;
													Type = "Frame";
													Properties = {
														LayoutOrder = 4;
														Name = "BodyType";
														BackgroundColor3 = Color3.new(1,1,1);
														BackgroundTransparency = 1;
														Size = UDim2.new(1,0,0,56);
													};
													Children = {
														{
															ID = 396;
															Type = "TextLabel";
															Properties = {
																Size = UDim2.new(0,200,0,28);
																Font = Enum.Font.SourceSansSemibold;
																BackgroundTransparency = 1;
																TextColor3 = Color3.new(1,1,1);
																TextXAlignment = Enum.TextXAlignment.Left;
																Text = "Body Type";
																TextSize = 28;
																BackgroundColor3 = Color3.new(1,1,1);
															};
															Children = {};
														};
														{
															ID = 397;
															Type = "Frame";
															Properties = {
																BackgroundColor3 = Color3.new(29/255,29/255,2/17);
																Name = "SliderFrame";
																Position = UDim2.new(0,0,0,36);
																BackgroundTransparency = 1;
																ZIndex = 2;
																BorderSizePixel = 0;
																Size = UDim2.new(1,0,0,20);
															};
															Children = {
																{
																	ID = 398;
																	Type = "Frame";
																	Properties = {
																		AnchorPoint = Vector2.new(0.5,0.5);
																		Name = "Background";
																		Position = UDim2.new(0.5,0,0.5,0);
																		BackgroundColor3 = Color3.new(1,1,1);
																		BackgroundTransparency = 1;
																		Size = UDim2.new(1,0,1,0);
																	};
																	Children = {
																		{
																			ID = 399;
																			Type = "Frame";
																			Properties = {
																				LayoutOrder = 1;
																				Name = "Bar";
																				Position = UDim2.new(0.5,0,0.5,0);
																				BackgroundColor3 = Color3.new(5/51,9/85,29/255);
																				AnchorPoint = Vector2.new(0.5,0.5);
																				BorderSizePixel = 0;
																				Size = UDim2.new(1,0,0,8);
																			};
																			Children = {
																				{
																					ID = 400;
																					Type = "UICorner";
																					Properties = {
																						CornerRadius = UDim.new(0.5);
																					};
																					Children = {};
																				};
																			};
																		};
																	};
																};
																{
																	ID = 401;
																	Type = "Frame";
																	Properties = {
																		Active = true;
																		Selectable = true;
																		AnchorPoint = Vector2.new(0.5,0.5);
																		Name = "Dragger";
																		Position = UDim2.new(0.5,0,0.5,0);
																		SizeConstraint = Enum.SizeConstraint.RelativeXX;
																		ZIndex = 4;
																		BackgroundColor3 = Color3.new(1,1,1);
																		Size = UDim2.new(0,20,0,20);
																	};
																	Children = {
																		{
																			ID = 402;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0.5);
																			};
																			Children = {};
																		};
																	};
																};
															};
														};
														{
															ID = 403;
															Type = "Frame";
															Properties = {
																AnchorPoint = Vector2.new(1,0);
																Name = "TextFrame";
																Position = UDim2.new(1,0,0,0);
																BackgroundColor3 = Color3.new(29/255,29/255,2/17);
																ZIndex = 2;
																BorderSizePixel = 0;
																Size = UDim2.new(0,50,0,30);
															};
															Children = {
																{
																	ID = 404;
																	Type = "TextBox";
																	Properties = {
																		Font = Enum.Font.SourceSansSemibold;
																		BackgroundTransparency = 1;
																		TextColor3 = Color3.new(1,1,1);
																		Size = UDim2.new(1,0,1,0);
																		Text = "100";
																		TextSize = 20;
																		BackgroundColor3 = Color3.new(1,1,1);
																	};
																	Children = {};
																};
																{
																	ID = 405;
																	Type = "UICorner";
																	Properties = {};
																	Children = {};
																};
															};
														};
													};
												};
											};
										};
										{
											ID = 406;
											Type = "ScrollingFrame";
											Properties = {
												LayoutOrder = 1;
												MidImage = "rbxasset://textures/SurfacesDefault.png";
												ElasticBehavior = Enum.ElasticBehavior.Always;
												Active = true;
												Selectable = false;
												ScrollBarThickness = 8;
												BackgroundColor3 = Color3.new(1,1,1);
												BackgroundTransparency = 1;
												VerticalScrollBarInset = Enum.ScrollBarInset.Always;
												AutomaticCanvasSize = Enum.AutomaticSize.Y;
												Name = "SkinTone";
												ScrollingDirection = Enum.ScrollingDirection.Y;
												Size = UDim2.new(0.5,0,1,0);
												BottomImage = "rbxasset://textures/SurfacesDefault.png";
												TopImage = "rbxasset://textures/SurfacesDefault.png";
												CanvasSize = UDim2.new(0,0,1,0);
											};
											Children = {
												{
													ID = 407;
													Type = "UIGridLayout";
													Properties = {
														CellSize = UDim2.new(0.14300000667572,-5,1,0);
														SortOrder = Enum.SortOrder.LayoutOrder;
													};
													Children = {
														{
															ID = 408;
															Type = "UIAspectRatioConstraint";
															Properties = {};
															Children = {};
														};
													};
												};
											};
										};
										{
											ID = 409;
											Type = "UIPadding";
											Properties = {
												PaddingBottom = UDim.new(0,8);
												PaddingTop = UDim.new(0,8);
												PaddingRight = UDim.new(0,8);
												PaddingLeft = UDim.new(0,8);
											};
											Children = {};
										};
									};
								};
								{
									ID = 410;
									Type = "UIPageLayout";
									Properties = {
										Animated = false;
										Circular = true;
										GamepadInputEnabled = false;
										ScrollWheelInputEnabled = false;
										TouchInputEnabled = false;
										SortOrder = Enum.SortOrder.LayoutOrder;
									};
									Children = {};
								};
								{
									ID = 411;
									Type = "Frame";
									Properties = {
										LayoutOrder = 4;
										Name = "Costume";
										BackgroundColor3 = Color3.new(1,1,1);
										BackgroundTransparency = 1;
										Size = UDim2.new(1,0,1,0);
									};
									Children = {
										{
											ID = 412;
											Type = "ScrollingFrame";
											Properties = {
												MidImage = "rbxasset://textures/SurfacesDefault.png";
												Active = true;
												Selectable = false;
												ScrollBarThickness = 8;
												BorderColor3 = Color3.new(0,0,0);
												ElasticBehavior = Enum.ElasticBehavior.Always;
												VerticalScrollBarInset = Enum.ScrollBarInset.Always;
												Size = UDim2.new(1,0,1,0);
												TopImage = "rbxasset://textures/SurfacesDefault.png";
												ScrollingDirection = Enum.ScrollingDirection.Y;
												BackgroundTransparency = 1;
												BottomImage = "rbxasset://textures/SurfacesDefault.png";
												BorderSizePixel = 0;
												BackgroundColor3 = Color3.new(1,1,1);
											};
											Children = {
												{
													ID = 413;
													Type = "UIGridLayout";
													Properties = {
														SortOrder = Enum.SortOrder.LayoutOrder;
														CellSize = UDim2.new(0.25,-8,1,0);
														CellPadding = UDim2.new(0,8,0,8);
													};
													Children = {
														{
															ID = 414;
															Type = "UIAspectRatioConstraint";
															Properties = {};
															Children = {};
														};
													};
												};
											};
										};
										{
											ID = 415;
											Type = "UIPadding";
											Properties = {
												PaddingBottom = UDim.new(0,8);
												PaddingTop = UDim.new(0,8);
												PaddingRight = UDim.new(0,8);
												PaddingLeft = UDim.new(0,8);
											};
											Children = {};
										};
									};
								};
								{
									ID = 416;
									Type = "Frame";
									Properties = {
										LayoutOrder = 3;
										Name = "Settings";
										BackgroundColor3 = Color3.new(1,1,1);
										BackgroundTransparency = 1;
										Size = UDim2.new(1,0,1,0);
									};
									Children = {
										{
											ID = 417;
											Type = "ScrollingFrame";
											Properties = {
												BorderColor3 = Color3.new(0,0,0);
												MidImage = "rbxasset://textures/SurfacesDefault.png";
												ElasticBehavior = Enum.ElasticBehavior.Always;
												Active = true;
												Selectable = false;
												ScrollBarThickness = 8;
												BackgroundColor3 = Color3.new(1,1,1);
												BackgroundTransparency = 1;
												VerticalScrollBarInset = Enum.ScrollBarInset.Always;
												AutomaticCanvasSize = Enum.AutomaticSize.Y;
												TopImage = "rbxasset://textures/SurfacesDefault.png";
												ScrollingDirection = Enum.ScrollingDirection.Y;
												Size = UDim2.new(1,0,1,0);
												BottomImage = "rbxasset://textures/SurfacesDefault.png";
												BorderSizePixel = 0;
												CanvasSize = UDim2.new(0,0,1,0);
											};
											Children = {
												{
													ID = 418;
													Type = "UIListLayout";
													Properties = {
														SortOrder = Enum.SortOrder.LayoutOrder;
														Padding = UDim.new(0,8);
													};
													Children = {};
												};
												{
													ID = 419;
													Type = "Frame";
													Properties = {
														BackgroundColor3 = Color3.new(1,1,1);
														BackgroundTransparency = 1;
														Name = "Theme";
														Size = UDim2.new(1,0,0,36);
													};
													Children = {
														{
															ID = 420;
															Type = "UIPadding";
															Properties = {
																PaddingRight = UDim.new(0,8);
															};
															Children = {};
														};
														{
															ID = 421;
															Type = "TextButton";
															Properties = {
																TextColor3 = Color3.new(1,1,1);
																Text = "";
																TextSize = 14;
																AnchorPoint = Vector2.new(1,0);
																Font = Enum.Font.SourceSans;
																Name = "DropdownButton";
																Position = UDim2.new(1,0,0,0);
																Size = UDim2.new(0,156,0,36);
																ZIndex = 2;
																BorderSizePixel = 0;
																BackgroundColor3 = Color3.new(29/255,29/255,2/17);
															};
															Children = {
																{
																	ID = 422;
																	Type = "TextLabel";
																	Properties = {
																		TextColor3 = Color3.new(1,1,1);
																		Text = "Default";
																		ClipsDescendants = true;
																		Size = UDim2.new(1,-40,1,0);
																		AnchorPoint = Vector2.new(0,0.5);
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "Option";
																		Position = UDim2.new(0,8,0.5,0);
																		TextXAlignment = Enum.TextXAlignment.Left;
																		BackgroundTransparency = 1;
																		TextSize = 20;
																		BackgroundColor3 = Color3.new(1,1,1);
																	};
																	Children = {};
																};
																{
																	ID = 423;
																	Type = "ImageLabel";
																	Properties = {
																		AnchorPoint = Vector2.new(1,0.5);
																		Image = "rbxassetid://5143165549";
																		Name = "Arrow";
																		Position = UDim2.new(1,0,0.5,0);
																		BackgroundTransparency = 1;
																		Size = UDim2.new(0,36,1,0);
																		ScaleType = Enum.ScaleType.Fit;
																		BackgroundColor3 = Color3.new(1,1,1);
																	};
																	Children = {};
																};
																{
																	ID = 424;
																	Type = "Frame";
																	Properties = {
																		Name = "ListFrame";
																		Position = UDim2.new(0,0,1,0);
																		BackgroundColor3 = Color3.new(29/255,29/255,2/17);
																		BorderSizePixel = 0;
																		Size = UDim2.new(1,0,0,100);
																	};
																	Children = {
																		{
																			ID = 425;
																			Type = "ScrollingFrame";
																			Properties = {
																				Active = true;
																				AutomaticCanvasSize = Enum.AutomaticSize.Y;
																				ScrollingDirection = Enum.ScrollingDirection.Y;
																				BorderSizePixel = 0;
																				CanvasSize = UDim2.new(0,0,1,0);
																				MidImage = "rbxasset://textures/SurfacesDefault.png";
																				BorderColor3 = Color3.new(0,0,0);
																				ScrollBarThickness = 8;
																				ElasticBehavior = Enum.ElasticBehavior.Always;
																				VerticalScrollBarInset = Enum.ScrollBarInset.Always;
																				Name = "ScrollFrame";
																				TopImage = "rbxasset://textures/SurfacesDefault.png";
																				Selectable = false;
																				BackgroundTransparency = 1;
																				BottomImage = "rbxasset://textures/SurfacesDefault.png";
																				Size = UDim2.new(1,0,1,0);
																				BackgroundColor3 = Color3.new(1,1,1);
																			};
																			Children = {
																				{
																					ID = 426;
																					Type = "UIListLayout";
																					Properties = {
																						SortOrder = Enum.SortOrder.LayoutOrder;
																					};
																					Children = {};
																				};
																			};
																		};
																	};
																};
															};
														};
														{
															ID = 427;
															Type = "TextLabel";
															Properties = {
																Size = UDim2.new(0,200,0,36);
																Font = Enum.Font.SourceSansSemibold;
																BackgroundTransparency = 1;
																TextColor3 = Color3.new(1,1,1);
																TextXAlignment = Enum.TextXAlignment.Left;
																Text = "Theme";
																TextSize = 28;
																BackgroundColor3 = Color3.new(1,1,1);
															};
															Children = {};
														};
													};
												};
											};
										};
										{
											ID = 428;
											Type = "UIPadding";
											Properties = {
												PaddingBottom = UDim.new(0,8);
												PaddingTop = UDim.new(0,8);
												PaddingRight = UDim.new(0,8);
												PaddingLeft = UDim.new(0,8);
											};
											Children = {};
										};
									};
								};
							};
						};
						{
							ID = 429;
							Type = "UIListLayout";
							Properties = {
								SortOrder = Enum.SortOrder.LayoutOrder;
							};
							Children = {};
						};
					};
				};
				{
					ID = 430;
					Type = "Frame";
					Properties = {
						BackgroundColor3 = Color3.new(1,1,1);
						BackgroundTransparency = 1;
						Name = "Viewport";
						Size = UDim2.new(0.40000000596046,0,1,0);
					};
					Children = {
						{
							ID = 431;
							Type = "Frame";
							Properties = {
								LayoutOrder = 2;
								Name = "Footer";
								BackgroundColor3 = Color3.new(5/51,9/85,29/255);
								BackgroundTransparency = 1;
								BorderSizePixel = 0;
								Size = UDim2.new(1,0,0,52);
							};
							Children = {
								{
									ID = 432;
									Type = "TextButton";
									Properties = {
										TextWrapped = true;
										TextColor3 = Color3.new(1,1,1);
										BorderColor3 = Color3.new(0,0,0);
										Text = "";
										TextSize = 28;
										Size = UDim2.new(1,0,1,0);
										AnchorPoint = Vector2.new(1,0);
										Font = Enum.Font.SourceSansSemibold;
										Name = "Expand";
										Position = UDim2.new(1,0,0,0);
										SizeConstraint = Enum.SizeConstraint.RelativeYY;
										MaxVisibleGraphemes = 0;
										BorderSizePixel = 0;
										BackgroundColor3 = Color3.new(47/255,16/85,52/255);
									};
									Children = {
										{
											ID = 433;
											Type = "UICorner";
											Properties = {};
											Children = {};
										};
										{
											ID = 434;
											Type = "ImageLabel";
											Properties = {
												LayoutOrder = 1;
												ScaleType = Enum.ScaleType.Fit;
												Selectable = true;
												BackgroundTransparency = 1;
												ImageRectOffset = Vector2.new(179,407);
												Position = UDim2.new(0.5,0,0.5,0);
												AnchorPoint = Vector2.new(0.5,0.5);
												Image = "rbxasset://textures/AvatarEditorImages/Sheet.png";
												Name = "Icon";
												ImageRectSize = Vector2.new(72,72);
												BorderColor3 = Color3.new(0,0,0);
												Size = UDim2.new(0,24,0,24);
												BorderSizePixel = 0;
												BackgroundColor3 = Color3.new(1,1,1);
											};
											Children = {};
										};
									};
								};
								{
									ID = 435;
									Type = "UIPadding";
									Properties = {
										PaddingBottom = UDim.new(0,8);
										PaddingTop = UDim.new(0,8);
										PaddingRight = UDim.new(0,8);
										PaddingLeft = UDim.new(0,8);
									};
									Children = {};
								};
								{
									ID = 436;
									Type = "TextButton";
									Properties = {
										TextWrapped = true;
										TextColor3 = Color3.new(1,1,1);
										BorderColor3 = Color3.new(0,0,0);
										Text = "Save";
										TextSize = 28;
										Size = UDim2.new(2,0,1,0);
										AnchorPoint = Vector2.new(0.5,0);
										Font = Enum.Font.SourceSansSemibold;
										Name = "Save";
										Position = UDim2.new(0.5,0,0,0);
										SizeConstraint = Enum.SizeConstraint.RelativeYY;
										MaxVisibleGraphemes = 0;
										BorderSizePixel = 0;
										BackgroundColor3 = Color3.new(0,176/255,37/85);
									};
									Children = {
										{
											ID = 437;
											Type = "UICorner";
											Properties = {};
											Children = {};
										};
										{
											ID = 438;
											Type = "ImageLabel";
											Properties = {
												LayoutOrder = 1;
												ScaleType = Enum.ScaleType.Fit;
												Selectable = true;
												BackgroundTransparency = 1;
												AnchorPoint = Vector2.new(0.5,0.5);
												Image = "rbxassetid://4458874645";
												Name = "Icon";
												Position = UDim2.new(0.5,0,0.5,0);
												BorderColor3 = Color3.new(0,0,0);
												Size = UDim2.new(0,24,0,24);
												BorderSizePixel = 0;
												BackgroundColor3 = Color3.new(1,1,1);
											};
											Children = {};
										};
									};
								};
							};
						};
						{
							ID = 439;
							Type = "Frame";
							Properties = {
								Name = "Body";
								ClipsDescendants = true;
								BackgroundColor3 = Color3.new(1,1,1);
								BackgroundTransparency = 1;
								Size = UDim2.new(1,0,1,-52);
							};
							Children = {};
						};
						{
							ID = 440;
							Type = "UIListLayout";
							Properties = {
								SortOrder = Enum.SortOrder.LayoutOrder;
							};
							Children = {};
						};
						{
							ID = 441;
							Type = "UIPadding";
							Properties = {
								PaddingTop = UDim.new(0,40);
							};
							Children = {};
						};
					};
				};
				{
					ID = 442;
					Type = "UIListLayout";
					Properties = {
						SortOrder = Enum.SortOrder.LayoutOrder;
						FillDirection = Enum.FillDirection.Horizontal;
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