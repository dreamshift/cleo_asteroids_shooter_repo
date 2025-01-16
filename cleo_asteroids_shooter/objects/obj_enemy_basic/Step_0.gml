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

image_angle = point_direction(x,y,obj_player.x,obj_player.y)
motion_add(image_angle,enemy_thrust/20)

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