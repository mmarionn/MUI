-------------------------------------------
-- MUI
-- Slash commands
-------------------------------------------

local M, DB, L = unpack(select(2, ...))

SLASH_RELOADUI1 = "/rl"
SlashCmdList["RELOADUI"] = ReloadUI

SLASH_RCSLASH1 = "/rc"
SlashCmdList["RCSLASH"] = DoReadyCheck

