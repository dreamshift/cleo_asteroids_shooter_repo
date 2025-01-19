event_inherited();

if !player_exists()
{
	exit
}

image_angle = point_direction(x,y,obj_player.x,obj_player.y)
script_thrust(thrust_force, 0, 0, 0.25, 1, 2, 0, 25,x ,y ,0)

script_entity_pick_target()

{ // push away other test enemies
var _search_list_other = script_entity_place_list(object_index)
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
}