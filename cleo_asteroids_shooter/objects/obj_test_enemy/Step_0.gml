event_inherited();

if !player_exists()
{
	exit
}

image_angle = point_direction(x,y,obj_player.x,obj_player.y)
script_thrust(thrust_force, 0, 0, 0.25, 1, 2, 0, 25,x ,y ,0)



script_collide_entity(obj_faction,0,false,push,0)  // collide with same object index

script_collide_entity(obj_faction,crash_damage,true,push,0.5,3) // collide with obj_faction


//script_entity_pick_target()
//var _entity_place_list = script_entity_place_list(x, y, obj_faction, spr_room_size, 4, true)
//var _entity_place_info = script_entity_place_info(_entity_place_list)
//ds_list_destroy(_entity_place_list)

//var _picked_package_danger = script_entity_pick_danger(_entity_place_info)
// script_debug_entity_place_info(_picked_package_danger)
//ds_list_destroy(_entity_place_info)