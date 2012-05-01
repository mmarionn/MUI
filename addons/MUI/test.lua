-------------------------------------------
-- MUI
-- Test code
-------------------------------------------

local M, DB, L = unpack(select(2, ...))

DB.CVar = {
	["alwaysShowActionBars"] = true,
}

DB.EventHandler = CreateFrame("Frame")
function DB:SetCVars()
	SetCVar("alwaysShowActionBars", 1)

end
DB.EventHandler:RegisterEvent("PLAYER_LOGIN")
DB.EventHandler:SetScript("OnEvent", DB.SetCVars)

function M:SetProperty(widget, property)
	local frame = CreateFrame(widget, property.Name, property.Parent)
	frame:SetWidth(property.Width)
	frame:SetHeight(property.Height)
	frame:SetPoint("CENTER")
	for k, v in pairs(property) do
		frame[k] = v
	end
	return frame
end

function M:Create(widget)
	return function(property)
		return M:SetProperty(widget, property)
	end
end

M:Create "Frame" {
	Name = "TestFrame",
	Parent = UIParent,
	Width = 120,
	Height = 180,
	Description = [[这是一个测试面板]],
}
print(TestFrame.Name, TestFrame.Description)