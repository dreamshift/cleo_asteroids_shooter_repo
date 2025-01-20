event_inherited();

script_collide_entity(obj_faction,crash_damage,false,push,1,7)

if !player_exists()
{
	exit
}

//image_angle = point_direction(x,y,obj_player.x,obj_player.y)
//script_thrust(thrust_force, 0, 0, 0.25, 1, 2, 0, 25,x ,y ,0)

image_angle += rotation_speed

