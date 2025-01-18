// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_thrust(
_force = thrust_force,
_force_direction_offset = 0,
_particle_thrust_damage = 0.75,
_particle_count = 2,
_particle_min_speed = 2,
_particle_max_speed = 5,
_particle_direction_offset = 0,
_particle_direction_variation = 25,
_particle_x_origin = x,
_particle_y_origin = y,
_sound_min_pitch = 0.75,
_sound_max_pitch = 1.75,
_sound_gain = 1)
{
	
	motion_add(image_angle + _force_direction_offset,_force / 20)
	{
	var _sound_thrust_pitch = (random_range(_sound_min_pitch, _sound_max_pitch));
	audio_play_sound(snd_thrust, 0, 0, _sound_gain, 0, _sound_thrust_pitch);
	
	var _creator_id = id
	var _creator_faction = faction
	var _creator_image_angle = image_angle
	var _creator_direction = direction
	var _creator_speed = speed
	repeat(_particle_count)
	{
		var _newthrust = instance_create_layer(_particle_x_origin, _particle_y_origin, "Instances", obj_thrust);
		with(_newthrust) 
		{
			motion_set(_creator_direction,_creator_speed)
			var _dir = _creator_image_angle + random_range(-_particle_direction_variation, _particle_direction_variation) + 180 + _particle_direction_offset
			var _rand_speed = random_range(_particle_min_speed, _particle_max_speed)
			motion_add(_dir, _rand_speed)
			creator = _creator_id
			faction = _creator_faction
			random_accel = 0.04
			random_accel_dir = choose(90,-90)
			random_accel_dir += _creator_image_angle
		}
		}
	}
}