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

local tinsert = tinsert
local unpack = unpack
local format = format

M.metaMethods = {
	-- a + b	并集
	Union = function(a, b)
		for k in pairs(b) do
			if a[k] then
				a["COPY_"..k] = b[k]
				print(format("The value |cff87CEEBIndex=\"%s\"|r|cff00FF7F(%s)|r |cffFF7F50is already exists.|r", k, type(a[k])))
			else
				a[k] = b[k]
			end
		end
		return a
	end,
	
	-- a - b	补集
	Complement = function(a, b)
		local res = {}
		for k in pairs(a) do
			if not b[k] then
				res[k] = a[k]
			end
		end
		return res
	end,
	
	-- a * b	交集
	Intersection = function(a, b)
	
	end,
	
	-- a / b	子集
	Subset = function(a, b)
	
	end,
	
	Defaults = function(table, key)
		return key
	end,
}

M.metaMethods.__add = M.metaMethods.Union
M.metaMethods.__sub = M.metaMethods.Complement
M.metaMethods.__mul = M.metaMethods.Intersection
M.metaMethods.__div = M.metaMethods.Subset

setmetatable(M, M.metaMethods)
setmetatable(DB, M.metaMethods)
setmetatable(L, {__index = M.metaMethods.Defaults})