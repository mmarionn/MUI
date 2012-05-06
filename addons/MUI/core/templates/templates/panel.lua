-------------------------------------------
-- MUI
-- Templates
-------------------------------------------

local M, DB, L = unpack(select(2, ...))

local Defaults = {

	parent = UIParent,
	width = 100,
	height = 80,
	point = {"CENTER"},
	description = "",
	
}

local template = {

	panel = function(property)
		setmetatable(property, {__index = Defaults})

		local object = CreateFrame("Frame", property.name, property.parent)

		object:Width(property.width)
		object:Height(property.height)
		object:Point(unpack(property.point))
		object:SetTemplate(true)
		
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