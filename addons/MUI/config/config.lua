-------------------------------------------
-- MUI
-- Config
-------------------------------------------

local M, DB, L = unpack(select(2, ...))

DB.DefaultOptions = {
	["GlobalOptions"] = {--[[ 全局设定 ]]
		["AutoResolution"] = true,										--[[ true / false — 是否自动将分辨率设置为适应屏幕 ]]
		["UIScale"] = .65,												--[[ UI缩放值，建议值为0.65~0.8 ]]
		["ClassColor"] = true,											--[[ true / false — 是否启用职业着色风格 ]]
		["BorderColor"] = { .1, .5, .85 },								--[[ 皮肤边框颜色 ]]
		["BackdropColor"] = { 0, 0, 0 },								--[[ 皮肤背景颜色 ]]
		["NormalFont"] = "Fonts\\ARIALN.ttf",							--[[ 常规字体路径 ]]
		["PixelFont"] = "Interface\\Addons\\MUI\\Media\\Fonts\\pixel.ttf",--[[ 像素字体路径 ]]
		["FontSize"] = 14,												--[[ 全局字体尺寸 ]]
	},
	
	["Actionbars"] = {--[[ 动作条设定 ]]
		["Enable"] = true,												--[[ true / false — 是否启用动作条部分，如果这里选择false，那么所有动作条都将被禁用 ]]
		["ShowHotkeyText"] = false,									--[[ true / false — 显示快捷键名 ]]
		["HotkeyTextSize"] = 14,										--[[ 快捷键名尺寸 ]]
		["ShowMacroText"] = false,										--[[ true / false — 显示宏按钮名 ]]
		["CooldownTextSize"] = 22,										--[[ 冷却计时尺寸 ]]
		["ShowGrid"] = true,											--[[ true / false — 如果这里选择true，那么动作条将总是显示空按钮 ]]

		["Bar1"] = {--[[ 主动作条设定 ]]
			["Enable"] = true,											--[[ true / false — 是否启用主动作条，如果这里选择false，那么该动作条将被禁用，下同 ]]
			["Scale"] = 1,												--[[ 动作条缩放值 ]]
			["Alpha"] = 1,												--[[ 0～1 — 0为全透明，1为不透明，动作条的常态透明度值 ]]
			["ButtonSize"] = 40,										--[[ 动作条按钮的尺寸 ]]
			["Spacing"] = 3,											--[[ 动作条按钮的间隔 ]]
			["Style"] = "1*12",
			["Position"] = { "BOTTOM", UIParent, "BOTTOM", 0, 15 },		--[[ 坐标，参数输入同Point() ]]
			["ShowOnMouseover"] = false,								--[[ true / false — 当鼠标悬停时显示该动作条 ]]
			["ShowInCombat"] = false, },								--[[ true / false — 当进入战斗时显示该动作条 ]]

		["Bar2"] = {--[[ 下左动作条 ]]
			["Enable"] = true, 
			["Scale"] = 0.9,
			["Alpha"] = 1,
			["ButtonSize"] = 32,
			["Spacing"] = 3,
			["Style"] = "1*12",
			["Position"] = { "BOTTOMRIGHT", ActionButton6, "TOPRIGHT", 0, 3 },
			["ShowOnMouseover"] = false,
			["ShowInCombat"] = false, },

		["Bar3"] = {--[[ 下右动作条 ]]
			["Enable"] = true, 
			["Scale"] = 0.9,
			["Alpha"] = 1,
			["ButtonSize"] = 32,
			["Spacing"] = 3,
			["Style"] = "1*12",
			["Position"] = { "BOTTOMLEFT", ActionButton7, "TOPLEFT", 0, 3 },
			["ShowOnMouseover"] = false,
			["ShowInCombat"] = false, },

		["Bar4"] = {--[[ 侧边左动作条 ]]
			["Enable"] = true, 
			["Scale"] = 0.9,
			["Alpha"] = 1,
			["ButtonSize"] = 32,
			["Spacing"] = 3,
			["Style"] = "12*1",
			["Position"] = { "RIGHT", UIParent, "RIGHT", -25, 0 },
			["ShowOnMouseover"] = false,
			["ShowInCombat"] = false, },

		["Bar5"] = {--[[ 侧边右动作条 ]]
			["Enable"] = true, 
			["Scale"] = 0.9,
			["Alpha"] = 1,
			["ButtonSize"] = 32,
			["Spacing"] = 3,
			["Style"] = "12*1",
			["Position"] = { "TOPRIGHT", MultiBarRightButton1, "TOPLEFT", -3, 0 },
			["ShowOnMouseover"] = false,
			["ShowInCombat"] = false, },

		["PetBar"] = {--[[ 宠物动作条 ]]
			["Enable"] = true, 
			["Scale"] = 0.9,
			["Alpha"] = 1,
			["ButtonSize"] = 32,
			["Spacing"] = 3,
			["Position"] = { "BOTTOMRIGHT", MultiBarBottomRightButton11, "TOPRIGHT", 0, 3 },
			["ShowOnMouseover"] = false,
			["ShowInCombat"] = false, },
	
		["StanceBar"] = {--[[ 姿态条，包含姿态 / 光环 / 变形 等…… ]]
			["Enable"] = true, 
			["Scale"] = 0.9,
			["Alpha"] = 1,
			["ButtonSize"] = 32,
			["Spacing"] = 3,
			["Position"] = { "BOTTOMLEFT", MultiBarBottomLeftButton2, "TOPLEFT", 0, 3 },
			["ShowonMouseover"] = false,
			["ShowinCombat"] = false, },
		
		["TotemBar"] = {--[[ 图腾条 ]]
			["Enable"] = true, 
			["Scale"] = .9,
			["Alpha"] = 1,
			["ButtonSize"] = 32,
			["Spacing"] = 3,
			["Position"] = { "BOTTOMLEFT", MultiBarBottomLeftButton2, "TOPLEFT", 0, 3 },
			["ShowOnMouseover"] = false,
			["ShowInCombat"] = false, },
	},

	["Bags"] = {--[[ 背包增强 ]]
		["Enable"] = true,											--[[ true / false — 是否启用背包增强 ]]
		["ButtonPerRow"] = 10,										--[[ 一体式背包每行单元格数 ]]
		["ButtonSize"] = 32,
		["Spacing"] = 32,
		
	},

	["Buffs"] = {--[[ BUFF框体美化 ]]
		["Enable"] = true,											--[[ true / false — 是否启用BUFF框体美化 ]]
		["IconPerRow"] = 10,
	},

	["CombatLogTexts"] = {--[[ 滚动战斗信息美化 ]]
		["Enable"] = true,											--[[ true / false — 是否启用战斗信息美化 ]]
		
	},

	["DataTexts"] = {--[[ 数据文本 ]]
		["Enable"] = true,
	},
	
	["Lootframe"] = {--[[ 拾取框体 ]]
		["Enable"] = true,											--[[ true / false — 是否启用拾取框体 ]]
		["IconSize"] = 34,											--[[ 拾取框体物品图标大小 ]]
		["Scale"] = 1,												--[[ 拾取框体缩放值 ]]
		["Position"] = { 150, 0 },									--[[ 当拾取框体不在鼠标位置出现时的坐标 ]]
	},

	["LootRollframe"] = {--[[ ROLL点框体 ]]
		["Enable"] = true,											--[[ true / false — 是否启用ROLL点框体 ]]
		["IconSize"] = 34,											--[[ ROLL点框体图标大小 ]]
		["BarWidth"] = 300,											--[[ 计时条长度 ]]
		["BarHeight"] = 16,											--[[ 计时条高度 ]]
		["Growth"] = "TOP",											--[[ “TOP” / "BOTTOM" — 向上增长或向下增长 ]]
		["Scale"] = 1,												--[[ ROLL点框体缩放值 ]]
	},

	["Minimap"] = {--[[ 小地图增强 ]]
		["Enable"] = true,											--[[ true / false — 是否启用迷你地图框体 ]]
		["Width"] = 150,											--[[ 小地图宽度 ]]
		["Height"] = 150,											--[[ 小地图高度 ]]
		["Scale"] = 1,												--[[ 小地图缩放值 ]]
		["ZoneText"] = true,										--[[ true / false — 是否显示地域文本 ]]
		["Position"] = { "TOPRIGHT", UIParent, "TOPRIGHT", -20, -20 },--[[ 坐标，参数输入同Point() ]]
		["CollectMinimapButton"] = true,							--[[ true / false — 是否收集小地图按钮 ]]
	},

	["Micromenu"] = {--[[ 微型菜单栏 ]]
		["Enable"] = true,											--[[ true / false — 是否启用微型菜单栏美化 ]]
		["Scale"] = 1,												--[[ 微型菜单栏缩放值 ]]
		["Position"] = { "TOPRIGHT", UIParent, "TOPRIGHT", -20, -20 },--[[ 坐标，参数输入同Point() ]]
	},

	["Nameplates"] = {--[[ 姓名板 ]]
		["Enable"] = true,											--[[ true / false — 是否启用姓名板增强 ]]
		["Width"] = 128,											--[[ 姓名板宽度 ]]	
		["Height"] = 8,												--[[ 姓名板高度 ]]
		["Scale"] = 1,												--[[ 姓名板缩放 ]]
		["ClassColor"] = true,										--[[ true / false — 是否开启生命条职业着色 ]]
		["ClassIcon"] = true,										--[[ true / false — 是否显示职业图标 ]]
	},
	
	["Socials"] = {--[[ 社交功能增强 ]]
		["Enable"] = true,											--[[ true / false — 是否启用社交功能增强 ]]
		
	},
	
	["Tooltip"] = {--[[ 鼠标提示 ]]
		["Enable"] = true,											--[[ true / false —	是否启用鼠标提示增强 ]]
		["AnchorCursor"] = true,									--[[ true / false —	是否使鼠标提示跟随鼠标 ]]
		["OffsetXY"] = { 16, 16 },									--[[ 当鼠标提示跟随鼠标时的坐标偏移值 ]]
		["AlwaysGetDetailInfo"] = false,							--[[ true / false —	是否总是获取目标详细信息（天赋，装备等级），如果这里选择false，那么你只有在按下Ctrl或Shift或Alt三者任意键的情况下会获取目标详细信息 ]]
	},

	["WatchFrame"] = {--[[ 任务追踪面板 ]]
		["Enable"] = true,											--[[ true / false —	是否启用任务追踪面板美化 ]]
		["WatchFrameAutoCollapse"] = true,							--[[ true / false —	是否启用进入战斗自动折叠任务追踪面板 ]]
		["Scale"] = 1,												--[[ 任务追踪面板缩放 ]]
		["Position"] = { "TOPRIGHT", UIParent, "TOPRIGHT", -20, -20 },--[[ 坐标，参数输入同Point() ]]
	},

	["Misc"] = {--[[ 杂项 ]]
		["AutoRepair"] = true,										--[[ true / false —	是否启用自动修理 ]]
		["AutoSellJunk"] = true,									--[[ true / false —	是否启用自动出售垃圾 ]]
		["ErrorFilter"] = false,									--[[ true / false —	是否屏蔽红字信息 ]]
		["InfoFilter"] = false,									--[[ true / false —	是否将黄字信息显示在聊天栏内 ]]
	},
}