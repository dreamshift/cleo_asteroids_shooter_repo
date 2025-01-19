function script_debris(
_particle_count = 15,
_particle_min_speed = 0.8,
_particle_max_speed = 2,
_debris_fade_time = 1,
_debris_damage = 0.6,
_particle_direction_offset = 0,
_particle_direction_variation = 359,
_particle_x_origin = x,
_particle_y_origin = y,
_sound_min_pitch = 0.8,
_sound_max_pitch = 1.2,
_sound_gain = 1,
_specify_creator_and_faction = false)
{

var _sound_asteroid_break_pitch = (random_range(_sound_min_pitch, _sound_max_pitch));
audio_play_sound(snd_asteroid_break, 0, 0, _sound_gain, 0, _sound_asteroid_break_pitch);

repeat (_particle_count)
	{
		var _creator_id = id
		var _creator_faction = faction
		var _creator_image_angle = image_angle
		var _creator_direction = direction
		var _creator_speed = speed
		var _debris_new = instance_create_layer(x,y,"Instances",obj_debris)
		with _debris_new
		{
			motion_set(_creator_direction,_creator_speed)
			var _dir = _creator_image_angle + random_range(-_particle_direction_variation, _particle_direction_variation) + 180 + _particle_direction_offset
			var _rand_speed = random_range(_particle_min_speed, _particle_max_speed)
			motion_add(_dir, _rand_speed)
			if _specify_creator_and_faction = true
			{
				creator = _creator_id
				faction = _creator_faction
			}
			debris_fade_time = 1
			debris_damage = 0.6
		}
	}

}