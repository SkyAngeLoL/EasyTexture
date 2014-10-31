--[[=========================================================

Made by SkyAngeLoL

It 70% of copy GWEN module

:3

Used for cutting .png .bmp .jpg and other image types.

=========================================================]]--
MsgC(Color(0, 255, 0), "[GLua+] ") MsgC(Color(200, 200, 200), "easytex.lua\n")

easytex = {}

if SERVER then AddCSLuaFile() return end

local DrawTexRect = surface.DrawTexturedRectUV
local SetDrawColor = surface.SetDrawColor
local SetMaterial = surface.SetMaterial

--[[================
	Cut rect
================]]--

function easytex.CreateTexture(_x, _y, _w, _h, _material)
	_material = Material(_material)
	
	local tex = _material:GetTexture("$basetexture")
	
	_x = _x / tex:Width()
	_y = _y / tex:Height()
	_w = _w / tex:Width()
	_h = _h / tex:Height()
		
	return function(x, y, w, h, col)
		
		SetMaterial(_material)
		SetDrawColor(col or color_white)
		DrawTexRect(x, y, w, h, _x, _y, _x + _w, _y + _h)
		
	end
end

--[[======================
	Cut border rect
======================]]--

function easytex.CreateTextureBorder(_x, _y, _w, _h, _material, l, t, r, b)
	_material = Material(_material)
	
	local tex = _material:GetTexture("$basetexture")
	
	_x = _x / tex:Width()
	_y = _y / tex:Height()
	_w = _w / tex:Width()
	_h = _h / tex:Height()
	
	l = l or 8
	t = t or l
	r = r or l
	b = b or l
	
	local _l = l / tex:Width()
	local _t = t / tex:Height()
	local _r = r / tex:Width()
	local _b = b / tex:Height()
	
	return function(x, y, w, h, col)
		
		SetMaterial(_material)
		SetDrawColor(col or color_white)
		// Up
		DrawTexRect(x, y, l, t, _x, _y, _x + _l, _y + _t)
		DrawTexRect(x + l, y, w - l - r, t, _x + _l, _y, _x + _w - _l - _r, _y + _t)
		DrawTexRect(x + w - r, y, r, t, _x + _w - _r, _y, _x + _w, _y + _t)
		// Center
		DrawTexRect(x + l, y + t, w - l - r, h - t - b, _x + _l, _y + _t, _x + _w - _r, _y + _h - _b)
		DrawTexRect(x, y + t, l, h - t - b, _x, _y + _t, _x + _l, _y + _h - _b)
		DrawTexRect(x + w - r, y + t, r, h - t - b, _x + _w-_r, _y + _t, _x + _w, _y + _h - _b)
		// Bottom
		DrawTexRect(x, y + h - b, l, b, _x, _y + _h - _b, _x + _l, _y + _h)
		DrawTexRect(x + l, y + h - b, w - l - r, b, _x + _l, _y + _h-_b, _x + _w - _l - _r, _y + _h)
		DrawTexRect(x + w - r, y + h - b, r, b, _x + _w - _r, _y + _h - _b, _x + _w, _y + _h)
	
	end
end

--[[========================
	Cut centered rect
========================]]--

function easytex.CreateTextureCentered(_x, _y, _w, _h, _material)
	_material = Material(_material)
	
	local tex = _material:GetTexture("$basetexture")
	
	local width = _w
	local height = _h
	
	_x = _x / tex:Width()
	_y = _y / tex:Height()
	_w = _w / tex:Width()
	_h = _h / tex:Height()
		
	return function(x, y, w, h, col)
		
		x = x + (w - width) * 0.5
		y = y + (h - height) * 0.5
		w = width
		h = height
		
		SetMaterial(_material)
		SetDrawColor(col or color_white)
		DrawTexRect(x, y, w, h, _x, _y, _x + _w, _y + _h)

	end
end

--[[========================
	Return pixel color
========================]]--

function easytex.GetTextureColor(x, y, _material)
	local mat = Material(_material)
	return mat:GetColor(x, y)
end
