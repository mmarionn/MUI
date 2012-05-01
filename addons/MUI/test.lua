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

local ColorGradient = function(perc, ...)
    -- Translate divison by zeros into 0, so we don't blow select.
    -- We check perc against itself because we rely on the fact that NaN can't equal NaN.
    if(perc ~= perc or perc == inf) then perc = 0 end

    if perc >= 1 then
        local r, g, b = select(select('#', ...) - 2, ...)
        return r, g, b
    elseif perc <= 0 then
        local r, g, b = ...
        return r, g, b
    end

    local num = select('#', ...) / 3
    local segment, relperc = math.modf(perc*(num-1))
    local r1, g1, b1, r2, g2, b2 = select((segment*3)+1, ...)

    return r1 + (r2-r1)*relperc, g1 + (g2-g1)*relperc, b1 + (b2-b1)*relperc
end
local timer = 0
local TextureFrame = CreateFrame("Frame", "TextureFrame", UIParent)
TextureFrame:SetSize(200, 150)
TextureFrame:SetPoint("CENTER")
TextureFrame:Show()
TextureFrame.Timer = nil
TextureFrame.Texture = TextureFrame:CreateTexture(nil, "ARTWORK")
TextureFrame.Texture:SetAllPoints(TextureFrame)
TextureFrame.Texture:SetTexture("Interface\\Buttons\\WHITE8x8")
TextureFrame.Texture:SetVertexColor(0,0,0,0)
TextureFrame:SetScript("OnUpdate", function(self, e)
	if TextureFrame.Timer then
		timer = timer < 1 and timer + e/30 or timer > 1 and 0
		TextureFrame.Texture:SetVertexColor(ColorGradient(timer, 1,0,0,  1,.6,0  ,.8,1,0,  0,1,0,  0,.7,.3,  0,.3,.7, .8,0,.6,  1,0,0,  1,.6,0  ,.8,1,0,  0,1,0,  0,.7,.3,  0,.3,.7, .8,0,.6, 1,0,0,  1,.6,0  ,.8,1,0,  0,1,0,  0,.7,.3,  0,.3,.7, .8,0,.6, 1,0,0,  1,.6,0  ,.8,1,0,  0,1,0,  0,.7,.3,  0,.3,.7, .8,0,.6, 1,0,0,  1,.6,0  ,.8,1,0,  0,1,0,  0,.7,.3,  0,.3,.7, .8,0,.6, 1,0,0,  1,.6,0  ,.8,1,0,  0,1,0,  0,.7,.3,  0,.3,.7, .8,0,.6))
	end
end)

--[[
local TABLE1 = {
abc = 124,
cde = 345,
fgh = 678,
}

TABLE1.mt = {}
setmetatable(TABLE1, TABLE1.mt)
	TABLE1.mt.__add = metaMethods.Union
	TABLE1.mt.__sub = metaMethods.Complement
	TABLE1.mt.__mul = metaMethods.Intersection
	TABLE1.mt.__div = metaMethods.Subset
local TABLE2 = {
abc = 123,
jkl = 321,
}

local result = TABLE2 - TABLE1
for k, v in pairs(result) do
print(k, v)
end]]