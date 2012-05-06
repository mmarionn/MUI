-------------------------------------------
-- MUI
-- API-1
-------------------------------------------

local M, DB, L = unpack(select(2, ...))

local function Size(obj, width, height)
	obj:SetSize(M.scale(width), M.scale(height or width))
end

local function Width(obj, width)
	obj:SetWidth(M.scale(width))
end

local function Height(obj, height)
	obj:SetHeight(M.scale(height))
end

local function Point(obj, arg1, arg2, arg3, arg4, arg5)
	-- anyone has a more elegant way for this?
	if type(arg1)=="number" then arg1 = M.scale(arg1) end
	if type(arg2)=="number" then arg2 = M.scale(arg2) end
	if type(arg3)=="number" then arg3 = M.scale(arg3) end
	if type(arg4)=="number" then arg4 = M.scale(arg4) end
	if type(arg5)=="number" then arg5 = M.scale(arg5) end

	obj:SetPoint(arg1, arg2, arg3, arg4, arg5)
end

local function CreateBackdropBorder(object)
	object:SetBackdrop({
		edgeFile = M.texture.."blank.tga", 
		edgeSize = M.mult,
		insets = { left = M.mult, right = M.mult, top = M.mult, bottom = M.mult }
	})
	local r, g, b = unpack(DB.DefaultOptions.GlobalOptions.BorderColor)
	if DB.DefaultOptions.GlobalOptions.ClassColor then
		color = RAID_CLASS_COLORS[M.myClass]
		r, g, b = color.r, color.g, color.b
	end
	object:SetBackdropBorderColor(r, g, b, .4)
end

local function CreateShadow(object, b, a)
	if object.shadow then return end
	local alpha = not b and 0 or ( b and a or .85 )
	local shadow = CreateFrame("Frame", nil, object)
	shadow:Point("TOPLEFT", -4, 4)
	shadow:Point("BOTTOMRIGHT", 4, -4)
	shadow:SetFrameLevel(0)
	shadow:SetFrameStrata(object:GetFrameStrata())
	shadow:SetBackdrop({ 
		bgFile =   "Interface\\Buttons\\WHITE8x8",
		edgeFile = M.texture.."Shadow.tga",
		edgeSize = M.scale(4),
		insets = { left = M.scale(3), right = M.scale(3), top = M.scale(3), bottom = M.scale(3) }
	})
	local r, g, b = unpack(DB.DefaultOptions.GlobalOptions.BackdropColor) 
	shadow:SetBackdropColor(r, g, b, alpha)
	shadow:SetBackdropBorderColor(0, 0, 0, 1)
	object.shadow = shadow
	return shadow
end

local function SetTemplate(object, b, a)
	object:CreateBackdropBorder()
	object:CreateShadow(b, a)
end

local function StripTextures(object, kill)
	for i = 1, object:GetNumRegions() do
		local region = select(i, object:GetRegions())
		if region:GetObjectType() == "Texture" then
			if kill then
				region:Kill()
			else
				region:SetTexture(nil)
			end
		end
	end		
end

local function Kill(object)
	if object.IsProtected then 
		if object:IsProtected() then
			error("Attempted to kill a protected object: <"..object:GetName()..">")
		end
	end
	if object.UnregisterAllEvents then
		object:UnregisterAllEvents()
	end
	object.Show = M.noop
	object:Hide()
end

-------------------------------------------
-- Add API
-------------------------------------------
local function addapi(object)
	local mt = getmetatable(object).__index
	if not object.Width then mt.Width = Width end
	if not object.Height then mt.Height = Height end
	if not object.Size then mt.Size = Size end
	if not object.Point then mt.Point = Point end
	if not object.CreateBackdropBorder then mt.CreateBackdropBorder = CreateBackdropBorder end
	if not object.CreateShadow then mt.CreateShadow = CreateShadow end
	if not object.SetTemplate then mt.SetTemplate = SetTemplate end
	if not object.StripTextures then mt.StripTextures = StripTextures end
	if not object.Kill then mt.Kill = Kill end
end

local handled = {["Frame"] = true}
local object = CreateFrame("Frame")
addapi(object)
addapi(object:CreateTexture())
addapi(object:CreateFontString())

object = EnumerateFrames()
while object do
	if not handled[object:GetObjectType()] then
		addapi(object)
		handled[object:GetObjectType()] = true
	end
	object = EnumerateFrames(object)
end