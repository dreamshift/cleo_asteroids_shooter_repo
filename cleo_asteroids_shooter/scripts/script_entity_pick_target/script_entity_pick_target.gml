//
function script_entity_pick_target(){

var _entity_place_list = script_entity_place_list(x, y, obj_faction, spr_room_size, 4, true)
var _entity_place_info = script_entity_place_info(_entity_place_list)
ds_list_destroy(_entity_place_list)

var _current_target = undefined
var _check_current_target = undefined
var _choice = undefined

if not ds_list_empty(_entity_place_info)
{
	while(is_undefined(_choice))
	{
		_check_current_target = script_entity_pick_danger(_entity_place_info)
		var _check_current_target_relation = script_get_relation(_check_current_target)
		{ 
			// _action = "flee", "attack", "heal," etc
			// current_target = _
			// current_target_action = 
		}
}

ds_list_destroy(_entity_place_info) //pull values out of the list and store them as temp variables before doing this,
// you can't destroy a list after doing return!
// it's 3:30 AM and i would love to keep going but i feel like shit and i need to sleep -fate1&2

}

// danger (mod. distance) -> action (flee, attack, heal, ignore) -> goal 



{
	//entity_id
	//danger
	//x
	//y
	//action
	//goal
}