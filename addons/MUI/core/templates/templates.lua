-------------------------------------------
-- MUI
-- Templates
-------------------------------------------

local M, DB, L = unpack(select(2, ...))

M.Templates = setmetatable({}, M.metaMethods)

local function SetProperty(template, property)
	local object = M.Templates[strlower(template)](property)
	
	for k, v in pairs(property) do
		object[k] = v
	end

	return object
end

function M:Create(template)
	return function(property)
		return SetProperty(template, property)
	end
end