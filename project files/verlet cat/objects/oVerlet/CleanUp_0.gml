for (var i = 0; i < ds_list_size(points); i++)
{
	ds_map_destroy(points[|i]);
}

ds_list_destroy(points);

for (var i = 0; i < ds_list_size(lines); i++)
{
	ds_map_destroy(lines[|i]);
}

ds_list_destroy(lines);