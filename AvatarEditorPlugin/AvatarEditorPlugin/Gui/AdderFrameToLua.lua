local partsWithId = {}
local awaitRef = {}

local root = {
	ID = 0;
	Type = "Frame";
	Properties = {
		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
		Position = UDim2.new(0.20731325447559,0,0.053191490471363,0);
		Name = "AdderFrame";
		Size = UDim2.new(0,250,0,676);
	};
	Children = {
		{
			ID = 1;
			Type = "UIListLayout";
			Properties = {
				SortOrder = Enum.SortOrder.LayoutOrder;
				Padding = UDim.new(0,5);
			};
			Children = {};
		};
		{
			ID = 2;
			Type = "UIPadding";
			Properties = {
				PaddingBottom = UDim.new(0,10);
				PaddingTop = UDim.new(0,10);
				PaddingRight = UDim.new(0,10);
				PaddingLeft = UDim.new(0,10);
			};
			Children = {};
		};
		{
			ID = 3;
			Type = "Frame";
			Properties = {
				Name = "Header";
				BackgroundColor3 = Color3.new(1,1,1);
				BackgroundTransparency = 1;
				AutomaticSize = Enum.AutomaticSize.Y;
				Size = UDim2.new(1,0,0,0);
			};
			Children = {
				{
					ID = 4;
					Type = "TextLabel";
					Properties = {
						Font = Enum.Font.SourceSansSemibold;
						BackgroundTransparency = 1;
						TextColor3 = Color3.new(4/5,4/5,4/5);
						Size = UDim2.new(1,0,0,36);
						Text = "Add Accessories";
						TextSize = 36;
						BackgroundColor3 = Color3.new(1,1,1);
					};
					Children = {};
				};
				{
					ID = 5;
					Type = "Frame";
					Properties = {
						LayoutOrder = 10;
						Name = "Line";
						BackgroundColor3 = Color3.new(1,1,1);
						BorderSizePixel = 0;
						Size = UDim2.new(1,0,0,1);
					};
					Children = {};
				};
				{
					ID = 6;
					Type = "UIListLayout";
					Properties = {
						SortOrder = Enum.SortOrder.LayoutOrder;
					};
					Children = {};
				};
			};
		};
		{
			ID = 7;
			Type = "Frame";
			Properties = {
				LayoutOrder = 2;
				Name = "Body";
				ClipsDescendants = true;
				BackgroundColor3 = Color3.new(1,1,1);
				BackgroundTransparency = 1;
				Size = UDim2.new(1,0,0,614);
			};
			Children = {
				{
					ID = 8;
					Type = "Frame";
					Properties = {
						BackgroundColor3 = Color3.new(1,1,1);
						BackgroundTransparency = 1;
						Name = "Main";
						Size = UDim2.new(1,0,0,612);
					};
					Children = {
						{
							ID = 9;
							Type = "Frame";
							Properties = {
								BackgroundColor3 = Color3.new(1,1,1);
								ZIndex = 2;
								BackgroundTransparency = 1;
								Size = UDim2.new(1,0,0,332);
							};
							Children = {
								{
									ID = 10;
									Type = "UIListLayout";
									Properties = {
										SortOrder = Enum.SortOrder.LayoutOrder;
										Padding = UDim.new(0,5);
									};
									Children = {};
								};
								{
									ID = 11;
									Type = "Frame";
									Properties = {
										LayoutOrder = 1;
										Name = "ModelFrame";
										BackgroundColor3 = Color3.new(1,1,1);
										BackgroundTransparency = 1;
										Size = UDim2.new(1,0,0,190);
									};
									Children = {
										{
											ID = 12;
											Type = "TextLabel";
											Properties = {
												LayoutOrder = 1;
												TextWrapped = true;
												TextColor3 = Color3.new(2/3,2/3,2/3);
												Text = "Add a custom user uploaded accessory. The asset must be created or owned by the game creator!";
												TextSize = 18;
												Font = Enum.Font.SourceSans;
												BackgroundTransparency = 1;
												TextXAlignment = Enum.TextXAlignment.Left;
												Size = UDim2.new(1,0,0,0);
												TextYAlignment = Enum.TextYAlignment.Top;
												AutomaticSize = Enum.AutomaticSize.Y;
												BackgroundColor3 = Color3.new(1,1,1);
											};
											Children = {};
										};
										{
											ID = 13;
											Type = "UIListLayout";
											Properties = {
												Padding = UDim.new(0,5);
												HorizontalAlignment = Enum.HorizontalAlignment.Center;
												SortOrder = Enum.SortOrder.LayoutOrder;
											};
											Children = {};
										};
										{
											ID = 14;
											Type = "Frame";
											Properties = {
												BackgroundColor3 = Color3.new(1,1,1);
												BackgroundTransparency = 1;
												Name = "TextFrame";
												Size = UDim2.new(1,0,0,20);
											};
											Children = {
												{
													ID = 15;
													Type = "TextLabel";
													Properties = {
														LayoutOrder = 1;
														TextColor3 = Color3.new(4/5,4/5,4/5);
														Text = "Custom Accessories";
														Font = Enum.Font.SourceSansSemibold;
														BackgroundTransparency = 1;
														TextTruncate = Enum.TextTruncate.AtEnd;
														Size = UDim2.new(1,0,1,0);
														TextXAlignment = Enum.TextXAlignment.Left;
														TextSize = 20;
														BackgroundColor3 = Color3.new(1,1,1);
													};
													Children = {};
												};
											};
										};
										{
											ID = 16;
											Type = "TextButton";
											Properties = {
												LayoutOrder = 3;
												TextColor3 = Color3.new(1,1,1);
												Text = "";
												TextSize = 14;
												AnchorPoint = Vector2.new(1,0);
												Font = Enum.Font.SourceSans;
												Name = "DropdownButton";
												Position = UDim2.new(1,0,0,0);
												Size = UDim2.new(1,-2,0,30);
												ZIndex = 2;
												BorderSizePixel = 0;
												BackgroundColor3 = Color3.new(46/255,46/255,46/255);
											};
											Children = {
												{
													ID = 17;
													Type = "TextLabel";
													Properties = {
														TextColor3 = Color3.new(4/5,4/5,4/5);
														Text = "Hat";
														ClipsDescendants = true;
														Font = Enum.Font.SourceSansSemibold;
														BackgroundTransparency = 1;
														TextXAlignment = Enum.TextXAlignment.Left;
														Size = UDim2.new(1,-40,1,0);
														Name = "Option";
														TextSize = 20;
														BackgroundColor3 = Color3.new(1,1,1);
													};
													Children = {
														{
															ID = 18;
															Type = "UIPadding";
															Properties = {
																PaddingLeft = UDim.new(0,10);
															};
															Children = {};
														};
													};
												};
												{
													ID = 19;
													Type = "ImageLabel";
													Properties = {
														ImageColor3 = Color3.new(4/5,4/5,4/5);
														ScaleType = Enum.ScaleType.Fit;
														AnchorPoint = Vector2.new(1,0.5);
														Image = "rbxassetid://5143165549";
														BackgroundTransparency = 1;
														Position = UDim2.new(1,0,0.5,0);
														Name = "Arrow";
														Size = UDim2.new(0,36,1,0);
														BackgroundColor3 = Color3.new(1,1,1);
													};
													Children = {};
												};
												{
													ID = 20;
													Type = "Frame";
													Properties = {
														Visible = false;
														Name = "ListFrame";
														Position = UDim2.new(0,0,1,0);
														BackgroundColor3 = Color3.new(46/255,46/255,46/255);
														BorderSizePixel = 0;
														Size = UDim2.new(1,0,0,200);
													};
													Children = {
														{
															ID = 21;
															Type = "ScrollingFrame";
															Properties = {
																Active = true;
																AutomaticCanvasSize = Enum.AutomaticSize.Y;
																ScrollingDirection = Enum.ScrollingDirection.Y;
																BorderSizePixel = 0;
																CanvasSize = UDim2.new(0,0,0,1);
																ScrollBarImageColor3 = Color3.new(56/255,56/255,56/255);
																MidImage = "rbxasset://textures/SurfacesDefault.png";
																BorderColor3 = Color3.new(0,0,0);
																ScrollBarThickness = 10;
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
																	ID = 22;
																	Type = "UIListLayout";
																	Properties = {
																		SortOrder = Enum.SortOrder.LayoutOrder;
																	};
																	Children = {};
																};
																{
																	ID = 23;
																	Type = "TextButton";
																	Properties = {
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Hat";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "Hat";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 24;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 25;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 26;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 1;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Hair Accessory";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "HairAccessory";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 27;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 28;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 29;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 2;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Face Accessory";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "FaceAccessory";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 30;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 31;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 32;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 3;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Neck Accessory";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "NeckAccessory";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 33;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 34;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 35;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 4;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Shoulder Accessory";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "ShoulderAccessory";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 36;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 37;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 38;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 5;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Front Accessory";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "FrontAccessory";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 39;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 40;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 41;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 6;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Back Accessory";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "BackAccessory";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 42;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 43;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 44;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 7;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Waist Accessory";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "WaistAccessory";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 45;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 46;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 47;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 8;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Shirt";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "Shirt";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 48;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 49;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 50;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 9;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Pants";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "Pants";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 51;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 52;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 53;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 10;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Head";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "Head";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 54;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 55;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 56;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 11;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Face";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "Face";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 57;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 58;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 59;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 12;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Torso";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "Torso";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 60;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 61;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 62;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 13;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Right Arm";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "RightArm";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 63;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 64;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 65;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 14;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Left Arm";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "LeftArm";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 66;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 67;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 68;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 15;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Left Leg";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "LeftLeg";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 69;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 70;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 71;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 16;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Right Leg";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "RightLeg";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 72;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 73;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 74;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 17;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Climb Animation";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "ClimbAnimation";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 75;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 76;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 77;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 18;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Death Animation";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "DeathAnimation";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 78;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 79;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 80;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 19;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Fall Animation";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "FallAnimation";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 81;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 82;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 83;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 20;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Idle Animation";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "IdleAnimation";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 84;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 85;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 86;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 21;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Jump Animation";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "JumpAnimation";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 87;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 88;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 89;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 22;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Run Animation";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "RunAnimation";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 90;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 91;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 92;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 23;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Swim Animation";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "SwimAnimation";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 93;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 94;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 95;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 24;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Walk Animation";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "WalkAnimation";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 96;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 97;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 98;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 25;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Pose Animation";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "PoseAnimation";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 99;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 100;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
																{
																	ID = 101;
																	Type = "TextButton";
																	Properties = {
																		LayoutOrder = 26;
																		TextColor3 = Color3.new(4/5,4/5,4/5);
																		Text = "Emote Animation";
																		Font = Enum.Font.SourceSansSemibold;
																		Name = "EmoteAnimation";
																		TextXAlignment = Enum.TextXAlignment.Left;
																		TextSize = 20;
																		Size = UDim2.new(1,0,0,30);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
																	};
																	Children = {
																		{
																			ID = 102;
																			Type = "UIPadding";
																			Properties = {
																				PaddingLeft = UDim.new(0,10);
																			};
																			Children = {};
																		};
																		{
																			ID = 103;
																			Type = "UICorner";
																			Properties = {
																				CornerRadius = UDim.new(0,4);
																			};
																			Children = {};
																		};
																	};
																};
															};
														};
														{
															ID = 104;
															Type = "UICorner";
															Properties = {
																CornerRadius = UDim.new(0,4);
															};
															Children = {};
														};
														{
															ID = 105;
															Type = "UIStroke";
															Properties = {
																Color = Color3.new(26/255,26/255,26/255);
																ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
															};
															Children = {};
														};
													};
												};
												{
													ID = 106;
													Type = "UICorner";
													Properties = {
														CornerRadius = UDim.new(0,4);
													};
													Children = {};
												};
												{
													ID = 107;
													Type = "UIStroke";
													Properties = {
														Color = Color3.new(26/255,26/255,26/255);
														ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
													};
													Children = {};
												};
											};
										};
										{
											ID = 108;
											Type = "Frame";
											Properties = {
												LayoutOrder = 10;
												Name = "Line";
												BackgroundColor3 = Color3.new(1,1,1);
												BorderSizePixel = 0;
												Size = UDim2.new(1,0,0,1);
											};
											Children = {};
										};
										{
											ID = 109;
											Type = "TextBox";
											Properties = {
												LayoutOrder = 2;
												TextColor3 = Color3.new(4/5,4/5,4/5);
												Text = "";
												Font = Enum.Font.SourceSansSemibold;
												PlaceholderColor3 = Color3.new(2/3,2/3,2/3);
												TextXAlignment = Enum.TextXAlignment.Left;
												Size = UDim2.new(1,-2,0,30);
												PlaceholderText = "asset id";
												TextSize = 20;
												BackgroundColor3 = Color3.new(37/255,37/255,37/255);
											};
											Children = {
												{
													ID = 110;
													Type = "UICorner";
													Properties = {
														CornerRadius = UDim.new(0,4);
													};
													Children = {};
												};
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
													Type = "UIStroke";
													Properties = {
														Color = Color3.new(26/255,26/255,26/255);
														ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
													};
													Children = {};
												};
											};
										};
										{
											ID = 113;
											Type = "TextButton";
											Properties = {
												LayoutOrder = 3;
												TextColor3 = Color3.new(4/5,4/5,4/5);
												Text = "Add";
												AnchorPoint = Vector2.new(0.5,0.5);
												Font = Enum.Font.SourceSansSemibold;
												Position = UDim2.new(0.5,0,0.5,0);
												TextSize = 20;
												AutomaticSize = Enum.AutomaticSize.XY;
												BackgroundColor3 = Color3.new(1,1/3,127/255);
											};
											Children = {
												{
													ID = 114;
													Type = "UICorner";
													Properties = {
														CornerRadius = UDim.new(0,4);
													};
													Children = {};
												};
												{
													ID = 115;
													Type = "UIPadding";
													Properties = {
														PaddingBottom = UDim.new(0,5);
														PaddingTop = UDim.new(0,5);
														PaddingRight = UDim.new(0,10);
														PaddingLeft = UDim.new(0,10);
													};
													Children = {};
												};
												{
													ID = 116;
													Type = "UIStroke";
													Properties = {
														Color = Color3.new(53/255,53/255,53/255);
														ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
													};
													Children = {};
												};
											};
										};
									};
								};
								{
									ID = 117;
									Type = "Frame";
									Properties = {
										BackgroundColor3 = Color3.new(1,1,1);
										BackgroundTransparency = 1;
										Name = "CatalogFrame";
										Size = UDim2.new(1,0,0,137);
									};
									Children = {
										{
											ID = 118;
											Type = "TextLabel";
											Properties = {
												LayoutOrder = 1;
												TextWrapped = true;
												TextColor3 = Color3.new(2/3,2/3,2/3);
												Text = "Add an accessory from the Roblox Catalog. UGC accessories included.";
												TextSize = 18;
												Font = Enum.Font.SourceSans;
												BackgroundTransparency = 1;
												TextXAlignment = Enum.TextXAlignment.Left;
												Size = UDim2.new(1,0,0,0);
												TextYAlignment = Enum.TextYAlignment.Top;
												AutomaticSize = Enum.AutomaticSize.Y;
												BackgroundColor3 = Color3.new(1,1,1);
											};
											Children = {};
										};
										{
											ID = 119;
											Type = "UIListLayout";
											Properties = {
												Padding = UDim.new(0,5);
												HorizontalAlignment = Enum.HorizontalAlignment.Center;
												SortOrder = Enum.SortOrder.LayoutOrder;
											};
											Children = {};
										};
										{
											ID = 120;
											Type = "Frame";
											Properties = {
												BackgroundColor3 = Color3.new(1,1,1);
												BackgroundTransparency = 1;
												Name = "TextFrame";
												Size = UDim2.new(1,0,0,20);
											};
											Children = {
												{
													ID = 121;
													Type = "TextLabel";
													Properties = {
														LayoutOrder = 1;
														TextColor3 = Color3.new(4/5,4/5,4/5);
														Text = "Catalog Accessories";
														Font = Enum.Font.SourceSansSemibold;
														BackgroundTransparency = 1;
														TextTruncate = Enum.TextTruncate.AtEnd;
														Size = UDim2.new(1,0,1,0);
														TextXAlignment = Enum.TextXAlignment.Left;
														TextSize = 20;
														BackgroundColor3 = Color3.new(1,1,1);
													};
													Children = {};
												};
											};
										};
										{
											ID = 122;
											Type = "TextBox";
											Properties = {
												LayoutOrder = 2;
												TextColor3 = Color3.new(4/5,4/5,4/5);
												Text = "";
												Font = Enum.Font.SourceSansSemibold;
												PlaceholderColor3 = Color3.new(2/3,2/3,2/3);
												TextXAlignment = Enum.TextXAlignment.Left;
												Size = UDim2.new(1,-2,0,30);
												PlaceholderText = "asset id";
												TextSize = 20;
												BackgroundColor3 = Color3.new(37/255,37/255,37/255);
											};
											Children = {
												{
													ID = 123;
													Type = "UICorner";
													Properties = {
														CornerRadius = UDim.new(0,4);
													};
													Children = {};
												};
												{
													ID = 124;
													Type = "UIPadding";
													Properties = {
														PaddingRight = UDim.new(0,10);
														PaddingLeft = UDim.new(0,10);
													};
													Children = {};
												};
												{
													ID = 125;
													Type = "UIStroke";
													Properties = {
														Color = Color3.new(26/255,26/255,26/255);
														ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
													};
													Children = {};
												};
											};
										};
										{
											ID = 126;
											Type = "Frame";
											Properties = {
												LayoutOrder = 10;
												Name = "Line";
												BackgroundColor3 = Color3.new(1,1,1);
												BorderSizePixel = 0;
												Size = UDim2.new(1,0,0,1);
											};
											Children = {};
										};
										{
											ID = 127;
											Type = "Frame";
											Properties = {
												LayoutOrder = 3;
												Name = "Buttons";
												BackgroundColor3 = Color3.new(1,1,1);
												BackgroundTransparency = 1;
												Size = UDim2.new(1,0,0,30);
											};
											Children = {
												{
													ID = 128;
													Type = "TextButton";
													Properties = {
														TextColor3 = Color3.new(4/5,4/5,4/5);
														Text = "Add";
														AnchorPoint = Vector2.new(0.5,0.5);
														Font = Enum.Font.SourceSansSemibold;
														Name = "Button1";
														Position = UDim2.new(0.5,0,0.5,0);
														TextSize = 20;
														AutomaticSize = Enum.AutomaticSize.XY;
														BackgroundColor3 = Color3.new(1,1/3,127/255);
													};
													Children = {
														{
															ID = 129;
															Type = "UICorner";
															Properties = {
																CornerRadius = UDim.new(0,4);
															};
															Children = {};
														};
														{
															ID = 130;
															Type = "UIPadding";
															Properties = {
																PaddingBottom = UDim.new(0,5);
																PaddingTop = UDim.new(0,5);
																PaddingRight = UDim.new(0,10);
																PaddingLeft = UDim.new(0,10);
															};
															Children = {};
														};
														{
															ID = 131;
															Type = "UIStroke";
															Properties = {
																Color = Color3.new(53/255,53/255,53/255);
																ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
															};
															Children = {};
														};
													};
												};
												{
													ID = 132;
													Type = "UIListLayout";
													Properties = {
														SortOrder = Enum.SortOrder.LayoutOrder;
														FillDirection = Enum.FillDirection.Horizontal;
														HorizontalAlignment = Enum.HorizontalAlignment.Center;
														Padding = UDim.new(0,5);
													};
													Children = {};
												};
												{
													ID = 133;
													Type = "TextButton";
													Properties = {
														LayoutOrder = 1;
														TextColor3 = Color3.new(4/5,4/5,4/5);
														Text = "Remove";
														AnchorPoint = Vector2.new(0.5,0.5);
														Font = Enum.Font.SourceSansSemibold;
														Name = "Button2";
														Position = UDim2.new(0.5,0,0.5,0);
														TextSize = 20;
														AutomaticSize = Enum.AutomaticSize.XY;
														BackgroundColor3 = Color3.new(1,0,0);
													};
													Children = {
														{
															ID = 134;
															Type = "UICorner";
															Properties = {
																CornerRadius = UDim.new(0,4);
															};
															Children = {};
														};
														{
															ID = 135;
															Type = "UIPadding";
															Properties = {
																PaddingBottom = UDim.new(0,5);
																PaddingTop = UDim.new(0,5);
																PaddingRight = UDim.new(0,10);
																PaddingLeft = UDim.new(0,10);
															};
															Children = {};
														};
														{
															ID = 136;
															Type = "UIStroke";
															Properties = {
																Color = Color3.new(53/255,53/255,53/255);
																ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
															};
															Children = {};
														};
													};
												};
											};
										};
									};
								};
							};
						};
						{
							ID = 137;
							Type = "ScrollingFrame";
							Properties = {
								LayoutOrder = 2;
								MidImage = "rbxasset://textures/SurfacesDefault.png";
								Active = true;
								AutomaticCanvasSize = Enum.AutomaticSize.Y;
								ScrollBarThickness = 10;
								VerticalScrollBarInset = Enum.ScrollBarInset.Always;
								TopImage = "rbxasset://textures/SurfacesDefault.png";
								BackgroundColor3 = Color3.new(37/255,37/255,37/255);
								Size = UDim2.new(1,-2,0,200);
								BottomImage = "rbxasset://textures/SurfacesDefault.png";
								BorderSizePixel = 0;
								CanvasSize = UDim2.new(0,0,0,1);
							};
							Children = {
								{
									ID = 138;
									Type = "UIListLayout";
									Properties = {
										SortOrder = Enum.SortOrder.LayoutOrder;
									};
									Children = {};
								};
								{
									ID = 139;
									Type = "UIStroke";
									Properties = {
										ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
									};
									Children = {};
								};
							};
						};
						{
							ID = 140;
							Type = "Frame";
							Properties = {
								LayoutOrder = 1;
								Name = "TextFrame";
								BackgroundColor3 = Color3.new(1,1,1);
								BackgroundTransparency = 1;
								Size = UDim2.new(1,0,0,20);
							};
							Children = {
								{
									ID = 141;
									Type = "TextLabel";
									Properties = {
										LayoutOrder = 1;
										TextColor3 = Color3.new(4/5,4/5,4/5);
										Text = "Accessories to be updated:";
										Font = Enum.Font.SourceSansSemibold;
										BackgroundTransparency = 1;
										TextTruncate = Enum.TextTruncate.AtEnd;
										Size = UDim2.new(1,0,1,0);
										TextXAlignment = Enum.TextXAlignment.Left;
										TextSize = 20;
										BackgroundColor3 = Color3.new(1,1,1);
									};
									Children = {};
								};
							};
						};
						{
							ID = 142;
							Type = "TextButton";
							Properties = {
								LayoutOrder = 3;
								TextColor3 = Color3.new(4/5,4/5,4/5);
								Text = "Update database";
								AnchorPoint = Vector2.new(0.5,0.5);
								Font = Enum.Font.SourceSansSemibold;
								Position = UDim2.new(0.5,0,0.5,0);
								TextSize = 20;
								AutomaticSize = Enum.AutomaticSize.XY;
								BackgroundColor3 = Color3.new(1,1/3,127/255);
							};
							Children = {
								{
									ID = 143;
									Type = "UICorner";
									Properties = {
										CornerRadius = UDim.new(0,4);
									};
									Children = {};
								};
								{
									ID = 144;
									Type = "UIPadding";
									Properties = {
										PaddingBottom = UDim.new(0,5);
										PaddingTop = UDim.new(0,5);
										PaddingRight = UDim.new(0,10);
										PaddingLeft = UDim.new(0,10);
									};
									Children = {};
								};
								{
									ID = 145;
									Type = "UIStroke";
									Properties = {
										Color = Color3.new(53/255,53/255,53/255);
										ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
									};
									Children = {};
								};
							};
						};
						{
							ID = 146;
							Type = "UIListLayout";
							Properties = {
								Padding = UDim.new(0,10);
								HorizontalAlignment = Enum.HorizontalAlignment.Center;
								SortOrder = Enum.SortOrder.LayoutOrder;
							};
							Children = {};
						};
					};
				};
				{
					ID = 147;
					Type = "UIPageLayout";
					Properties = {
						Animated = false;
						Circular = true;
						GamepadInputEnabled = false;
						TouchInputEnabled = false;
						SortOrder = Enum.SortOrder.LayoutOrder;
					};
					Children = {};
				};
				{
					ID = 148;
					Type = "Frame";
					Properties = {
						LayoutOrder = 3;
						Name = "Fail";
						BackgroundColor3 = Color3.new(1,1,1);
						BackgroundTransparency = 1;
						AutomaticSize = Enum.AutomaticSize.Y;
						Size = UDim2.new(1,0,0,0);
					};
					Children = {
						{
							ID = 149;
							Type = "UIListLayout";
							Properties = {
								Padding = UDim.new(0,5);
								HorizontalAlignment = Enum.HorizontalAlignment.Center;
								SortOrder = Enum.SortOrder.LayoutOrder;
							};
							Children = {};
						};
						{
							ID = 150;
							Type = "TextButton";
							Properties = {
								LayoutOrder = 1;
								TextColor3 = Color3.new(4/5,4/5,4/5);
								Text = "Retry";
								AnchorPoint = Vector2.new(0.5,0.5);
								Font = Enum.Font.SourceSansSemibold;
								Position = UDim2.new(0.5,0,0.5,0);
								TextSize = 20;
								AutomaticSize = Enum.AutomaticSize.XY;
								BackgroundColor3 = Color3.new(1,1/3,127/255);
							};
							Children = {
								{
									ID = 151;
									Type = "UICorner";
									Properties = {
										CornerRadius = UDim.new(0,4);
									};
									Children = {};
								};
								{
									ID = 152;
									Type = "UIPadding";
									Properties = {
										PaddingBottom = UDim.new(0,5);
										PaddingTop = UDim.new(0,5);
										PaddingRight = UDim.new(0,10);
										PaddingLeft = UDim.new(0,10);
									};
									Children = {};
								};
								{
									ID = 153;
									Type = "UIStroke";
									Properties = {
										Color = Color3.new(53/255,53/255,53/255);
										ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
									};
									Children = {};
								};
							};
						};
						{
							ID = 154;
							Type = "TextLabel";
							Properties = {
								TextWrapped = true;
								TextColor3 = Color3.new(1,4/15,4/15);
								Text = "error message";
								Font = Enum.Font.SourceSans;
								BackgroundTransparency = 1;
								TextSize = 18;
								Size = UDim2.new(1,0,0,0);
								TextYAlignment = Enum.TextYAlignment.Top;
								AutomaticSize = Enum.AutomaticSize.Y;
								BackgroundColor3 = Color3.new(1,1,1);
							};
							Children = {};
						};
					};
				};
				{
					ID = 155;
					Type = "Frame";
					Properties = {
						LayoutOrder = 2;
						Name = "Success";
						BackgroundColor3 = Color3.new(1,1,1);
						BackgroundTransparency = 1;
						AutomaticSize = Enum.AutomaticSize.Y;
						Size = UDim2.new(1,0,0,0);
					};
					Children = {
						{
							ID = 156;
							Type = "UIListLayout";
							Properties = {
								Padding = UDim.new(0,5);
								HorizontalAlignment = Enum.HorizontalAlignment.Center;
								SortOrder = Enum.SortOrder.LayoutOrder;
							};
							Children = {};
						};
						{
							ID = 157;
							Type = "Frame";
							Properties = {
								BackgroundColor3 = Color3.new(1,1,1);
								BackgroundTransparency = 1;
								Name = "TextFrame";
								Size = UDim2.new(1,0,0,20);
							};
							Children = {
								{
									ID = 158;
									Type = "TextLabel";
									Properties = {
										LayoutOrder = 1;
										TextColor3 = Color3.new(4/5,4/5,4/5);
										Text = "Update complete.";
										Font = Enum.Font.SourceSansSemibold;
										BackgroundTransparency = 1;
										TextTruncate = Enum.TextTruncate.AtEnd;
										Size = UDim2.new(1,0,1,0);
										TextSize = 20;
										BackgroundColor3 = Color3.new(1,1,1);
									};
									Children = {};
								};
							};
						};
						{
							ID = 159;
							Type = "TextButton";
							Properties = {
								LayoutOrder = 3;
								TextColor3 = Color3.new(4/5,4/5,4/5);
								Text = "Done";
								AnchorPoint = Vector2.new(0.5,0.5);
								Font = Enum.Font.SourceSansSemibold;
								Position = UDim2.new(0.5,0,0.5,0);
								TextSize = 20;
								AutomaticSize = Enum.AutomaticSize.XY;
								BackgroundColor3 = Color3.new(1,1/3,127/255);
							};
							Children = {
								{
									ID = 160;
									Type = "UIPadding";
									Properties = {
										PaddingBottom = UDim.new(0,5);
										PaddingTop = UDim.new(0,5);
										PaddingRight = UDim.new(0,10);
										PaddingLeft = UDim.new(0,10);
									};
									Children = {};
								};
								{
									ID = 161;
									Type = "UICorner";
									Properties = {
										CornerRadius = UDim.new(0,4);
									};
									Children = {};
								};
								{
									ID = 162;
									Type = "UIStroke";
									Properties = {
										Color = Color3.new(53/255,53/255,53/255);
										ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
									};
									Children = {};
								};
							};
						};
						{
							ID = 163;
							Type = "ScrollingFrame";
							Properties = {
								LayoutOrder = 1;
								MidImage = "rbxasset://textures/SurfacesDefault.png";
								Active = true;
								AutomaticCanvasSize = Enum.AutomaticSize.Y;
								ScrollBarThickness = 10;
								VerticalScrollBarInset = Enum.ScrollBarInset.Always;
								TopImage = "rbxasset://textures/SurfacesDefault.png";
								BackgroundColor3 = Color3.new(37/255,37/255,37/255);
								Size = UDim2.new(1,-2,0,200);
								BottomImage = "rbxasset://textures/SurfacesDefault.png";
								BorderSizePixel = 0;
								CanvasSize = UDim2.new(0,0,0,1);
							};
							Children = {
								{
									ID = 164;
									Type = "UIListLayout";
									Properties = {
										SortOrder = Enum.SortOrder.LayoutOrder;
									};
									Children = {};
								};
								{
									ID = 165;
									Type = "UIStroke";
									Properties = {
										ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
									};
									Children = {};
								};
							};
						};
						{
							ID = 166;
							Type = "TextLabel";
							Properties = {
								LayoutOrder = 2;
								TextColor3 = Color3.new(2/3,2/3,2/3);
								Text = "100 Success | 100 Failed";
								Font = Enum.Font.SourceSans;
								BackgroundTransparency = 1;
								TextSize = 18;
								Size = UDim2.new(1,0,0,0);
								TextYAlignment = Enum.TextYAlignment.Top;
								AutomaticSize = Enum.AutomaticSize.Y;
								BackgroundColor3 = Color3.new(1,1,1);
							};
							Children = {};
						};
					};
				};
				{
					ID = 167;
					Type = "Frame";
					Properties = {
						LayoutOrder = 1;
						Name = "Progress";
						BackgroundColor3 = Color3.new(1,1,1);
						BackgroundTransparency = 1;
						AutomaticSize = Enum.AutomaticSize.Y;
						Size = UDim2.new(1,0,0,0);
					};
					Children = {
						{
							ID = 168;
							Type = "UIListLayout";
							Properties = {
								Padding = UDim.new(0,5);
								HorizontalAlignment = Enum.HorizontalAlignment.Center;
								SortOrder = Enum.SortOrder.LayoutOrder;
							};
							Children = {};
						};
						{
							ID = 169;
							Type = "Frame";
							Properties = {
								LayoutOrder = 1;
								Name = "Bar";
								Position = UDim2.new(0.5,0,0.5,0);
								BackgroundColor3 = Color3.new(53/255,53/255,53/255);
								AnchorPoint = Vector2.new(0.5,0.5);
								BorderSizePixel = 0;
								Size = UDim2.new(1,0,0,30);
							};
							Children = {
								{
									ID = 170;
									Type = "Frame";
									Properties = {
										BackgroundColor3 = Color3.new(1,1/3,127/255);
										BorderSizePixel = 0;
										Name = "Fill";
										Size = UDim2.new(0,100,1,0);
									};
									Children = {};
								};
							};
						};
						{
							ID = 171;
							Type = "Frame";
							Properties = {
								BackgroundColor3 = Color3.new(1,1,1);
								BackgroundTransparency = 1;
								Name = "TextFrame";
								Size = UDim2.new(1,0,0,20);
							};
							Children = {
								{
									ID = 172;
									Type = "TextLabel";
									Properties = {
										LayoutOrder = 1;
										TextColor3 = Color3.new(4/5,4/5,4/5);
										Text = "Downloading...";
										Font = Enum.Font.SourceSansSemibold;
										BackgroundTransparency = 1;
										TextTruncate = Enum.TextTruncate.AtEnd;
										Size = UDim2.new(1,0,1,0);
										TextSize = 20;
										BackgroundColor3 = Color3.new(1,1,1);
									};
									Children = {};
								};
							};
						};
						{
							ID = 173;
							Type = "TextLabel";
							Properties = {
								LayoutOrder = 2;
								TextColor3 = Color3.new(2/3,2/3,2/3);
								Text = "0%";
								Font = Enum.Font.SourceSans;
								BackgroundTransparency = 1;
								TextSize = 18;
								Size = UDim2.new(1,0,0,0);
								TextYAlignment = Enum.TextYAlignment.Top;
								AutomaticSize = Enum.AutomaticSize.Y;
								BackgroundColor3 = Color3.new(1,1,1);
							};
							Children = {};
						};
					};
				};
				{
					ID = 174;
					Type = "UIPadding";
					Properties = {
						PaddingBottom = UDim.new(0,1);
						PaddingTop = UDim.new(0,1);
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