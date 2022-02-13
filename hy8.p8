pico-8 cartridge // http://www.pico-8.com
version 34
__lua__
-- font snippet generator
-- by zep

--[[

 to make a font:

 1. choose a fixed size (below)
 2. draw as many characters as
    needed in the spritesheet
 3. run this program
 4. paste the snippet into your
    cartridge to use it

 -- output looks like this:
 -- poke(0x5600,unpack(split"8,8,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63,63,63,63,63,63,63,0,0,0,63,63,63,0,0,0,0,0,63,51,63,0,0,0,0,0,51,12,51,0,0,0,0,0,51,0,51,0,0,0,0,0,51,51,51,0,0,0,0,48,60,63,60,48,0,0,0,3,15,63,15,3,0,0,62,6,6,6,6,0,0,0,0,0,48,48,48,48,62,0,99,54,28,62,8,62,8,0,0,0,0,24,0,0,0,0,0,0,0,0,0,12,24,0,0,0,0,0,0,12,12,0,0,0,10,10,0,0,0,0,0,4,10,4,0,0,0,0,0,0,0,0,0,0,0,0,12,12,12,12,12,0,12,0,0,54,54,0,0,0,0,0,0,54,127,54,54,127,54,0,8,62,11,62,104,62,8,0,0,51,24,12,6,51,0,0,14,27,27,110,59,59,110,0,12,12,0,0,0,0,0,0,24,12,6,6,6,12,24,0,12,24,48,48,48,24,12,0,0,54,28,127,28,54,0,0,0,12,12,63,12,12,0,0,0,0,0,0,0,12,12,6,0,0,0,62,0,0,0,0,0,0,0,0,0,12,12,0,32,48,24,12,6,3,1,0,62,99,115,107,103,99,62,0,24,28,24,24,24,24,60,0,63,96,96,62,3,3,127,0,63,96,96,60,96,96,63,0,51,51,51,126,48,48,48,0,127,3,3,63,96,96,63,0,62,3,3,63,99,99,62,0,127,96,48,24,12,12,12,0,62,99,99,62,99,99,62,0,62,99,99,126,96,96,62,0,0,0,12,0,0,12,0,0,0,0,12,0,0,12,6,0,48,24,12,6,12,24,48,0,0,0,30,0,30,0,0,0,6,12,24,48,24,12,6,0,30,51,48,24,12,0,12,0,0,30,51,59,59,3,30,0,0,0,62,96,126,99,126,0,3,3,63,99,99,99,63,0,0,0,62,99,3,99,62,0,96,96,126,99,99,99,126,0,0,0,62,99,127,3,62,0,124,6,6,63,6,6,6,0,0,0,126,99,99,126,96,62,3,3,63,99,99,99,99,0,0,24,0,28,24,24,60,0,48,0,56,48,48,48,51,30,3,3,51,27,15,27,51,0,12,12,12,12,12,12,56,0,0,0,99,119,127,107,99,0,0,0,63,99,99,99,99,0,0,0,62,99,99,99,62,0,0,0,63,99,99,63,3,3,0,0,126,99,99,126,96,96,0,0,62,99,3,3,3,0,0,0,62,3,62,96,62,0,12,12,62,12,12,12,56,0,0,0,99,99,99,99,126,0,0,0,99,99,34,54,28,0,0,0,99,99,107,127,54,0,0,0,99,54,28,54,99,0,0,0,99,99,99,126,96,62,0,0,127,112,28,7,127,0,62,6,6,6,6,6,62,0,1,3,6,12,24,48,32,0,62,48,48,48,48,48,62,0,12,30,18,0,0,0,0,0,0,0,0,0,0,0,30,0,12,24,0,0,0,0,0,0,28,54,99,99,127,99,99,0,63,99,99,63,99,99,63,0,62,99,3,3,3,99,62,0,31,51,99,99,99,51,31,0,127,3,3,63,3,3,127,0,127,3,3,63,3,3,3,0,62,3,3,115,99,99,126,0,99,99,99,127,99,99,99,0,63,12,12,12,12,12,63,0,127,24,24,24,24,24,15,0,99,51,27,15,27,51,99,0,3,3,3,3,3,3,127,0,99,119,127,107,99,99,99,0,99,103,111,107,123,115,99,0,62,99,99,99,99,99,62,0,63,99,99,63,3,3,3,0,62,99,99,99,99,51,110,0,63,99,99,63,27,51,99,0,62,99,3,62,96,99,62,0,63,12,12,12,12,12,12,0,99,99,99,99,99,99,62,0,99,99,99,99,54,28,8,0,99,99,99,107,127,119,99,0,99,99,54,28,54,99,99,0,99,99,99,126,96,96,63,0,127,96,48,28,6,3,127,0,56,12,12,7,12,12,56,0,8,8,8,0,8,8,8,0,14,24,24,112,24,24,14,0,0,0,110,59,0,0,0,0"))

 -- you can then use it with:
 -- print"\14 alt font!"
 
 -- or: poke(0x5f58,0x81) to
 -- always print with the alt
 -- font

]]

-- size of character (width2
-- is user for chr >= 128)
char_width    = 6
char_width2   = 6
char_height   = 8

-- draw offset
char_offset_x = 10
char_offset_y = 10

function _init()
	memset(0x5600,0,0x800)
	local s=load_from_sprites()
	printh(s,"@clip")
end


function _draw()
cls(1)

poke(0x5f58,0x81)
color(7)
?""
?"abcdefghijklmno"
?"pqrstuvwxyz230-"
?"=,./;'[]"
?""
?"ABCDEFGHIJKLMNO"
?"PQRSTUVWXYZ@#)_"
?"+<>?:\"{}"
poke(0x5f58,0)
color(13)
print(" [snippet copied to clipboard]",0,120)
cursor()

end

function load_from_sprites()
	
	--find maximum sprite index
	--(look for any set pixel)
	maxi=0
	for i=0,255 do
	 local x0=(i%16)*8
	 local y0=(i\16)*8
	  for y=0,7 do
	 	 for x=0,7 do
	 	  if(sget(x0+x,y0+y)>0) maxi=i
	 	 end
	 	end
	end
	
	-- grab bits from each sprite
	for i=0,maxi do
	
	 local x0=(i%16)*8
	 local y0=(i\16)*8
	
	 for y=0,7 do
	 	local val=0
	 	for x=0,7 do
	 	 if sget(x0+x,y0+y)>0 then
	 	  val |= (1<<x)
	 	 end
	 	end
	 	poke(0x5600+i*8+y,val)
	 	
	 end
	
	end
	
	-- font attributes are stored
	-- in character 0
	poke(0x5600,
	 char_width,
	 char_width2,
	 char_height,
	 char_offset_x,
	 char_offset_y)
	
	-- generate string
	local str="poke(0x5600,unpack(split\""
	
	for i=0,maxi*8+7 do
		str..= peek(0x5600+i)
		if (i<maxi*8+7) str..=","
	end
	
	return str.."\"))"
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07070700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07070700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77777700000000000000000000000000000000000000000000000000000000000777770000000000770007700000000000000000000000000000000000000000
77777700000000000000000000000000000000000000000000007700770000000770000000000000077077000000000000000000000000000000000000700000
77777700777777007777770077007700770077007700770000777700777700000770000000007700007770000000000000000000000000000707000007070000
77777700777777007700770000770000000000007700770077777700777777000770000000007700077777000007700000000000000000000707000000700000
77777700777777007777770077007700770077007700770000777700777700000770000000007700000700000000000000000000000000000000000000000000
77777700000000000000000000000000000000000000000000007700770000000000000000007700077777000000000000770000007700000000000000000000
77777700000000000000000000000000000000000000000000000000000000000000000007777700000700000000000000077000007700000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007700000070000000000000000700000000000007770000007000000007700000000000000000000070000000700000077000000770000070070000
00000000007700000070000000000000077777007700770077077000077700000077000000000000077077000070000007700000700700007007000007700000
00000000007700007077000007000000770700000007700077077000707070000770000007000000007770000777000070070000700700007007000070070000
00000000007700007070700007000000077777000077000007770770077700000770000070700000777777707070000070000000700770000007000070070000
00000000007700000770700007000000000707700770000077077700007000000770000007000000007770000700000007770000700700000007700007700000
00000000000000000070000007000000077777007700770077077700000000000077000000000000077077000000000000000000000000000000000000000000
00000000007700000070000070000000000700000000000007770770000000000007700000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07700000000770007770000077700000770077007777777007777700777777700777770007777700000000000770000000000000000700000000000007000000
70070000007770000007000000070000770077007700000077000000000007707700077077000770000000007007000000000000077770000000000000700000
70070000000770000707000007700000770077007700000077000000000077007700077077000770070000007077700077000000700700000700000007770000
70070000000770007070000000070000077777707777770077777700000770000777770007777770707000007077000000700000700700007070000070700000
07700000000770000707000077700000000077000000077077000770007700007700077000000770707700007000000007000000077000007070000007000000
00000000000770000000000000000000000077000000077077000770007700007700077000000770707000000000000070000000000000000070000000000000
00000000007777000000000000000000000077007777770007777700007700000777770007777700700000000000000077700000000000000077000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000007000000007700000700000007000000070000000007000000000000000000000007700007700000000000000
00000000000000000000000000000000000000007700000070700000700000007000000070000000070000000000000000000000007000000700000000000000
77000000700070007070700007000000707700007000000007770000707000007700000077000000777000000070000070000000707000000707000007000000
00700000707070007070700070700000707070007070000000707000707000007070000070700000070700000707000070000000707000000707000070700000
07000000070700000707700007700000077070000700000007770000077000007070000070700000007000000700000070000000070000000070000070700000
00700000000000000000700000770000000000000000000000700000007000000000000070000000000000007770000070000000000000000000000000000000
07000000000000000000700000700000000000000000000000700000007000000000000070000000000000000700000077000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000700000000000000000000000000000000000000000000000007000000000000070000000000000007770000070000000077000000077000000000000
00000000700000000000000000000000000000000000000000000000007000000000000077000000000000000007000077000000700700000777700000000000
07000000770070000700000070700000070000000700000070000000707000007070000070000000070000007077000007700000070700000700700007000000
70700000707070007070000070700000707000007070000070000000707000007070000070700000707000000700000000770000007000000000000070770000
70000000707700007070000007000000707000007070000077000000077000000770000007000000077000000070000000077000770700000000000070700000
77000000700000007000000000000000007700007000000000000000007000000070000000000000007000000000000000007700000000000000000000000000
70000000700000007000000000000000007000007770000000000000007700007700000000000000007700000000000000000700000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00770000700700000777000007700000700700007000000007700000700000007770000070000000007700000077000070000000700770007700000007700000
00077000700700007070700070070000707070007770000070700000700700000007000077700000070000000700700070000000700700000700000070070000
00000000700700000070700070070000707070007000000007770000700700000770000070070000777770000707700070000000700700000700700070070000
00000000700700000000700007777000707070007000000000707000077700000007000070000000070070007770000070000000700700000700700070070000
00000000077070000000700000070000070070007770000077770000000700000007000070000000007700000700000077700000077000000077000070070000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07700000700000000770000070070000077000000770000070000000000700000700000070000000077000000000000000070000000000000000000000000000
70070000777070007007000070070000700700007007000070000000700700007770000077700000700700000000000000070000000000000000000000000000
70000000707070007007000070070000700700007000000077000000700700000007000070000000000700007000000000070000070000000777077000000000
77700000700700007000000070070000000770007000000070000000077700007007000070070000707000000700000000000000707000007707770000000000
70000000700000007000000007700000000700000777000070000000000770000770000007700000777700000700000000070000070000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000700000000070000700000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000770000000070000777000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77777770707070707000007007777700700070000070000000777000070007000707070000777000000700000777770007777700000770000777770000070000
77777770070707007700077077000770007000700077000007700700777077700077700000777000007770007770077077777770000777707700077000707000
77777770707070707777777077000770700070000077777077777070777777700770770007777700077777007700077070777070000700007707077007070700
77777770070707007077707077707770007000700777770077777070777777707770777070777070777777707770077070777070000700007700077070777070
77777770707070707077707007777700700070007777700077777770077777000770770000777000077777000777770077777770000700000777770007070700
77777770070707007770777070000070007000700007700007777700007770000077700000707000070707007000007077000770777700007000007000707000
77777770707070700777770007777700700070000000700000777000000700000707070000707000070777000777770007777700777000000777770000070000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077777000007000077777770077777000000000070007000077777007777777070707070000000000000000000000000000000000000000000000000
00000000770077700077700007000700777077700707000007070700770707700000000070707070000000000000000000000000000000000000000000000000
00000000770007707777777000707000770007700070000000700070777077707777777070707070000000000000000000000000000000000000000000000000
70707070770077700077700000070000770007700000000000000000770707700000000070707070000000000000000000000000000000000000000000000000
00000000077777000770770000707000077777000000707070007000077777007777777070707070000000000000000000000000000000000000000000000000
00000000700000700700070007000700700000700000070007070700700000700000000070707070000000000000000000000000000000000000000000000000
00000000077777000000000077777770077777000000000000700070077777007777777070707070000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000007700000000000000000007700000000000777770000000007700000000000000000077007700000000770000000000000000000000000000
07777000000000007700000000000000000007700000000007700000000000007700000000077000000000007700000000770000000000000000000000000000
77007700077777007777770007777700077777700777770007700000077777707777770000000000000777007700770000770000770007707777770007777700
77077700000007707700077077000770770007707700077077777700770007707700077000777000000077007707700000770000777077707700077077000770
77077700077777707700077077000000770007707777777007700000770007707700077000077000000077007777000000770000777777707700077077000770
77000000770007707700077077000770770007707700000007700000077777707700077000077000000077007707700000770000770707707700077077000770
07777000077777707777770007777700077777700777770007700000000007707700077000777700770077007700770000077700770007707700077007777700
00000000000000000000000000000000000000000000000000000000077777000000000000000000077770000000000000000000000000000000000000000000
00000000000000000000000000000000007700000000000000000000000000000000000000000000000000000777770070000000077777000077000000000000
00000000000000000000000000000000007700000000000000000000000000000000000000000000000000000770000077000000000077000777700000000000
77777700077777700777770007777700077777007700077077000770770007707700077077000770777777700770000007700000000077000700700000000000
77000770770007707700077077000000007700007700077077000770770007700770770077000770000077700770000000770000000077000000000000000000
77000770770007707700000007777700007700007700077007000700770707700077700077000770007770000770000000077000000077000000000000000000
77777700077777707700000000000770007700007700077007707700777777700770770007777770777000000770000000007700000077000000000000000000
77000000000007707700000007777700000777000777777000777000077077007700077000000770777777700777770000000700077777000000000007777000
77000000000007700000000000000000000000000000000000000000000000000000000007777700000000000000000000000000000000000000000000000000
00770000007770007777770007777700777770007777777077777770077777007700077077777700777777707700077077000000770007707700077007777700
00077000077077007700077077000770770077007700000077000000770000007700077000770000000770007700770077000000777077707770077077000770
00000000770007707700077077000000770007707700000077000000770000007700077000770000000770007707700077000000777777707777077077000770
00000000770007707777770077000000770007707777770077777700770077707777777000770000000770007777000077000000770707707707077077000770
00000000777777707700077077000000770007707700000077000000770007707700077000770000000770007707700077000000770007707707777077000770
00000000770007707700077077000770770077007700000077000000770007707700077000770000000770007700770077000000770007707700777077000770
00000000770007707777770007777700777770007777777077000000077777707700077077777700777700007700077077777770770007707700077007777700
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77777700077777007777770007777700777777007700077077000770770007707700077077000770777777700007770000070000077700000000000000000000
77000770770007707700077077000770007700007700077077000770770007707700077077000770000007700077000000070000000770000000000000000000
77000770770007707700077077000000007700007700077077000770770007700770770077000770000077000077000000070000000770000777077000000000
77777700770007707777770007777700007700007700077077000770770707700077700007777770007770007770000000000000000077707707770000000000
77000000770007707707700000000770007700007700077007707700777777700770770000000770077000000077000000070000000770000000000000000000
77000000770077007700770077000770007700007700077000777000777077707700077000000770770000000077000000070000000770000000000000000000
77000000077707707700077007777700007700000777770000070000770007707700077077777700777777700007770000070000077700000000000000000000
__label__
77777711771117717777777111111111177777117711177177777711177777117711177111111111777777117777771117777711771117717711177111111111
11771111771117717711111111111111771117717711177111771111771117717711771111111111771117717711177177111771771117717771177111111111
11771111771117717711111111111111771117717711177111771111771111117717711111111111771117717711177177111771771117717777177111111111
11771111777777717777771111111111771117717711177111771111771111117777111111111111777777117777771177111771771717717717177111111111
11771111771117717711111111111111771117717711177111771111771111117717711111111111771117717717711177111771777777717717777111111111
11771111771117717711111111111111771177117711177111771111771117717711771111111111771117717711771177111771777177717711777111111111
11771111771117717777777111111111177717711777771177777711177777117711177111111111777777117711177117777711771117717711177111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
77777771177777117711177111111111777777717711177177111771777777111777771111111111177777117711177177777771777777111111111111111111
77111111771117717711177111111111111771117711177177717771771117717711177111111111771117717711177177111111771117711111111111111111
77111111771117711771771111111111111771117711177177777771771117717711111111111111771117717711177177111111771117711111111111111111
77777711771117711177711111111111111771117711177177171771777777111777771111111111771117717711177177777711777777111111111111111111
77111111771117711771771111111111111771117711177177111771771111111111177111111111771117711771771177111111771771111111111111111111
77111111771117717711177111111111111771117711177177111771771111117711177111111111771117711177711177111111771177111111111111111111
77111111177777117711177111111111777711111777771177111771771111111777771111111111177777111117111177777771771117711111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
77777711771117717777777111111111771111111177711177777771771117711111111177777111177777111777771111111111111111111111111111111111
11771111771117717711111111111111771111111771771111111771771117711111111177117711771117717711111111111111111111111111111111111111
11771111771117717711111111111111771111117711177111117711771117711111111177111771771117717711111111111111111111111111111111111111
11771111777777717777771111111111771111117711177111777111177777711111111177111771771117717711777111111111111111111111111111111111
11771111771117717711111111111111771111117777777117711111111117711111111177111771771117717711177111111111111111111111111111111111
11771111771117717711111111111111771111117711177177111111111117711111111177117711771117717711177111771111111111111111111111111111
11771111771117717777777111111111777777717711177177777771777777111111111177777111177777111777777111771111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11771111771111111111111111111111111111111111111111111111111111117711111111111111771111111111111111111111111111111111111111111111
11771111771111111111111111111111111111111111111111177111111111117711111111111111771111111111111111111111111111111111111111111111
17777711777777111777771111111111177777717711177111111111177777117711771111111111777777111777771117777711771117717777771111111111
11771111771117717711177111111111771117717711177111777111771117717717711111111111771117717711177177111771771117717711177111111111
11771111771117717777777111111111771117717711177111177111771111117777111111111111771117717711111177111771771717717711177111111111
11771111771117717711111111111111177777717711177111177111771117717717711111111111771117717711111177111771777777717711177111111111
11177711771117711777771111111111111117711777777111777711177777117711771111111111777777117711111117777711177177117711177111111111
11111111111111111111111111111111111117711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11777771111111111111111111111111111177111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
17711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
17711111177777117711177111111111111777117711177177111771777777111777771111111111177777117711177117777711177777111111111111111111
77777711771117711771771111111111111177117711177177717771771117717711111111111111771117717711177177111771771117711111111111111111
17711111771117711177711111111111111177117711177177777771771117711777771111111111771117711711171177777771771111111111111111111111
17711111771117711771771111111111111177117711177177171771777777111111177111111111771117711771771177111111771111111111111111111111
17711111177777117711177111111111771177111777777177111771771111111777771111111111177777111177711117777711771111111111111111111111
11111111111111111111111111111111177771111111111111111111771111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11771111771111111111111111111111117711111111111111111111111111111111111111111771111111111111111117777111111111111111111111111111
11771111771111111111111111111111117711111111111111111111111111111111111111111771111111111111111177117711111111111111111111111111
17777711777777111777771111111111117711111777771177777771771117711111111117777771177777111777777111117711111111111111111111111111
11771111771117717711177111111111117711111111177111117771771117711111111177111771771117717711177111177111111111111111111111111111
11771111771117717777777111111111117711111777777111777111771117711111111177111771771117717711177111771111111111111111111111111111
11771111771117717711111111111111117711117711177177711111177777711111111177111771771117711777777111111111111111111111111111111111
11177711771117711777771111111111111777111777777177777771111117711111111117777771177777111111177111771111111111111111111111111111
11111111111111111111111111111111111111111111111111111111177777111111111111111111111111111777771111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
17777711111771117777771177777711771177117777777117777711777777711777771117777711111111111111111111111111111111111111171111111111
77111771117771111111177111111771771177117711111177111111111117717711177177111771111111111177111111111111177177111111771111111111
77117771111771111111177111111771771177117711111177111111111177117711177177111771111111111177111111111111117771111117711111111111
77171771111771111777771111777711177777717777771177777711111771111777771117777771111111117777771117777711777777711177111111111111
77711771111771117711111111111771111177111111177177111771117711117711177111111771111111111177111111111111117771111771111111111111
77111771111771117711111111111771111177111111177177111771117711117711177111111771111111111177111111111111177177117711111111111111
17777711117777117777777177777711111177117777771117777711117711111777771117777711111111111111111111111111111111117111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
77777771717171717111117117777711711171111171111111777111171117111717171111777111111711111777771117777711111111111111111111111111
77777771171717117711177177111771117111711177111117711711777177711177711111777111117771117771177177777771111111111111111111111111
77777771717171717777777177111771711171111177777177777171777777711771771117777711177777117711177171777171111111111111111111111111
77777771171717117177717177717771117111711777771177777171777777717771777171777171777777717771177171777171111111111111111111111111
77777771717171717177717117777711711171117777711177777771177777111771771111777111177777111777771177777771111111111111111111111111
77777771171717117771777171111171117111711117711117777711117771111177711111717111171717117111117177111771111111111111111111111111
77777771717171711777771117777711711171111111711111777111111711111717171111717111171777111777771117777711111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11177111177777111117111111111111177777111117111177777771177777111111111171117111177777117777777171717171111111111111111111111111
11177771771117711171711111111111771177711177711117111711777177711717111117171711771717711111111171717171111111111111111111111111
11171111771717711717171111111111771117717777777111717111771117711171111111711171777177717777777171717171111111111111111111111111
11171111771117717177717171717171771177711177711111171111771117711111111111111111771717711111111171717171111111111111111111111111
11171111177777111717171111111111177777111771771111717111177777111111717171117111177777117777777171717171111111111111111111111111
77771111711111711171711111111111711111711711171117111711711111711111171117171711711111711111111171717171111111111111111111111111
77711111177777111117111111111111177777111111111177777771177777111111111111711171177777117777777171717171111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111dd111dd1dd11ddd1ddd1ddd1ddd1ddd111111dd11dd1ddd1ddd1ddd1dd111111ddd11dd111111dd1d111ddd1ddd1ddd11dd1ddd1ddd1dd111dd111111111
1111d111d111d1d11d11d1d1d1d1d1111d111111d111d1d1d1d11d11d111d1d111111d11d1d11111d111d1111d11d1d1d1d1d1d1d1d1d1d1d1d111d111111111
1111d111ddd1d1d11d11ddd1ddd1dd111d111111d111d1d1ddd11d11dd11d1d111111d11d1d11111d111d1111d11ddd1dd11d1d1ddd1dd11d1d111d111111111
1111d11111d1d1d11d11d111d111d1111d111111d111d1d1d1111d11d111d1d111111d11d1d11111d111d1111d11d111d1d1d1d1d1d1d1d1d1d111d111111111
1111dd11dd11d1d1ddd1d111d111ddd11d1111111dd1dd11d111ddd1ddd1ddd111111d11dd1111111dd1ddd1ddd1d111ddd1dd11d1d1d1d1ddd11dd111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111

