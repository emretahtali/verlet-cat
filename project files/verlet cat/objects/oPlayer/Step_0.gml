key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
key_right = keyboard_check(ord("D")) || gamepad_button_check(4, gp_padr) || (gamepad_axis_value(4, gp_axislh) > .5) || keyboard_check(vk_right);
key_down = keyboard_check(ord("S")) || gamepad_button_check(4, gp_padd) || (gamepad_axis_value(4, gp_axislv) > .5) || keyboard_check(vk_down);
key_left = keyboard_check(ord("A")) || gamepad_button_check(4, gp_padl) || (gamepad_axis_value(4, gp_axislh) < -.5) || keyboard_check(vk_left);

moveX = key_right - key_left;
hsp = moveX * walksp;
vsp += grv + (key_down * divesp);

#region Jump

if (key_up) && (canjump > 0)
{
	vsp = -jumpsp;
	canjump = 0;
}

#endregion

#region Wall Collisions

//Horizontal
if (place_meeting(x + hsp, y, oWall))
{
	while (!place_meeting(x + sign(hsp), y, oWall)) x += sign(hsp);
	hsp = 0;
}
x += hsp;

//Vertical
if (place_meeting(x, y + vsp, oWall))
{
	while (!place_meeting(x, y + sign(vsp), oWall)) y += sign(vsp);
	vsp = 0;
}
y += vsp;

#endregion

if (place_meeting(x, y + 1, oWall))
{
	canjump = 5;
}
else
{
	canjump --;
}

if (place_meeting(x, y, oVerlet))
{
	with (oVerlet)
	{		
		ds_map_set(points[|ds_list_size(points) - 1], "addvx", other.hsp);
		//ds_map_set(points[|ds_list_size(points) - 1], "addvy", other.vsp);
	}
}