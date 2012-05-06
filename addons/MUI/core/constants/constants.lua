-------------------------------------------
-- MUI
-- Constants
-------------------------------------------

local M, DB, L = unpack(select(2, ...))

local constants = {
	noop = function() end,
	myName = select(1, UnitName("player")),
	myClass = select(2, UnitClass("player")),
	myRealm = GetRealmName(),
	texture = "Interface\\Addons\\MUI\\Media\\Textures\\",
	sound = "Interface\\Addons\\MUI\\Media\\Sounds\\",
	font = "Interface\\Addons\\MUI\\Media\\Fonts\\",
	screenHeight = tonumber(strmatch(({GetScreenResolutions()})[GetCurrentResolution()], "%d+x(%d+)")),
	screenWidth = tonumber(strmatch(({GetScreenResolutions()})[GetCurrentResolution()], "(%d+)x+%d")),
	mult = 768/strmatch(GetCVar("gxResolution"), "%d+x(%d+)")/DB.DefaultOptions.GlobalOptions.UIScale,
	scale = function(x) return M.mult*floor(x/M.mult+.5) end,
	TexCoords = {.08, .92, .08, .92},
}

M = M + constants