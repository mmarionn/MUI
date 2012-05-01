-------------------------------------------
-- MUI
-- Config
-------------------------------------------

local M, DB, L = unpack(select(2, ...))

DB.DefaultOptions = {
	["GlobalOptions"] = {
		["AutoResolution"] = true,
		["UIScale"] = .65,
		["ClassColor"] = true,
		["BorderColor"] = { .1, .5, .85 },
		["BackdropColor"] = { 0, 0, 0 },
		["NormalFont"] = "Fonts\\ARIALN.ttf",
		["PixelFont"] = "Interface\\Addons\\MUI\\Media\\Fonts\\pixel.ttf",
		["FontSize"] = 14,
	},
	
	["Actionbars"] = {
		["Enable"] = true,
		["ShowHotkeyText"] = false,
		["HotkeyTextSize"] = 14,
		["ShowMacroText"] = false,
		["CooldownTextSize"] = 22,
		["ShowGrid"] = true,

		["Bar1"] = {
			["Enable"] = true,
			["Scale"] = 1,
			["Alpha"] = 1,
			["ButtonSize"] = 40,
			["Spacing"] = 3,
			["Style"] = "1*12",
			["Position"] = { "BOTTOM", UIParent, "BOTTOM", 0, 15 },
			["ShowOnMouseover"] = false,
			["ShowInCombat"] = false, },

		["Bar2"] = {
			["Enable"] = true, 
			["Scale"] = 0.9,
			["Alpha"] = 1,
			["ButtonSize"] = 32,
			["Spacing"] = 3,
			["Style"] = "1*12",
			["Position"] = { "BOTTOMRIGHT", ActionButton6, "TOPRIGHT", 0, 3 },
			["ShowOnMouseover"] = false,
			["ShowInCombat"] = false, },

		["Bar3"] = {
			["Enable"] = true, 
			["Scale"] = 0.9,
			["Alpha"] = 1,
			["ButtonSize"] = 32,
			["Spacing"] = 3,
			["Style"] = "1*12",
			["Position"] = { "BOTTOMLEFT", ActionButton7, "TOPLEFT", 0, 3 },
			["ShowOnMouseover"] = false,
			["ShowInCombat"] = false, },

		["Bar4"] = {
			["Enable"] = true, 
			["Scale"] = 0.9,
			["Alpha"] = 1,
			["ButtonSize"] = 32,
			["Spacing"] = 3,
			["Style"] = "12*1",
			["Position"] = { "RIGHT", UIParent, "RIGHT", -25, 0 },
			["ShowOnMouseover"] = false,
			["ShowInCombat"] = false, },

		["Bar5"] = {
			["Enable"] = true, 
			["Scale"] = 0.9,
			["Alpha"] = 1,
			["ButtonSize"] = 32,
			["Spacing"] = 3,
			["Style"] = "12*1",
			["Position"] = { "TOPRIGHT", MultiBarRightButton1, "TOPLEFT", -3, 0 },
			["ShowOnMouseover"] = false,
			["ShowInCombat"] = false, },

		["PetBar"] = {
			["Enable"] = true, 
			["Scale"] = 0.9,
			["Alpha"] = 1,
			["ButtonSize"] = 32,
			["Spacing"] = 3,
			["Position"] = { "BOTTOMRIGHT", MultiBarBottomRightButton11, "TOPRIGHT", 0, 3 },
			["ShowOnMouseover"] = false,
			["ShowInCombat"] = false, },
	
		["StanceBar"] = {
			["Enable"] = true, 
			["Scale"] = 0.9,
			["Alpha"] = 1,
			["ButtonSize"] = 32,
			["Spacing"] = 3,
			["Position"] = { "BOTTOMLEFT", MultiBarBottomLeftButton2, "TOPLEFT", 0, 3 },
			["ShowonMouseover"] = false,
			["ShowinCombat"] = false, },
		
		["TotemBar"] = {
			["Enable"] = true, 
			["Scale"] = .9,
			["Alpha"] = 1,
			["ButtonSize"] = 32,
			["Spacing"] = 3,
			["Position"] = { "BOTTOMLEFT", MultiBarBottomLeftButton2, "TOPLEFT", 0, 3 },
			["ShowOnMouseover"] = false,
			["ShowInCombat"] = false, },
	},

	["Bags"] = {
		["Enable"] = true,
		["ButtonPerRow"] = 10,
		["ButtonSize"] = 32,
		["Spacing"] = 32,
		
	},

	["Buffs"] = {
		["Enable"] = true,
		["IconPerRow"] = 10,
	},

	["CombatLogTexts"] = {
		["Enable"] = true,
		
	},

	["DataTexts"] = {
		["Enable"] = true,
	},
	
	["Lootframe"] = {
		["Enable"] = true,
		["IconSize"] = 34,
		["Scale"] = 1,
		["Position"] = { 150, 0 },
	},

	["LootRollframe"] = {
		["Enable"] = true,
		["IconSize"] = 34,
		["BarWidth"] = 300,
		["BarHeight"] = 16,
		["Growth"] = "TOP",
		["Scale"] = 1,
	},
	
	["Minimap"] = {
		["Enable"] = true,
		["Width"] = 150,
		["Height"] = 150,
		["Scale"] = 1,
		["ZoneText"] = true,
		["Position"] = { "TOPRIGHT", UIParent, "TOPRIGHT", -20, -20 },
		["CollectMinimapButton"] = true,
	},

	["Micromenu"] = {
		["Enable"] = true,
		["Scale"] = 1,
		["Position"] = { "TOPRIGHT", UIParent, "TOPRIGHT", -20, -20 },
	},

	["Nameplates"] = {
		["Enable"] = true,
		["Width"] = 128,
		["Height"] = 8,
		["Scale"] = 1,
		["ClassColor"] = true,
		["ClassIcon"] = true,
	},
	
	["Socials"] = {
		["Enable"] = true,
	},
	
	["Tooltip"] = {
		["Enable"] = true,
		["AnchorCursor"] = true,
		["OffsetXY"] = { 16, 16 },
		["AlwaysGetDetailInfo"] = false,
	},

	["WatchFrame"] = {
		["Enable"] = true,
		["WatchFrameAutoCollapse"] = true,
		["Scale"] = 1,
		["Position"] = { "TOPRIGHT", UIParent, "TOPRIGHT", -20, -20 },
	},

	["Misc"] = {
		["AutoRepair"] = true,
		["AutoSellJunk"] = true,
		["ErrorFilter"] = false,
		["InfoFilter"] = false,
	}
}