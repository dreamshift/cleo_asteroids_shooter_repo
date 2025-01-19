// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_entity_place_info(_entity_place_list){

var _entity_place_info = ds_list_create()

var _entity_place_list_size = ds_list_size(_entity_place_list) 
for (var _iteration = 0; _iteration < _entity_place_list_size; ++_iteration)
{
	var _current_id = ds_list_find_value(_entity_place_list, _iteration)
	if _current_id = id or _current_id.type = "bullet"
	{
		continue // skips the rest of the code in the loop
	}
	var _current_id_info = {
		
		entity_id : _current_id,
		entity_object_index : _current_id.object_index,
		entity_faction : _current_id.faction,
		entity_type : _current_id.type,
		entity_danger : _current_id.danger
	
	}
	// show_debug_message(_current_id_info)
	ds_list_add(_entity_place_info,_current_id_info)
}

return(_entity_place_info)

}