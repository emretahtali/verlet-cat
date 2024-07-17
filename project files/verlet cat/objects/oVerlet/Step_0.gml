if (mouse_check_button_pressed(mb_right))
{
	pinstate ++;
	if (pinstate > 2) pinstate = 0;
}

for (var i = 0; i < ds_list_size(points); i++)
{
	var px = ds_map_find_value(points[|i], "x");
	var py = ds_map_find_value(points[|i], "y");
	var poldx = ds_map_find_value(points[|i], "oldx");
	var poldy = ds_map_find_value(points[|i], "oldy");
	var vx = ds_map_find_value(points[|i], "vx");
	var vy = ds_map_find_value(points[|i], "vy");
	var addvx = ds_map_find_value(points[|i], "addvx");
	var addvy = ds_map_find_value(points[|i], "addvy");
	var pinned = ds_map_find_value(points[|i], "pinned");
	
	if (!pinned)
	{
		vx = px - poldx + addvx;
		vy = py - poldy + grav + addvy;
		
		addvx = 0;
		addvy = 0;
	
		poldx = px;
		poldy = py;
	
		px += vx * fric;
		py += vy * fric;
	}
	else
	{	
		vx = px - poldx;
		vy = py - poldy + grav;
		
		poldx = px;
		poldy = py;
		
		switch (pinstate)
		{
			case 0: default:
			{
				px = lerp(px, base_x, .8);
				py = lerp(py, base_y, .8);
				
				break;
			}
			case 1:
			{
				py = lerp(py, base_y, .8);
			
				px = base_x + sin(base_angle) * scale * 20;
		
				base_angle += .05;
				
				break;
			}
			case 2:
			{
				base_angle = 0;
		
				if (mouse_check_button(mb_left))
				{		
					px = lerp(px, mouse_x, .8);
					py = lerp(py, mouse_y, .8);
				}
				else
				{
					px += vx * fric;
					py += vy * fric;
				}
				
				break;
			}
		}
	}
	
	ds_map_set(points[|i ], "x", px);
	ds_map_set(points[|i ], "y", py);
	ds_map_set(points[|i ], "oldx", poldx);
	ds_map_set(points[|i ], "oldy", poldy);
	ds_map_set(points[|i ], "vx", vx);
	ds_map_set(points[|i ], "vy", vy);
	ds_map_set(points[|i ], "addvx", addvx);
	ds_map_set(points[|i ], "addvy", addvy);
}

for (var j = 0; j < 4; j ++)
{
	for (var i = 0; i < ds_list_size(lines); i++)
	{
		var p1x = ds_map_find_value(ds_map_find_value(lines[|i], "p1"), "x");
		var p1y = ds_map_find_value(ds_map_find_value(lines[|i], "p1"), "y");
		var p1pinned = ds_map_find_value(ds_map_find_value(lines[|i], "p1"), "pinned");
	
		var p2x = ds_map_find_value(ds_map_find_value(lines[|i], "p2"), "x");
		var p2y = ds_map_find_value(ds_map_find_value(lines[|i], "p2"), "y");
		var p2pinned = ds_map_find_value(ds_map_find_value(lines[|i], "p2"), "pinned");
	
		var dx = p2x - p1x;
		var dy = p2y - p1y;
	
		var distance = sqrt(sqr(dx) + sqr(dy));
		var difference = length - distance;
		var percent = difference / distance / 2;
	
		var offsetx = dx * percent;
		var offsety = dy * percent;
	
		if (p1pinned)
		{	
			if (!p2pinned)
			{
				p2x += offsetx * 2;
				p2y += offsety * 2;
			}
		}
	
		else if (p2pinned)
		{
			p1x -= offsetx * 2;
			p1y -= offsety * 2;
		}
		
		else
		{
			p1x -= offsetx;
			p1y -= offsety;
			p2x += offsetx;
			p2y += offsety;
		}
	
		ds_map_set(ds_map_find_value(lines[|i], "p1"), "x", p1x);
		ds_map_set(ds_map_find_value(lines[|i], "p1"), "y", p1y);
		ds_map_set(ds_map_find_value(lines[|i], "p2"), "x", p2x);
		ds_map_set(ds_map_find_value(lines[|i], "p2"), "y", p2y);
	}
}

x = ds_map_find_value(points[|ds_list_size(points) - 1], "x");
y = ds_map_find_value(points[|ds_list_size(points) - 1], "y");