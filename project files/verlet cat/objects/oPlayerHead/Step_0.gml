x = oPlayer.x;
y = oPlayer.y;

scaletrX =  (abs(oPlayer.vsp) / -112) + 1;
scaletrX = clamp(scaletrX, .5, 1);
scaletrY = 1;

if (oPlayer.vsp > 40) disval = oPlayer.vsp * 9;
else disval = 300;

if ((oPlayer.vsp > -24) && (oPlayer.vsp < 0)) || ((oPlayer.vsp > 32) && (collision_line(x, y, x, y + disval, oWall, false, true)))
{	
	scaletrX = 2;
	scaletrY = .5;
	val = 10;
	if (oPlayer.key_down) val = 2;
}
else val = 20;

if (abs(scaletrX - image_xscale) != .05) image_xscale += sign(scaletrX - image_xscale) / val;
else if (!oPlayer.vsp) image_xscale = 1;

scaletrY = clamp(scaletrY, .5, 1);
image_yscale += sign(scaletrY - image_yscale) / val;

image_xscale = clamp(image_xscale, .5, 1.3);
image_yscale = clamp(image_yscale, .5, 1);