// takes a specific entity's info package and runs debug messages
// you don't wanna give it entity_place_info, instead give it ds_list_find_value(entity_place_info,i)
function script_debug_entity_place_info(_entity_struct){
	
	if is_undefined(_entity_struct)
	{
		show_debug_message("script_debug_entity: _entity_struct undefined!")
		return
	}
	else
	{
	var _relation = script_get_relation(_entity_struct)
	show_debug_message(_entity_struct.entity_id)
	show_debug_message(object_get_name(_entity_struct.entity_object_index))
	show_debug_message(_entity_struct.entity_faction)
	show_debug_message(_entity_struct.entity_type)
	show_debug_message(_entity_struct.entity_danger)
	show_debug_message("")
	show_debug_message(_relation)
	show_debug_message("")
	}

}