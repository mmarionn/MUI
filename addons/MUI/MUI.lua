-------------------------------------------
-- MUI
-- Initialization and default options
-------------------------------------------

local addonName, nameSpace = ...

nameSpace[1] = {}
nameSpace[2] = {}
nameSpace[3] = {}

MUI = nameSpace

local M, DB, L = unpack(nameSpace)

DB.DefaultOptions = {





}

function DB:Setting()
	SetCVar("alwaysShowActionBars", 1)
	print(123)
end
DB:RegisterEvent("PLAYER_LOGIN")
DB:SetScript("OnEvent", self:Setting())