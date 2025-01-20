// takes a list of IDs and places info packages (structs) into a new list and returns that

function script_entity_place_info(_entity_place_list){

var _entity_place_info = ds_list_create()

var _entity_place_list_size = ds_list_size(_entity_place_list)
if _entity_place_list_size <= 0
{
	return(_entity_place_info)
}



for (var _iteration = 0; _iteration <= _entity_place_list_size-1; ++_iteration)
{	
	
	if object_get_name(object_index) == "obj_test_enemy" {
		//show_debug_message(string(_iteration))
	}

	var _current_id = ds_list_find_value(_entity_place_list, _iteration)
	if _current_id = id or _current_id.type = "bullet" or _current_id.type = "aoe_explosive"
	{
		continue // skips the rest of the code in the loop
	}
	var _current_id_info = {
		
		entity_id : _current_id,
		entity_object_index : _current_id.object_index,
		entity_faction : _current_id.faction,
		entity_type : _current_id.type,
		entity_danger : _current_id.danger,
		entity_uncollidable : _current_id.uncollidable
	
	}
	ds_list_add(_entity_place_info,_current_id_info)
	//script_debug_entity_place_info(ds_list_find_value(_entity_place_info,0))
}

return(_entity_place_info)

}

