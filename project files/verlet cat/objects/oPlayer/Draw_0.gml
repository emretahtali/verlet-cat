draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color($6E55FA);
draw_set_alpha(1);

/*draw_set_color($22081C);
draw_set_alpha(.5);
draw_rectangle(x - sprite_width / 2 - 16, y - sprite_height / 2 - 16, x + sprite_width / 2 + 16, y + sprite_height / 2 + 16, false);
*/
//draw_self();

if (hsp != 0)
{
	dir = sign(hsp);
	if (vsp == 0) sprite_index = sPlayerR;
	else sprite_index = sPlayer;
}
else sprite_index = sPlayer;

draw_sprite_ext(sprite_index, image_index, x, y, (1 - ((1 - oPlayerHead.image_xscale) / 2)) * dir,  1 - ((1 - oPlayerHead.image_yscale) / 2), 0, c_white, 1);