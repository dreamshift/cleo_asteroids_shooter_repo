audio_sound_pitch(snd_asteroid_break,random_range(1.4,1.6))
audio_play_sound(snd_asteroid_break,0,0,0.8)

repeat 15
	{
		var _enemy_speed = speed
		var _enemy_direction = direction
		var _debris_new = instance_create_layer(x,y,"Instances",obj_debris)
		with _debris_new
		{
			motion_add(_enemy_direction,_enemy_speed)
		}
	}