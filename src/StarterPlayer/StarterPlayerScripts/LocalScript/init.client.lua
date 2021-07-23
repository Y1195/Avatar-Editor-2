local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local Run = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local UserInput = game:GetService("UserInputService")

local AvatarEditor = ReplicatedStorage.AvatarEditor
local AE = require(AvatarEditor.AvatarEditorClient)
local Icon = require(script.Icon)
local Distort = require(script.Distort)

local player = Players.LocalPlayer

local playerModule = require(player:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule"))
local controlModule = playerModule:GetControls()

local defaultMinZoom = player.CameraMinZoomDistance

local sunrays = Lighting:FindFirstChildWhichIsA("SunRaysEffect")
local defaultSunrays = sunrays and sunrays.Enabled or false

local avatarIcon = Icon.new()
:setName("AvatarEditor")
:setImage("rbxasset://textures/ui/ImageSet/LuaApp/img_set_2x_3.png")
:set("iconRectOffset", Vector2.new(158, 375))
:set("iconRectSize", Vector2.new(48, 53))
:setCaption("Avatar Editor")


AE.Started:Connect(function()
	controlModule:Disable()
	UserInput.ModalEnabled = true
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
	Distort.Start()
	player.CameraMinZoomDistance = 5
	
	if sunrays then
		sunrays.Enabled = false
	end
end)

AE.Loaded:Connect(function()
	
end)

AE.PermissionFailed:Connect(function()
	
end)

AE.Destroyed:Connect(function()
	Distort.Stop()
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
	controlModule:Enable()
	UserInput.ModalEnabled = false
	player.CameraMinZoomDistance = defaultMinZoom
	
	if sunrays then
		sunrays.Enabled = defaultSunrays
	end
end)

Run:BindToRenderStep("AvatarEditor", Enum.RenderPriority.Camera.Value, function(delta)
	local alpha = AE:GetAlpha()
	Distort.Position = UDim2.new(-0.3 * alpha, 0, 0, 0)
	Distort.Size = UDim2.new(0.9, 0, 0.9, 0)
	AE:OnRenderStep(delta)
end)


avatarIcon.toggled:Connect(function(isSelected)
	if isSelected then
		AE:Load()
	else
		AE:Destroy()
	end
end)