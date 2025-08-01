event_inherited();

if is_undefined(current_target)
{
	script_entity_pick_target()
}
else if not instance_exists(current_target.entity_id)
{
	script_entity_pick_target()
}

if not is_undefined(current_target)
{
	if current_target_action = "attack"
	{
	var _target_x = current_target.entity_id.x
	var _target_y = current_target.entity_id.y
	image_angle = point_direction(x,y,_target_x,_target_y)
	script_thrust(thrust_force, 0, 0, 0.25, 1, 2, 0, 25,x ,y ,0)
	}
}

//script_collide_entity(obj_faction,0,false,push,0)  // collide with same  faction

script_collide_entity(obj_faction,crash_damage,true,push,0.5,3) // collide with other obj_faction
script_collide_entity(obj_faction,crash_damage * 0.5,false,0) // collide with same obj_faction (only damage)

//var _entity_place_list = script_entity_place_list(x, y, obj_faction, spr_room_size, 4, true)
//var _entity_place_info = script_entity_place_info(_entity_place_list)
//ds_list_destroy(_entity_place_list)

//var _picked_package_danger = script_entity_pick_danger(_entity_place_info)
// script_debug_entity_place_info(_picked_package_danger)
//ds_list_destroy(_entity_place_info)