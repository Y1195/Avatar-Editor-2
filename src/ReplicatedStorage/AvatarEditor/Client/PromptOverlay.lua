-- Class
-- 0_1195
-- January 10, 2021

--[[



]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Marketplace = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

local AvatarEditor = ReplicatedStorage.AvatarEditor
local Spring = require(AvatarEditor.Shared.Util.Spring)
local Maid = require(AvatarEditor.Shared.Util.Maid)
local Promise = require(AvatarEditor.Shared.Util.Promise)
local GuiLib = require(AvatarEditor.Client.GuiLib.LazyLoader)
local GetProductInfo = require(AvatarEditor.Shared.GetProductInfo)
local Theme = require(AvatarEditor.Client.Theme)

local player = Players.LocalPlayer

local Class = {}
Class.__index = Class


function Class.new(frame)
	local self = setmetatable({}, Class)
	
	self.Frame = frame
	self.PurchaseFrame = self.Frame.Frame
	self.CreateFrame = self.Frame.CreateOutfit
	self.ConfirmFrame = self.Frame.Confirm
	
	self.Maid = Maid.new()
	self.Listeners = Maid.new()
	
	for i, v in ipairs(frame:GetChildren()) do
		if not v:IsA("Frame") then
			continue
		end
		self.Maid:GiveTask(Theme:Bind(v, "BackgroundColor3", "Primary"))
		self.Maid:GiveTask(Theme:Bind(v.Buttons.Button1, "BackgroundColor3", "Cancel"))
		self.Maid:GiveTask(Theme:Bind(v.Buttons.Button1, "TextColor3", "Text"))
		self.Maid:GiveTask(Theme:Bind(v.Buttons.Button2, "BackgroundColor3", "Confirm"))
		self.Maid:GiveTask(Theme:Bind(v.Buttons.Button2, "TextColor3", "Text"))
	end

	self.Maid:GiveTask(Theme:Bind(self.ConfirmFrame.Body.MessageLabel, "TextColor3", "Text"))
	self.Maid:GiveTask(Theme:Bind(self.ConfirmFrame.Body.TextLabel, "TextColor3", "Text"))
	self.Maid:GiveTask(Theme:Bind(self.ConfirmFrame.Body.TextLabel.Line, "BackgroundColor3", "Text"))
	
	self.Maid:GiveTask(Theme:Bind(self.CreateFrame.Body.TextLabel, "TextColor3", "Text"))
	self.Maid:GiveTask(Theme:Bind(self.CreateFrame.Body.TextLabel.Line, "BackgroundColor3", "Text"))
	self.Maid:GiveTask(Theme:Bind(self.CreateFrame.Body.Info.Search, "BackgroundColor3", "TabButton"))
	self.Maid:GiveTask(Theme:Bind(self.CreateFrame.Body.Info.Search.TextBox, "PlaceholderColor3", "PlaceholderText"))
	self.Maid:GiveTask(Theme:Bind(self.CreateFrame.Body.Info.Search.TextBox, "TextColor3", "Text"))
	
	self.Maid:GiveTask(Theme:Bind(self.PurchaseFrame.Body.ProductInfo.ItemPreviewImage.ItemPreviewImageContainer, "BackgroundColor3", "Text"))
	self.Maid:GiveTask(Theme:Bind(self.PurchaseFrame.Body.ProductInfo.ProductDescription.ProductDescriptionText, "TextColor3", "Text"))
	self.Maid:GiveTask(Theme:Bind(self.PurchaseFrame.Body.AdditionalDetails, "TextColor3", "Text"))
	
	self.TweenSpring = Spring.new(1)
	self.TweenSpring.Damper = 1
	self.TweenSpring.Speed = 20
	
	for i, v in ipairs(frame:GetChildren()) do
		if v:IsA("Frame") then
			v.Visible = false
		end
	end
	
	return self
end


function Class:OnRenderStep(delta)
	local frame = self.Frame
	local tweenSpring = self.TweenSpring
	
	tweenSpring:TimeSkip(delta)
	
	local pos = tweenSpring.Position
	frame.BackgroundTransparency = 0.4 + pos * 0.6
	frame.Visible = frame.BackgroundTransparency < 0.98
end


function Class:PromptPurchase(assetId)
	local maid = self.Listeners
	local frame = self.PurchaseFrame
	
	local overlayButtons = frame.Buttons
	local productInfoFrame = frame.Body.ProductInfo
	local descriptionLabel = productInfoFrame.ProductDescription.ProductDescriptionText
	local previewImage = productInfoFrame.ItemPreviewImage.ItemPreviewImageContainer.ItemImage
	
	self:_setup(frame)
	
	descriptionLabel.Text = ""
	previewImage.Image = ""
	overlayButtons.Button2.Text = "???"
	
	local productInfoPromise = GetProductInfo(assetId)
	productInfoPromise:andThen(function(productInfo)
		descriptionLabel.Text = productInfo.Name
		previewImage.Image = "rbxthumb://type=Asset&id=" .. productInfo.AssetId .. "&w=150&h=150"

		if productInfo.IsPublicDomain then
			overlayButtons.Button2.Text = "Free"
		elseif productInfo.IsForSale then
			overlayButtons.Button2.Text = productInfo.PriceInRobux .. " Robux"
		else
			overlayButtons.Button2.Text = "Offsale"
		end
		
		maid:GiveTask(overlayButtons.Button2.Activated:Connect(function(inputObject)
			Marketplace:PromptPurchase(player, assetId)
			maid:DoCleaning()
		end))
	end)
	:catch(warn)
	
	maid:GiveTask(function()
		productInfoPromise:cancel()
		descriptionLabel.Text = ""
		previewImage.Image = ""
		overlayButtons.Button2.Text = "???"
	end)
end


function Class:PromptCostume(callback)
	local maid = self.Listeners
	
	local frame = self.CreateFrame
	local overlayButtons = frame.Buttons
	local textBox = frame.Body.Info.Search.TextBox
	
	self:_setup(frame)
	
	frame.Body.Info.TextLabel.Visible = false -- TODO error messages?
	
	local mask = GuiLib.Classes.TextMask.new(textBox)
	maid:GiveTask(mask)
	
	mask:SetMaskType("Alphanumberic")
	mask:SetMaxLength(20)
	
	local function onFocusLost()
		if textBox.Text ~= "" then
			callback(textBox.Text)
			maid:DoCleaning()
		end
	end
	
	maid:GiveTask(mask.Frame.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
		if not enterPressed then
			return
		end
		onFocusLost()
	end))
	
	maid:GiveTask(overlayButtons.Button2.Activated:Connect(function(inputObject)
		onFocusLost()
	end))
	
	maid:GiveTask(function()
		textBox.Text = ""
	end)
	
	textBox:CaptureFocus()
end


function Class:PromptConfirm(configTable, callback)
	local maid = self.Listeners
	
	local frame = self.ConfirmFrame
	local overlayButtons = frame.Buttons
	
	frame.Body.TextLabel.Text = configTable.Title or "Confirm"
	frame.Body.MessageLabel.Text = configTable.Text or "Are you sure you want to do this action?"
	
	maid:GiveTask(overlayButtons.Button2.Activated:Connect(function(inputObject)
		callback()
		maid:DoCleaning()
	end))
	
	self:_setup(frame)
end


function Class:_setup(frame)
	local maid = self.Listeners
	local tweenSpring = self.TweenSpring
	
	local overlayButtons = frame.Buttons
	
	maid:GiveTask(overlayButtons.Button1.Activated:Connect(function(inputObject)
		maid:DoCleaning()
	end))
	
	maid:GiveTask(frame.Parent.Activated:Connect(function(inputObject)
		maid:DoCleaning()
	end))
	
	maid:GiveTask(function()
		frame.Visible = false
		tweenSpring.Target = 1
	end)
	
	frame.Visible = true
	tweenSpring.Target = 0
end


function Class:Destroy()
	self.Maid:DoCleaning()
	self.Maid = nil
	self.Listeners:DoCleaning()
	self.Listeners = nil
	self.Frame = nil
	self.PurchaseFrame = nil
	self.CreateFrame = nil
	self.ConfirmFrame = nil
	self.TweenSpring = nil
	setmetatable(self, nil)
end


return Class