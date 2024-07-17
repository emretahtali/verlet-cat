draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color($6E55FA);
draw_set_alpha(1);

/*for (var i = 0; i < ds_list_size(points); i++)
{
	var px = ds_map_find_value(points[|i], "x");
	var py = ds_map_find_value(points[|i], "y");
	
	draw_circle(px, py, scale, false);
}*/																		 


for (var i = 0; i < ds_list_size(lines); i++)
{
	var p1x = ds_map_find_value(ds_map_find_value(lines[|i], "p1"), "x");
	var p1y = ds_map_find_value(ds_map_find_value(lines[|i], "p1"), "y");
	
	var p2x = ds_map_find_value(ds_map_find_value(lines[|i], "p2"), "x");
	var p2y = ds_map_find_value(ds_map_find_value(lines[|i], "p2"), "y");
	
	draw_line_width(p1x, p1y, p2x, p2y, scale);
}

draw_self();

//debug
/*draw_circle(x, y, scale, false);

draw_set_halign(fa_left);

draw_text_transformed(30, 3 * scale, x, 5, 5, 0);
draw_text_transformed(30, 6 * scale, y, 5, 5, 0);