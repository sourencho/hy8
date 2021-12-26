pico-8 cartridge // http://www.pico-8.com
version 34
__lua__

-- original font hypix by Davit Saroyan
-- https://fonter.am/en/fonts/hypix

-- load font
poke(0x5600,unpack(split"6,6,6,10,10,126,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63,63,63,63,63,63,63,0,0,0,63,63,63,0,0,0,0,0,63,51,63,0,0,0,0,0,51,12,51,0,0,0,0,0,51,0,51,0,0,0,0,0,51,51,51,0,0,0,0,48,60,63,60,48,0,0,0,3,15,63,15,3,0,0,62,6,6,6,6,0,0,0,0,0,48,48,48,48,62,0,99,54,28,62,8,62,8,0,0,0,0,24,0,0,0,0,0,0,0,0,0,12,24,0,0,0,0,0,0,12,12,0,0,0,10,10,0,0,0,0,0,4,10,4,0,0,0,0,0,0,0,0,0,0,0,0,12,12,12,12,12,0,12,0,0,54,54,0,0,0,0,0,0,54,127,54,54,127,54,0,8,62,11,62,104,62,8,0,0,51,24,12,6,51,0,0,14,27,27,110,59,59,110,0,12,12,0,0,0,0,0,0,24,12,6,6,6,12,24,0,12,24,48,48,48,24,12,0,0,54,28,127,28,54,0,0,0,12,12,63,12,12,0,0,0,0,0,0,0,12,12,6,6,5,14,20,15,0,0,0,0,0,0,0,0,12,12,0,6,9,9,9,6,0,0,0,62,99,115,107,103,99,62,0,24,28,24,24,24,24,60,0,63,96,96,62,3,3,127,0,63,96,96,60,96,96,63,0,51,51,51,126,48,48,48,0,127,3,3,63,96,96,63,0,62,3,3,63,99,99,62,0,127,96,48,24,12,12,12,0,62,99,99,62,99,99,62,0,62,99,99,126,96,96,62,0,0,0,12,0,0,12,0,0,12,18,26,7,2,0,0,0,48,24,12,6,12,24,48,0,0,0,30,0,30,0,0,0,6,12,24,48,24,12,6,0,30,51,48,24,12,0,12,0,0,30,51,59,59,3,30,0,9,9,9,9,22,0,0,0,6,9,1,7,1,0,0,0,6,9,9,30,8,0,0,0,6,9,9,24,8,0,0,0,1,7,1,9,6,0,0,0,6,9,8,5,15,0,0,0,1,7,1,1,7,0,0,0,6,9,1,1,14,0,0,0,6,9,29,13,1,0,0,0,8,30,9,9,6,0,0,0,1,7,9,1,1,0,0,0,1,1,1,1,7,0,0,0,1,23,21,9,1,0,0,0,9,6,9,9,6,0,0,0,1,9,9,14,8,0,0,0,7,8,6,8,8,0,0,0,7,8,10,5,10,0,0,0,6,9,8,8,24,0,0,0,12,2,31,18,12,0,0,0,25,9,9,9,6,0,0,0,7,8,6,8,7,0,0,0,3,2,18,18,12,0,0,0,4,6,9,1,14,0,0,0,6,9,9,9,9,0,0,0,7,8,13,2,4,0,0,0,14,21,20,16,16,0,0,0,6,9,10,4,11,0,0,0,6,9,9,25,9,0,0,0,9,9,9,9,6,0,0,0,8,9,9,14,24,0,0,0,9,21,21,21,18,0,0,0,6,9,9,1,1,0,0,0,9,9,9,9,22,0,0,0,6,9,1,7,1,0,0,0,6,9,9,30,8,0,0,0,6,9,9,24,8,0,0,0,1,7,1,9,6,0,0,0,6,9,8,5,15,0,0,0,1,7,1,1,7,0,0,0,9,9,9,9,22,0,0,0,9,9,9,9,22,0,0,0,9,9,9,9,22,0,0,0,9,9,9,9,22,0,0,0,9,9,9,9,22,0,0,0,9,9,9,9,22,0,0,0,9,9,9,9,22,0,0,0,9,9,9,9,22,0,0,0,9,9,9,9,22,0,0,0,9,9,9,9,22,0,0,0,9,9,9,9,22,0,0,0,9,9,9,9,22,0,0,0,9,9,9,9,22,0,0,0,9,9,9,9,22,0,0,0,9,9,9,9,22,0,0,0,9,9,9,9,22,0,0,0,9,9,9,9,22,0,0,0,9,9,9,9,22,0,0,0,9,9,9,9,22,0,0,0,2,7,8,9,6,0,0,0,6,9,9,9,9,0,0,0,1,1,3,1,1,0,0,0,4,14,21,14,4,0,0,0,0,0,0,0,0,0,0,0,127,127,127,127,127,127,127,0,85,42,85,42,85,42,85,0,65,99,127,93,93,119,62,0,62,99,99,119,62,65,62,0,17,68,17,68,17,68,17,0,4,12,124,62,31,24,16,0,28,38,95,95,127,62,28,0,34,119,127,127,62,28,8,0,42,28,54,119,54,28,42,0,28,28,62,93,28,20,20,0,8,28,62,127,62,42,58,0,62,103,99,103,62,65,62,0,62,127,93,93,127,99,62,0,24,120,8,8,8,15,7,0,62,99,107,99,62,65,62,0,8,20,42,93,42,20,8,0,0,0,0,85,0,0,0,0,62,115,99,115,62,65,62,0,8,28,127,28,54,34,0,0,127,34,20,8,20,34,127,0,62,119,99,99,62,65,62,0,0,10,4,0,80,32,0,0,17,42,68,0,17,42,68,0,62,107,119,107,62,65,62,0,127,0,127,0,127,0,127,0,85,85,85,85,85,85,85,0"))
-- set to default
poke(0x5f58,0x81)

-- alphabet
a = "ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`{}~;/-"

--display
cls()

function _draw()
	print("ABCDEFGHIJ",1,1)
	print("KLMNOPQRST",1,11)
	print("UVWXYZ[\\]^",1,21)
	print("_`{}~;/-",1,31)
end

__gfx__
