frame += 1
// show_debug_message(frame)

if instance_number(obj_faction_enemy) = 0 and alarm[1] > 30
{
	if game_start_cooldown = false or wave_number > 0
	{
		alarm[1] = 30
	}
}

if keyboard_check_pressed(189) // minus/subtract key
{
	if keyboard_check(vk_control)
	{
		wave_number -= 10
	}
	else
	{
		wave_number -= 1
	}
}

if keyboard_check_pressed(187) // equals/addition key
{
	if keyboard_check(vk_control)
	{
		wave_number += 10
	}
	else
	{
		wave_number += 1
	}
}