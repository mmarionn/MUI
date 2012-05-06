-------------------------------------------
-- MUI
-- Test code
-------------------------------------------

local M, DB, L = unpack(select(2, ...))

M:Create "Button" {
	name = "TestButton",
	parent = UIParent,
	width = 55,
	height = 28,
	point = {"CENTER", UIParent, "CENTER", 300, 0},
	text = "确定",
	description = "这是一个测试面板",
	onClick = [[ print(GetCursorPosition()) ]]
}

