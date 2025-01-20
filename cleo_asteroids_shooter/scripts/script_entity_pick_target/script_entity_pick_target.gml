//
function script_entity_pick_target(){

var _entity_place_list = script_entity_place_list(x, y, obj_faction, spr_room_size, 4, true)
var _entity_place_info = script_entity_place_info(_entity_place_list)
ds_list_destroy(_entity_place_list)


if not ds_list_empty(_entity_place_info)
{
	var _closest_entity = ds_list_find_value(_entity_place_info,0)
	script_debug_entity_place_info(_closest_entity)
}

ds_list_destroy(_entity_place_info) //pull values out of the list and store them as temp variables before doing this,
// you can't destroy a list after doing return!
// it's 3:30 AM and i would love to keep going but i feel like shit and i need to sleep -fate1&2

}