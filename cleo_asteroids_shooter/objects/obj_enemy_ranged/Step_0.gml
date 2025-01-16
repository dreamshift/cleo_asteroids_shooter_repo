move_wrap(1,1,sprite_width/2)

if image_alpha < 1
{
	image_alpha += 0.03
}

if hp <= 0
{
	instance_destroy()
}
if hp > max_hp
{
	hp = max_hp
}

if speed >= speed_cap
{
	speed *= 0.98
}

if speed > 0
{
	speed -= enemy_friction
}

if instance_exists(obj_player)
{
	var _id = id
	var _image_angle = image_angle
	var _speed = speed
	var _direction = direction
	image_angle = point_direction(x,y,obj_player.x,obj_player.y)
	var _dist = point_distance(x,y,obj_player.x,obj_player.y)
	if _dist > 200
	{
		motion_add(image_angle,enemy_thrust/20)
	}
	if _dist < 80
	{
		motion_add(image_angle+180,enemy_thrust/20)
	}
	if alarm[1] < 30
	{
		image_index = 1
	}
	
	
	if alarm[1] <= 1
		{
		image_index = 0
		var _light_bullet_sound_pitch = light_bullet_rof / 0.6 + 0.5
		audio_sound_pitch(snd_light_bullet_shoot,random_range(_light_bullet_sound_pitch-0.1,_light_bullet_sound_pitch+0.1))
		audio_play_sound(snd_light_bullet_shoot,0,0,0.5)
		audio_play_sound(snd_light_bullet_shoot,0,0,0.5)

		alarm[1] = 60 / light_bullet_rof
		var _light_bullet_new = instance_create_layer(x,y,"Instances",obj_light_bullet)
		with _light_bullet_new
		{
			motion_set(_image_angle,5)
			motion_add(obj_player.direction,obj_player.speed*0.6)
			faction = "enemy"
			creator = _id
			light_bullet_dmg = 10
			scale = 2
		}
		repeat irandom_range(2,5)
		{
			var _debris_new = instance_create_layer(x,y,"Instances",obj_debris)
			with _debris_new
			{
				image_angle = _image_angle + random_range(-15,15)
				motion_set(image_angle,random_range(0.5,3.5))
				motion_add(_direction,_speed)
				debris_fade_time = 0.5
				creator = _id
			}
		}
		}
}


var _search_list_other = ds_list_create()
var _object_index = object_index

instance_place_list(x,y,_object_index,_search_list_other,true)
	if not ds_list_empty(_search_list_other)
	{
		var _search_list_other_size = ds_list_size(_search_list_other)
		for (var i = 0; i < _search_list_other_size; ++i)
		{
			var _current_other = ds_list_find_value(_search_list_other, i)
			var _dir_other = point_direction(x,y,_current_other.x,_current_other.y)
			with _current_other
			{
				motion_add(_dir_other,0.1)
			}
		}
	}
	
ds_list_destroy(_search_list_other)