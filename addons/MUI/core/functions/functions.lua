-------------------------------------------
-- MUI
-- Functions
-------------------------------------------

local M, DB, L = unpack(select(2, ...))

local format = format
local strsub = strsub
local tonumber = tonumber
local modf = math.modf

local mathFuncs = {

	--Return short value of a number
	ShortValue = function(v)
		if v >= 1e6 then
			return ("%.1fm"):format(v / 1e6):gsub("%.?0+([km])$", "%1")
		elseif v >= 1e3 or v <= -1e3 then
			return ("%.1fk"):format(v / 1e3):gsub("%.?0+([km])$", "%1")
		else
			return v
		end
	end,
	
	--Return rounded number
	Round = function(v, decimals)
		if not decimals then decimals = 0 end
		return (("%%.%df"):format(decimals)):format(v)
	end,
	
	--Truncate a number off to n places
	Truncate = function(v, decimals)
		if not decimals then decimals = 0 end
		return v - (v % (0.1 ^ decimals))
	end,
	
	--RGB to Hex
	RGBToHex = function(r, g, b)
		r = r <= 1 and r >= 0 and r or 0
		g = g <= 1 and g >= 0 and g or 0
		b = b <= 1 and b >= 0 and b or 0
		return string.format("|cff%02x%02x%02x", r*255, g*255, b*255)
	end,
	
	--Hex to RGB
	HexToRGB = function(hex)
		local rhex, ghex, bhex = strsub(hex, 1, 2), strsub(hex, 3, 4), strsub(hex, 5, 6)
		return tonumber(rhex, 16), tonumber(ghex, 16), tonumber(bhex, 16)
	end,
	
	--http://www.wowwiki.com/ColorGradient
	ColorGradient = function(perc, ...)
		-- Translate divison by zeros into 0, so we don't blow select.
		-- We check perc against itself because we rely on the fact that NaN can't equal NaN.
		if(perc ~= perc or perc == inf) then perc = 0 end

		if perc >= 1 then
			local r, g, b = select(select('#', ...) - 2, ...)
			return r, g, b
		elseif perc <= 0 then
			local r, g, b = ...
			return r, g, b
		end

		local num = select('#', ...) / 3
		local segment, relperc = modf(perc*(num-1))
		local r1, g1, b1, r2, g2, b2 = select((segment*3)+1, ...)

		return r1 + (r2-r1)*relperc, g1 + (g2-g1)*relperc, b1 + (b2-b1)*relperc
	end,
	
	GoldIcon = function(v)
		local gold = modf(v / 10000)
		local silver =	 modf((v - gold *10000) / 100)
		local copper = v - gold * 10000 - silver * 100
		local goldIcon = gold > 0 and (format(GOLD_AMOUNT_TEXTURE, gold, 0, 0)) or ""
		local silverIcon = silver > 0 and (format(SILVER_AMOUNT_TEXTURE, silver, 0, 0)) or ""
		local copperIcon = copper > 0 and (format(COPPER_AMOUNT_TEXTURE, copper, 0, 0)) or ""
		return goldIcon, silverIcon, copperIcon
	end,
	
}

M = M + mathFuncs