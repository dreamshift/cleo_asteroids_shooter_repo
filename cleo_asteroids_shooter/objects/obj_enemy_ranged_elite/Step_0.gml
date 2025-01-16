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

if not instance_exists(obj_player)
{
	exit
}

var _search_list_player = ds_list_create()
var _image_index = image_index

sprite_index = spr_room_size
image_xscale = 2
image_yscale = 2
instance_place_list(x,y,obj_player_pathfinding_clones,_search_list_player,true)
image_xscale = 1
image_yscale = 1
sprite_index = spr_enemy_ranged_elite

image_index = _image_index

var _dist = point_distance(x,y,obj_player.x,obj_player.y)

if not ds_list_empty(_search_list_player)
{
	var _closest_player_clone = ds_list_find_value(_search_list_player, 0)
	image_angle = point_direction(x,y,_closest_player_clone.x,_closest_player_clone.y)
}

ds_list_destroy(_search_list_player)

var _real_player_direction = point_direction(x,y,obj_player.x,obj_player.y)

motion_add(_real_player_direction+strafe,enemy_strafe/20)

	var _id = id
	var _speed = speed
	var _direction = direction
	if _dist > 220
	{
		motion_add(_real_player_direction,enemy_thrust/20)
	}
	if _dist < 100
	{
		motion_add(_real_player_direction+180,enemy_thrust/20)
	}
	if alarm[1] < 30
	{
		image_index = 1
	}

	
	if alarm[1] <= 1
		{
		image_index = 0
		var _light_bullet_sound_pitch = light_bullet_rof / 1.2 + 0.5
		audio_sound_pitch(snd_light_bullet_shoot,random_range(_light_bullet_sound_pitch-0.1,_light_bullet_sound_pitch+0.1))
		audio_play_sound(snd_light_bullet_shoot,0,0,0.5)
		audio_play_sound(snd_light_bullet_shoot,0,0,0.5)

		alarm[1] = 60 / light_bullet_rof
		var _light_bullet_new = instance_create_layer(x,y,"Instances",obj_light_bullet)
		var _image_angle = image_angle
		with _light_bullet_new
		{
			motion_set(_image_angle,5)
			motion_add(obj_player.direction,obj_player.speed*0.8)
			faction = "enemy"
			creator = _id
			light_bullet_dmg = 40
			scale = 3
			screenwrap = true
			fade_delay = 1.5
		}
		repeat irandom_range(5,10)
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