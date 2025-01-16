audio_sound_pitch(snd_asteroid_break,random_range(0.7,0.8))
audio_play_sound(snd_asteroid_break,0,0,1.2)

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


audio_sound_pitch(snd_bomb_explode,random_range(1.1,1.2))
audio_play_sound(snd_bomb_explode,0,0)

var _explosion_new = instance_create_layer(x,y,"Instances",obj_explosion)
with _explosion_new
{
	explosion_force = 2
	explosion_damage = 35
	explosion_size = 1.5
	faction = "neutral"
}
instance_destroy()