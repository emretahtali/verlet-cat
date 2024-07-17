draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(font);


//draw_text_transformed(display_get_gui_width() / 2, display_get_gui_height() * .2, "verlet cat", .2, .2, 5);
draw_sprite_ext(sVerlet, 0, room_width / 2, 128 * 6, 3, 3, sin(rot) * 7, c_white, 1);

rot += .03;