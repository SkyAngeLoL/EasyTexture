Easy Texture
======

Easy work with textures in one file

#### Example:
```lua

/*
	This texture have size 256x256
	and one icon have size 128x64
*/
local Texture = "sprites/w_icons2"  // Testing textures
local mat = Material(Texture) // Create material for default draw
local Icons = {} // Table for draw functions 
/*
	Cutting icons:
*/
for j = 0, 1 do // for push right
	for i = 0, 3 do // push down
		local x = 128 * j // 0 | 128
		local y = 64 * i // 0 | 64 | 128 | 256
		local DrawFunction = easytex.CreateTexture(x, y, 128, 64, Texture) // Magic 
		table.insert(Icons, DrawFunction)
	end
end
/*
  Draw to screen
*/
hook.Add("HUDPaint","test",function()
	/* 
		Draw full texture for comparison 
	*/
	surface.SetDrawColor(color_white) surface.SetMaterial(mat)
	surface.DrawTexturedRect(10, 50, 256, 256) 
	/* 
		Drawing all icons in turn
	*/
	for n, icon in pairs(Icons) do
		icon(286, (n * 70) - 20, 128, 64)
	end
	
end)
