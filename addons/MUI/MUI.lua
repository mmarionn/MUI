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

local metaMethods = {
	-- a + b	并集
	Union = function(a, b)
		for k in pairs(b) do
			if a[k] then
				a["COPY_"..k] = b[k]
				print(format("|cffFF7F50Try to call mt.__add, but the|r value |cff87CEEBIndex=\"%s\"|r|cff00FF7F(%s)|r |cffFF7F50is already exists.|r", k, type(a[k])))
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

for i = 1, 3 do
	nameSpace[i].mt = {}
	setmetatable(nameSpace[i], nameSpace[i].mt)
	nameSpace[i].mt.__add = metaMethods.Union
	nameSpace[i].mt.__sub = metaMethods.Complement
	nameSpace[i].mt.__mul = metaMethods.Intersection
	nameSpace[i].mt.__div = metaMethods.Subset
end
L.mt.__index= metaMethods.Defaults