-------------------------------------------
-- MUI
-- zhCN locale
-------------------------------------------

local M, DB, L = unpack(select(2, ...))

if GetLocale() == "zhCN" then
	L["abc"] = "cde",
	L["excellent"]
end
print(L.abc, L.excellent)