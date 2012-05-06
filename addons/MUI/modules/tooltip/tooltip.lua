-------------------------------------------
-- MUI
-- Tooltip
-------------------------------------------

local M, DB, L = unpack(select(2, ...))

local offsetX, offsetY = unpack(DB.DefaultOptions.Tooltip.OffsetXY)
local function SetTooltipPosition(self)
	local X, Y, point
	if DB.DefaultOptions.Tooltip.AnchorCursor then
		local CurrentX, CurrentY = GetCursorPosition()
		local Scale = UIParent:GetEffectiveScale()
		X, Y = (CurrentX / Scale), (CurrentY / Scale)
		X = ( X + offsetX + self:GetWidth() > M.screenWidth and X - self:GetWidth() - offsetX ) or X + offsetX
		Y = ( Y + offsetY + self:GetHeight() > M.screenHeight  and Y - self:GetHeight() - offsetY - 18 ) or Y+ offsetY
		point = "BOTTOMLEFT"
	else
		X, Y = -50, 100
		point = "BOTTOMRIGHT"
	end
	self:ClearAllPoints()
	self:Point(point, UIParent, point, X, Y)
end

GameTooltip:HookScript("OnUpdate", function(self, ...)
	if self:GetAnchorType() == "ANCHOR_CURSOR" then
		SetTooltipPosition(self)
   end
end)

hooksecurefunc("GameTooltip_SetDefaultAnchor", function(tooltip, parent)
	if DB.DefaultOptions.Tooltip.AnchorCursor then
		tooltip:SetOwner(parent, "ANCHOR_CURSOR")
	else
		tooltip:SetOwner(parent, "ANCHOR_NONE")
		tooltip:Point("BOTTOMRIGHT", UIParent, "TOPRIGHT", 0, 0)
	end
	tooltip.default = 1
end)
