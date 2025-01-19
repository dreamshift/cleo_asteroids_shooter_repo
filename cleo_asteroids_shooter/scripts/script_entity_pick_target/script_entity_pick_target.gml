// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_entity_pick_target(){

var _request_entity_ids = script_entity_place_list(obj_faction, spr_room_size, 4, true)
var _entity_list = script_entity_place_info(_request_entity_ids)
ds_list_destroy(_request_entity_ids)

var _closest_entity = ds_list_find_value(_entity_list,0)

if not ds_list_empty(_entity_list)
{
	var _relation = script_get_relation(_closest_entity)
	show_debug_message(_closest_entity.entity_id)
	show_debug_message(object_get_name(_closest_entity.entity_object_index))
	show_debug_message(_closest_entity.entity_faction)
	show_debug_message(_closest_entity.entity_type)
	show_debug_message(_closest_entity.entity_danger)
	show_debug_message("")
	show_debug_message(_relation)
	show_debug_message("")
}

ds_list_destroy(_entity_list) //pull values out of the list and store them as temp variables before doing this,
// you can't destroy a list after doing return!
// it's 3:30 AM and i would love to keep going but i feel like shit and i need to sleep -fate1&2

}