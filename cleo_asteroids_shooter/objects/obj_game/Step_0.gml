frame += 1
// show_debug_message(frame)

if instance_number(obj_faction_enemy) = 0 and alarm[1] > 30
{
	show_debug_message(progress_waves)
	if progress_waves = true
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
{
var _preset_waves_length = array_length(preset_waves) - 1

var _loops = 0
while (true) 
{
	_loops += 1
	if _loops > 500
	{
		show_debug_message("WARNING: 500 loops in obj_game: step, breaking loop")
		show_debug_message("^^ this is the loop that displays desc when changing waves with debug")
		show_debug_message("")
		break;
	}
	chosen_wave = array_get(preset_waves,irandom_range(0,_preset_waves_length))
	var _chosen_wave = chosen_wave
	if wave_number >= _chosen_wave.minwave and wave_number <= _chosen_wave.maxwave
	{
		break
	}
}
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
{
var _preset_waves_length = array_length(preset_waves) - 1

var _loops = 0
while (true) 
{
	_loops += 1
	if _loops > 500
	{
		show_debug_message("WARNING: 500 loops in obj_game: step, breaking loop")
		show_debug_message("^^ this is the loop that displays desc when changing waves with debug")
		show_debug_message("")
		break;
	}
	chosen_wave = array_get(preset_waves,irandom_range(0,_preset_waves_length))
	var _chosen_wave = chosen_wave
	if wave_number >= _chosen_wave.minwave and wave_number <= _chosen_wave.maxwave
	{
		break
	}
}
}
}

if keyboard_check_pressed(vk_backspace)
{
	if keyboard_check(vk_control)
	{
		play_this_wave = true
		progress_waves = true
		alarm[1] = 30
	}
	else
	{
		play_this_wave = false
		progress_waves = false
		alarm[1] = 0
	}
}