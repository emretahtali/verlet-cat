scale = 32;

image_xscale = scale * .05;
image_yscale = scale * .05;

point_count = 20;

length = scale * .5;
grav = scale * .1;
fric = .99;
base_x = room_width / 2;
base_y = 64 * 27;

pinstate = 0;

base_angle = .5;

#region points

points = ds_list_create();

ds_list_add(points, ds_map_create());
ds_map_add(points[|0 ], "x", base_x);
ds_map_add(points[|0 ], "y", base_y);
ds_map_add(points[|0 ], "oldx", base_x);
ds_map_add(points[|0 ], "oldy", base_y);
ds_map_add(points[|0 ], "vx", 0);
ds_map_add(points[|0 ], "vy", 0);
ds_map_add(points[|0 ], "addvx", 0);
ds_map_add(points[|0 ], "addvy", 0);
ds_map_add(points[|0 ], "pinned", true);

for (var i = 1; i < point_count; i ++)
{
	ds_list_add(points, ds_map_create());
	ds_map_add(points[|i ], "x", base_x);
	ds_map_add(points[|i ], "y", base_y + length * i);
	ds_map_add(points[|i ], "oldx", base_x);
	ds_map_add(points[|i ], "oldy", base_y + length * i);
	ds_map_add(points[|i ], "vx", 0);
	ds_map_add(points[|i ], "vy", 0);
	ds_map_add(points[|i ], "addvx", 0);
	ds_map_add(points[|i ], "addvy", 0);
	ds_map_add(points[|i ], "pinned", false);
}

#endregion

#region lines

lines = ds_list_create();

for (var i = 0; i < ds_list_size(points) - 1; i ++)
{
	ds_list_add(lines, ds_map_create());
	ds_map_add(lines[|i], "p1", points[|i]);
	ds_map_add(lines[|i], "p2", points[|i + 1]);
}

#endregion