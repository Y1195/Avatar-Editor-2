local partsWithId = {}
local awaitRef = {}

local root = {
	ID = 0;
	Type = "Frame";
	Properties = {
		Name = "InstallerFrame";
		Position = UDim2.new(0.033495035022497,0,0.053191486746073,0);
		BackgroundColor3 = Color3.new(46/255,46/255,46/255);
		AutomaticSize = Enum.AutomaticSize.Y;
		Size = UDim2.new(0,250,0,243);
	};
	Children = {
		{
			ID = 1;
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
					ID = 2;
					Type = "TextLabel";
					Properties = {
						Size = UDim2.new(1,0,0,36);
						BackgroundTransparency = 1;
						TextColor3 = Color3.new(4/5,4/5,4/5);
						Font = Enum.Font.SourceSansSemibold;
						Text = "Avatar Editor";
						TextSize = 36;
						BackgroundColor3 = Color3.new(1,1,1);
					};
					Children = {};
				};
				{
					ID = 3;
					Type = "Frame";
					Properties = {
						LayoutOrder = 10;
						Name = "Line";
						BackgroundColor3 = Color3.new(229/255,229/255,229/255);
						BorderSizePixel = 0;
						Size = UDim2.new(1,0,0,1);
					};
					Children = {};
				};
				{
					ID = 4;
					Type = "UIListLayout";
					Properties = {
						SortOrder = Enum.SortOrder.LayoutOrder;
					};
					Children = {};
				};
			};
		};
		{
			ID = 5;
			Type = "Frame";
			Properties = {
				LayoutOrder = 2;
				Name = "Body";
				ClipsDescendants = true;
				BackgroundColor3 = Color3.new(1,1,1);
				BackgroundTransparency = 1;
				AutomaticSize = Enum.AutomaticSize.Y;
				Size = UDim2.new(1,0,0,0);
			};
			Children = {
				{
					ID = 6;
					Type = "Frame";
					Properties = {
						Name = "Main";
						BackgroundColor3 = Color3.new(1,1,1);
						BackgroundTransparency = 1;
						AutomaticSize = Enum.AutomaticSize.Y;
						Size = UDim2.new(1,0,0,0);
					};
					Children = {
						{
							ID = 7;
							Type = "Frame";
							Properties = {
								BackgroundColor3 = Color3.new(1,1,1);
								BackgroundTransparency = 1;
								AutomaticSize = Enum.AutomaticSize.Y;
								Size = UDim2.new(1,0,0,0);
							};
							Children = {
								{
									ID = 8;
									Type = "Frame";
									Properties = {
										Name = "SettingsFrame";
										BackgroundColor3 = Color3.new(1,1,1);
										BackgroundTransparency = 1;
										AutomaticSize = Enum.AutomaticSize.Y;
										Size = UDim2.new(1,0,0,0);
									};
									Children = {
										{
											ID = 9;
											Type = "TextLabel";
											Properties = {
												LayoutOrder = 1;
												TextWrapped = true;
												TextColor3 = Color3.new(2/3,2/3,2/3);
												Text = "Overwites your current settings with default settings.";
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
												BackgroundColor3 = Color3.new(1,1,1);
												BackgroundTransparency = 1;
												Size = UDim2.new(1,0,0,20);
											};
											Children = {
												{
													ID = 12;
													Type = "TextLabel";
													Properties = {
														LayoutOrder = 1;
														TextColor3 = Color3.new(4/5,4/5,4/5);
														Text = "Overwrite Settings";
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
												{
													ID = 13;
													Type = "Frame";
													Properties = {
														AnchorPoint = Vector2.new(1,0);
														Name = "CheckContainer";
														Position = UDim2.new(1,-1,0,0);
														SizeConstraint = Enum.SizeConstraint.RelativeYY;
														BackgroundColor3 = Color3.new(1,1,1);
														BackgroundTransparency = 1;
														Size = UDim2.new(1,0,1,0);
													};
													Children = {
														{
															ID = 14;
															Type = "TextButton";
															Properties = {
																TextColor3 = Color3.new(0,0,0);
																BorderColor3 = Color3.new(1,1,1);
																Text = "";
																Selectable = false;
																AnchorPoint = Vector2.new(0.5,0.5);
																Font = Enum.Font.SourceSans;
																Name = "CheckButton";
																Position = UDim2.new(0.5,0,0.5,0);
																TextSize = 14;
																Size = UDim2.new(1,0,1,0);
																BorderSizePixel = 0;
																BackgroundColor3 = Color3.new(37/255,37/255,37/255);
															};
															Children = {
																{
																	ID = 15;
																	Type = "ImageLabel";
																	Properties = {
																		Visible = false;
																		ScaleType = Enum.ScaleType.Fit;
																		ImageColor3 = Color3.new(0,0,0);
																		AnchorPoint = Vector2.new(0.5,0.5);
																		Image = "rbxassetid://5422477875";
																		Name = "Checkmark";
																		Position = UDim2.new(0.5,0,0.5,0);
																		BackgroundTransparency = 1;
																		Size = UDim2.new(1.2999999523163,0,1.2999999523163,0);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(11/85,19/51,74/85);
																	};
																	Children = {};
																};
																{
																	ID = 16;
																	Type = "UICorner";
																	Properties = {
																		CornerRadius = UDim.new(0,2);
																	};
																	Children = {};
																};
																{
																	ID = 17;
																	Type = "UIStroke";
																	Properties = {
																		Color = Color3.new(26/255,26/255,26/255);
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
										{
											ID = 18;
											Type = "Frame";
											Properties = {
												LayoutOrder = 10;
												Name = "Line";
												BackgroundColor3 = Color3.new(229/255,229/255,229/255);
												BorderSizePixel = 0;
												Size = UDim2.new(1,0,0,1);
											};
											Children = {};
										};
									};
								};
								{
									ID = 19;
									Type = "UIListLayout";
									Properties = {
										SortOrder = Enum.SortOrder.LayoutOrder;
										Padding = UDim.new(0,5);
									};
									Children = {};
								};
								{
									ID = 20;
									Type = "Frame";
									Properties = {
										LayoutOrder = 1;
										Name = "DataFrame";
										BackgroundColor3 = Color3.new(1,1,1);
										BackgroundTransparency = 1;
										AutomaticSize = Enum.AutomaticSize.Y;
										Size = UDim2.new(1,0,0,0);
									};
									Children = {
										{
											ID = 21;
											Type = "TextLabel";
											Properties = {
												LayoutOrder = 1;
												TextWrapped = true;
												TextColor3 = Color3.new(2/3,2/3,2/3);
												Text = "Overwrites your current catalog database with the default database.";
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
											ID = 22;
											Type = "UIListLayout";
											Properties = {
												SortOrder = Enum.SortOrder.LayoutOrder;
												Padding = UDim.new(0,5);
											};
											Children = {};
										};
										{
											ID = 23;
											Type = "Frame";
											Properties = {
												BackgroundColor3 = Color3.new(1,1,1);
												BackgroundTransparency = 1;
												Size = UDim2.new(1,0,0,20);
											};
											Children = {
												{
													ID = 24;
													Type = "TextLabel";
													Properties = {
														LayoutOrder = 1;
														TextColor3 = Color3.new(4/5,4/5,4/5);
														Text = "Overwrite Catalog";
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
												{
													ID = 25;
													Type = "Frame";
													Properties = {
														AnchorPoint = Vector2.new(1,0);
														Name = "CheckContainer";
														Position = UDim2.new(1,-1,0,0);
														SizeConstraint = Enum.SizeConstraint.RelativeYY;
														BackgroundColor3 = Color3.new(1,1,1);
														BackgroundTransparency = 1;
														Size = UDim2.new(1,0,1,0);
													};
													Children = {
														{
															ID = 26;
															Type = "TextButton";
															Properties = {
																TextColor3 = Color3.new(0,0,0);
																BorderColor3 = Color3.new(1,1,1);
																Text = "";
																Selectable = false;
																AnchorPoint = Vector2.new(0.5,0.5);
																Font = Enum.Font.SourceSans;
																Name = "CheckButton";
																Position = UDim2.new(0.5,0,0.5,0);
																TextSize = 14;
																Size = UDim2.new(1,0,1,0);
																BorderSizePixel = 0;
																BackgroundColor3 = Color3.new(37/255,37/255,37/255);
															};
															Children = {
																{
																	ID = 27;
																	Type = "ImageLabel";
																	Properties = {
																		Visible = false;
																		ScaleType = Enum.ScaleType.Fit;
																		ImageColor3 = Color3.new(53/255,181/255,1);
																		AnchorPoint = Vector2.new(0.5,0.5);
																		Image = "rbxassetid://5422477875";
																		Name = "Checkmark";
																		Position = UDim2.new(0.5,0,0.5,0);
																		BackgroundTransparency = 1;
																		Size = UDim2.new(1.2999999523163,0,1.2999999523163,0);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(1,1,1);
																	};
																	Children = {};
																};
																{
																	ID = 28;
																	Type = "UICorner";
																	Properties = {
																		CornerRadius = UDim.new(0,2);
																	};
																	Children = {};
																};
																{
																	ID = 29;
																	Type = "UIStroke";
																	Properties = {
																		Color = Color3.new(26/255,26/255,26/255);
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
										{
											ID = 30;
											Type = "Frame";
											Properties = {
												LayoutOrder = 10;
												Name = "Line";
												BackgroundColor3 = Color3.new(229/255,229/255,229/255);
												BorderSizePixel = 0;
												Size = UDim2.new(1,0,0,1);
											};
											Children = {};
										};
									};
								};
								{
									ID = 31;
									Type = "Frame";
									Properties = {
										LayoutOrder = 2;
										Name = "StarterFrame";
										BackgroundColor3 = Color3.new(1,1,1);
										BackgroundTransparency = 1;
										AutomaticSize = Enum.AutomaticSize.Y;
										Size = UDim2.new(1,0,0,0);
									};
									Children = {
										{
											ID = 32;
											Type = "TextLabel";
											Properties = {
												LayoutOrder = 1;
												TextWrapped = true;
												TextColor3 = Color3.new(2/3,2/3,2/3);
												Text = "Installs scripts that will make the avatar editor function out of the box. It uses ProfileService for saving and TopbarPlus v2 for loading. Do not check if you have your own scripts for DataStore and client loading.";
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
											ID = 33;
											Type = "UIListLayout";
											Properties = {
												SortOrder = Enum.SortOrder.LayoutOrder;
												Padding = UDim.new(0,5);
											};
											Children = {};
										};
										{
											ID = 34;
											Type = "Frame";
											Properties = {
												BackgroundColor3 = Color3.new(1,1,1);
												BackgroundTransparency = 1;
												Size = UDim2.new(1,0,0,20);
											};
											Children = {
												{
													ID = 35;
													Type = "TextLabel";
													Properties = {
														LayoutOrder = 1;
														TextColor3 = Color3.new(4/5,4/5,4/5);
														Text = "Quick Start";
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
												{
													ID = 36;
													Type = "Frame";
													Properties = {
														AnchorPoint = Vector2.new(1,0);
														Name = "CheckContainer";
														Position = UDim2.new(1,-1,0,0);
														SizeConstraint = Enum.SizeConstraint.RelativeYY;
														BackgroundColor3 = Color3.new(1,1,1);
														BackgroundTransparency = 1;
														Size = UDim2.new(1,0,1,0);
													};
													Children = {
														{
															ID = 37;
															Type = "TextButton";
															Properties = {
																TextColor3 = Color3.new(0,0,0);
																BorderColor3 = Color3.new(1,1,1);
																Text = "";
																Selectable = false;
																AnchorPoint = Vector2.new(0.5,0.5);
																Font = Enum.Font.SourceSans;
																Name = "CheckButton";
																Position = UDim2.new(0.5,0,0.5,0);
																TextSize = 14;
																Size = UDim2.new(1,0,1,0);
																BorderSizePixel = 0;
																BackgroundColor3 = Color3.new(37/255,37/255,37/255);
															};
															Children = {
																{
																	ID = 38;
																	Type = "ImageLabel";
																	Properties = {
																		Visible = false;
																		ScaleType = Enum.ScaleType.Fit;
																		ImageColor3 = Color3.new(53/255,181/255,1);
																		AnchorPoint = Vector2.new(0.5,0.5);
																		Image = "rbxassetid://5422477875";
																		Name = "Checkmark";
																		Position = UDim2.new(0.5,0,0.5,0);
																		BackgroundTransparency = 1;
																		Size = UDim2.new(1.2999999523163,0,1.2999999523163,0);
																		BorderSizePixel = 0;
																		BackgroundColor3 = Color3.new(1,1,1);
																	};
																	Children = {};
																};
																{
																	ID = 39;
																	Type = "UICorner";
																	Properties = {
																		CornerRadius = UDim.new(0,2);
																	};
																	Children = {};
																};
																{
																	ID = 40;
																	Type = "UIStroke";
																	Properties = {
																		Color = Color3.new(26/255,26/255,26/255);
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
										{
											ID = 41;
											Type = "Frame";
											Properties = {
												LayoutOrder = 10;
												Name = "Line";
												BackgroundColor3 = Color3.new(229/255,229/255,229/255);
												BorderSizePixel = 0;
												Size = UDim2.new(1,0,0,1);
											};
											Children = {};
										};
									};
								};
							};
						};
						{
							ID = 42;
							Type = "TextButton";
							Properties = {
								LayoutOrder = 1;
								TextColor3 = Color3.new(4/5,4/5,4/5);
								Text = "Install";
								AnchorPoint = Vector2.new(0.5,0.5);
								Font = Enum.Font.SourceSansSemibold;
								Position = UDim2.new(0.5,0,0.5,0);
								TextSize = 20;
								AutomaticSize = Enum.AutomaticSize.XY;
								BackgroundColor3 = Color3.new(1,1/3,127/255);
							};
							Children = {
								{
									ID = 43;
									Type = "UICorner";
									Properties = {
										CornerRadius = UDim.new(0,4);
									};
									Children = {};
								};
								{
									ID = 44;
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
									ID = 45;
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
							ID = 46;
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
					ID = 47;
					Type = "Frame";
					Properties = {
						LayoutOrder = 1;
						Name = "Progress";
						BackgroundColor3 = Color3.new(1,1,1);
						BackgroundTransparency = 1;
						AutomaticSize = Enum.AutomaticSize.Y;
						Size = UDim2.new(1,0,1,0);
					};
					Children = {
						{
							ID = 48;
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
									ID = 49;
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
							ID = 50;
							Type = "Frame";
							Properties = {
								BackgroundColor3 = Color3.new(1,1,1);
								BackgroundTransparency = 1;
								Name = "TextFrame";
								Size = UDim2.new(1,0,0,20);
							};
							Children = {
								{
									ID = 51;
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
							ID = 52;
							Type = "UIListLayout";
							Properties = {
								Padding = UDim.new(0,5);
								HorizontalAlignment = Enum.HorizontalAlignment.Center;
								SortOrder = Enum.SortOrder.LayoutOrder;
							};
							Children = {};
						};
						{
							ID = 53;
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
					ID = 54;
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
					ID = 55;
					Type = "Frame";
					Properties = {
						LayoutOrder = 2;
						Name = "Success";
						BackgroundColor3 = Color3.new(1,1,1);
						BackgroundTransparency = 1;
						AutomaticSize = Enum.AutomaticSize.Y;
						Size = UDim2.new(1,0,1,0);
					};
					Children = {
						{
							ID = 56;
							Type = "UIListLayout";
							Properties = {
								Padding = UDim.new(0,5);
								HorizontalAlignment = Enum.HorizontalAlignment.Center;
								SortOrder = Enum.SortOrder.LayoutOrder;
							};
							Children = {};
						};
						{
							ID = 57;
							Type = "Frame";
							Properties = {
								BackgroundColor3 = Color3.new(1,1,1);
								BackgroundTransparency = 1;
								Name = "TextFrame";
								Size = UDim2.new(1,0,0,20);
							};
							Children = {
								{
									ID = 58;
									Type = "TextLabel";
									Properties = {
										LayoutOrder = 1;
										TextColor3 = Color3.new(4/5,4/5,4/5);
										Text = "Download complete.";
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
							ID = 59;
							Type = "TextButton";
							Properties = {
								LayoutOrder = 1;
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
									ID = 60;
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
									ID = 61;
									Type = "UICorner";
									Properties = {
										CornerRadius = UDim.new(0,4);
									};
									Children = {};
								};
								{
									ID = 62;
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
					ID = 63;
					Type = "Frame";
					Properties = {
						LayoutOrder = 3;
						Name = "Fail";
						BackgroundColor3 = Color3.new(1,1,1);
						BackgroundTransparency = 1;
						AutomaticSize = Enum.AutomaticSize.Y;
						Size = UDim2.new(1,0,1,0);
					};
					Children = {
						{
							ID = 64;
							Type = "UIListLayout";
							Properties = {
								Padding = UDim.new(0,5);
								HorizontalAlignment = Enum.HorizontalAlignment.Center;
								SortOrder = Enum.SortOrder.LayoutOrder;
							};
							Children = {};
						};
						{
							ID = 65;
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
									ID = 66;
									Type = "UICorner";
									Properties = {
										CornerRadius = UDim.new(0,4);
									};
									Children = {};
								};
								{
									ID = 67;
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
									ID = 68;
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
							ID = 69;
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
					ID = 70;
					Type = "UIPadding";
					Properties = {
						PaddingBottom = UDim.new(0,1);
						PaddingTop = UDim.new(0,1);
					};
					Children = {};
				};
			};
		};
		{
			ID = 71;
			Type = "UIListLayout";
			Properties = {
				SortOrder = Enum.SortOrder.LayoutOrder;
				Padding = UDim.new(0,5);
			};
			Children = {};
		};
		{
			ID = 72;
			Type = "UIPadding";
			Properties = {
				PaddingBottom = UDim.new(0,10);
				PaddingTop = UDim.new(0,10);
				PaddingRight = UDim.new(0,10);
				PaddingLeft = UDim.new(0,10);
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