if not instance_exists(obj_player)
{
	exit
}

global.wave_number = wave_number
alarm[1] = 60 * 10

if play_this_wave = true
{
	play_this_wave = false
	var _chosen_wave = chosen_wave
	if wave_number >= _chosen_wave.minwave and wave_number <= _chosen_wave.maxwave
	{
		alarm[1] = _chosen_wave.timer * 60
	}
}
else
{
wave_number += 1
var _preset_waves_length = array_length(preset_waves) - 1

var _loops = 0
while (true) 
{
	_loops += 1
	if _loops > 500
	{
		show_debug_message("WARNING: 500 loops in obj_game: alarm[1], breaking loop")
		show_debug_message("this is the loop that picks waves ^")
		show_debug_message("")
		break;
	}
	chosen_wave = array_get(preset_waves,irandom_range(0,_preset_waves_length))
	var _chosen_wave = chosen_wave
	if wave_number >= _chosen_wave.minwave and wave_number <= _chosen_wave.maxwave
	{
		alarm[1] = _chosen_wave.timer * 60
		break;
	}
}
}

for (var i = 0; i < _chosen_wave.enemylist; ++i) 
{
    var _enemy = array_get(_chosen_wave.enemies,i)
	if _enemy.preplaced = false
	{
		repeat irandom_range(_enemy.mincount,_enemy.maxcount)
		{
			var _height_or_width = choose(0,1)
			if _height_or_width = 0 // 0 = top or bottom, random X
			{
				var _rand_y = choose(0,room_height)
				var _rand_x = random_range(0,room_width)
			}
			else // 1 = left or right, random Y
			{
				var _rand_y = random_range(0,room_height)
				var _rand_x = choose(0,room_width)
			}
			instance_create_layer(_rand_x,_rand_y,"Instances",_enemy.type)
		}
	}
	if _enemy.preplaced = true
	{
		show_debug_message("_enemy.preplaced = true, and that isn't implemented yet")
	}
}
