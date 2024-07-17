if (keyboard_check(vk_control))
{
	//if (keyboard_check_pressed(ord("R"))) room_restart();
	if (keyboard_check_pressed(ord("F"))) window_set_fullscreen(!window_get_fullscreen());
	//if (keyboard_check_pressed(ord("G"))) game_restart();
	//if (keyboard_check_pressed(ord("P"))) room_speed = 62 - room_speed;
}
if (keyboard_check_pressed(vk_escape)) game_end();