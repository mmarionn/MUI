-------------------------------------------
-- MUI
-- Button
-------------------------------------------

local M, DB, L = unpack(select(2, ...))

local Defaults = {

	parent = UIParent,
	width = 55,
	height = 28,
	point = {"CENTER"},
	text = "",
	description = "",
	onClick = [[]],
}

local template = {

	button = function(property)
		setmetatable(property, {__index = Defaults})
		local object = CreateFrame("Button", property.name, property.parent)
		
		object:Width(property.width)
		object:Height(property.height)
		object:Point(unpack(property.point))
		object:SetTemplate(true)
		
		object:SetText(property.text)
		object:SetNormalFontObject(GameFontNormal)
		object:SetHighlightFontObject(GameFontHighlight)
		object:SetPushedTextOffset(M.scale(1), -M.scale(1))
		
		object:SetScript("OnClick", loadstring(property.onClick))
		object:SetScript("OnEnter", function(self)
			GameTooltip:SetOwner(UIParent, "ANCHOR_CURSOR")
			GameTooltip:ClearLines()
			GameTooltip:AddLine(property.description)
			GameTooltip:Show()
		end)
		object:SetScript("OnLeave", function(self)
			GameTooltip:Hide()
		end)
		return object
	end

}

M.Templates = M.Templates + template