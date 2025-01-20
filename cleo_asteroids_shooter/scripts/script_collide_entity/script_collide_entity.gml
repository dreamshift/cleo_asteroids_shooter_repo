// object_index ; object to check for collision with

function script_collide_entity(
_object_index = obj_faction,
_crash_damage = crash_damage,
_exclude_same_faction = true,
_push = 0.1,
_speed_push_scaling = 0.5,
_speed_damage_scaling = 0,
_x = x,
_y = y){

var _direction = direction
var _speed = speed
var _faction = faction

{ 
var _entity_place_list = script_entity_place_list(_x, _y, _object_index, sprite_index, 1, true)
var _entity_place_info = script_entity_place_info(_entity_place_list)
ds_list_destroy(_entity_place_list)

if ds_list_empty(_entity_place_info)
{
	//show_debug_message("list empty!!")
	exit
}

		var _entity_place_info_size = ds_list_size(_entity_place_info)
		for (var i = 0; i <= _entity_place_info_size-1; ++i)
		{
			
			var _current_package = ds_list_find_value(_entity_place_info, i)
			
			if _current_package.entity_faction = _faction and _exclude_same_faction = true
			{
				show_debug_message("entity_faction = _faction, and _exclude_same_faction = true")
				continue
			}
			
			
			if _current_package.entity_uncollidable = true or uncollidable = true
			{
				show_debug_message("entity_uncollidable = true, or uncollidable = true")
				continue
			}
			
			//show_debug_message("inst exists? "+string(instance_exists(_current_package.entity_id)))
			//show_debug_message("obj? "+string(object_get_name(_current_package.entity_id.object_index)))
			
			if !variable_instance_exists(_current_package.entity_id, "hp")
			{
				show_debug_message("script_collide_object: _current_package hp does not exist!")
				show_debug_message(object_get_name(_current_package.entity_object_index))
				continue
			}
				
				
				
			with _current_package.entity_id
			{
				hp -= _crash_damage + abs(_speed*_speed_damage_scaling)
				var _dir = point_direction(x,y,_x,_y) // direction from other -> og
				var _final_push = _push + abs(_speed*_speed_push_scaling)
				motion_add(_dir+180,_final_push) // other pushes away from og, with a flat value of 0.1 and scaling up with its current speed
			}
			
		}

	
ds_list_destroy(_entity_place_info)
}

}