-- https://gist.github.com/Reselim/25f87f9a5e458a0b2d913a54abe5bb43

-- black frames not included

local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local Camera = Workspace.CurrentCamera

local Module = {}

Module.Position = UDim2.new(0, 0, 0, 0)
Module.Size = UDim2.new(1, 0, 1, 0)

local function UDim2Absolute(udim2)
	local viewSize = Camera.ViewportSize

	return Vector2.new(
		(udim2.X.Scale * viewSize.X) + udim2.X.Offset,
		(udim2.Y.Scale * viewSize.Y) + udim2.Y.Offset
	)
end

--- Compute offset

function Module._computePosition()
	local viewSize = Camera.ViewportSize
	local aspectRatio = viewSize.X / viewSize.Y

	local offset = UDim2Absolute(Module.Position)
	local position = offset / viewSize

	-- Taken from ScreenSpace
	local hFactor = math.tan(math.rad(Camera.FieldOfView) / 2)
	local wFactor = hFactor * aspectRatio

	return -position.X * wFactor * 2, position.Y * hFactor * 2
end

function Module._computeSize()
	local size = UDim2Absolute(Module.Size) / Camera.ViewportSize
	return size.X, size.Y
end

function Module._getOffset()
	local x, y = Module._computePosition()
	local w, h = Module._computeSize()

	return CFrame.new(
		0, 0, 0,

		w, 0, 0,
		0, h, 0,
		x, y, 1
	)
end

--- Handler

function Module.Start()
	RunService:BindToRenderStep("ViewportResizer", Enum.RenderPriority.Camera.Value + 1, function()
		Camera.CFrame = Camera.CFrame * Module._getOffset()
	end)
end

function Module.Stop()
	RunService:UnbindFromRenderStep("ViewportResizer")
end

return Module