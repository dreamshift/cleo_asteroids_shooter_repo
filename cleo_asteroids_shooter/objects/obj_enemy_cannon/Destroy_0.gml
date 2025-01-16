repeat 35
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

if alarm[1] >= 30 //whether it's holding a shot
{
audio_sound_pitch(snd_asteroid_break,random_range(0.7,0.8))
audio_play_sound(snd_asteroid_break,0,0,1.2)
var _explosion_new = instance_create_layer(x,y,"Instances",obj_explosion)
with _explosion_new
{
	explosion_force = 2
	explosion_damage = 30
	explosion_size = 2
	faction = "neutral"
}
}

if alarm[1] < 30
{
audio_sound_pitch(snd_asteroid_break,random_range(0.5,0.6))
audio_play_sound(snd_asteroid_break,0,0,1.2)
var _explosion_new = instance_create_layer(x,y,"Instances",obj_explosion)
with _explosion_new
{
	explosion_force = 3
	explosion_damage = 50
	explosion_size = 3
	faction = "neutral"
}
}

instance_destroy()