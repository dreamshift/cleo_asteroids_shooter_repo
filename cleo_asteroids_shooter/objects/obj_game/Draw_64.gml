if not instance_exists(obj_player)
{
	draw_text(20,20,"ESC to restart the game")
	if keyboard_check(vk_escape)
	{
		game_restart()
	}
}

if global.game_start_cooldown = true
{
	draw_text(288,220,"Pressing any mouse button will start the game and hide the tips.")
	if mouse_check_button_pressed(mb_left) or mouse_check_button_pressed(mb_right)
	{
		global.game_start_cooldown = false
		alarm[1] = 1
	}
}
else
{
	draw_text(940,20,"wave number")
	draw_text(940,40,wave_number)
	draw_text(940,60,"wave description")
	draw_text(940,80,chosen_wave.desc)
	draw_text(940,100,"wave time remaining")
	draw_text(940,120,round(alarm[1]/60))
}