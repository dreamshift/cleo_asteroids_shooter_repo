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

var _dist = point_distance(x,y,obj_player.x,obj_player.y)
var _real_player_direction = point_direction(x,y,obj_player.x,obj_player.y)

var _angle_diff = angle_difference(_real_player_direction, image_angle)

if _angle_diff > 0
{
	rotation += rotation_acceleration
}
if _angle_diff < 0
{
	rotation -= rotation_acceleration
}
var _facing_player = false
if _angle_diff < 15
{
	if _angle_diff > -15
	{
		rotation *= 0.9
		_facing_player = true
	}
}
rotation = clamp(rotation,-rotation_cap,rotation_cap)
image_angle += rotation

	var _id = id
	var _speed = speed
	var _direction = direction
	if _dist > 150
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

	
	if alarm[1] <= 1 and _dist < 150 and _facing_player = true
		{
		image_index = 0
		audio_sound_pitch(snd_bomb_drop,random_range(0.7,0.9))
		audio_play_sound(snd_bomb_drop,0,0,0.5)
		audio_play_sound(snd_bomb_drop,0,0,0.5)
		
		alarm[1] = 60 / aoe_explosive_rof
		var _aoe_explosive_new = instance_create_layer(x,y,"Instances",obj_aoe_explosive)
		var _image_angle = image_angle
		var _speed = speed
		var _direction = direction
		with _aoe_explosive_new
		{
			motion_set(_image_angle,5)
			motion_add(_direction,_speed)
			motion_add(obj_player.direction,obj_player.speed*0.5)
			
			aoe_explosive_friction = 0.015

			// in seconds
			aoe_explosive_timer_length = 0.5
			alarm[0] = 60 * aoe_explosive_timer_length
			alarm[1] = 60 * aoe_explosive_timer_length
			
			explosion_force = 1
			explosion_damage = 40
			explosion_size = 2.25
			crash_damage = explosion_damage * 0.25

			max_hp = 5
			hp = max_hp
			faction = "enemy"
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