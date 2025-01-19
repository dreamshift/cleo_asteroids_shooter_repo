/// @description

event_inherited();

danger = 15

type = "player"
faction = "etech"
uncollidable = false
screenwrap = true
player_ship_sightline_flicker = 0

// defines health and health related things right as the game starts
// we just set the current hp to whatever the max is

max_hp = 100
hp = max_hp
crash_damage = 10

// amount of hp regenerated per second

hp_regen = 5

// simple, the acceleration

thrust_force = 2
strafe_force = (thrust_force * 0.75 + 1.5) * 20

// seconds between every strafe

player_ship_strafe_cooldown = 1

// the speed is multiplied by this value every frame

friction_force = 0.02

// we just need to define some relevant rate of fires

player_ship_light_bullet_rof = 10
player_ship_aoe_explosive_rof = 0.5
player_ship_heavy_bullet_rof = 1
player_ship_energy_blast_rof = 1.5


speed_cap = 0
player_ship_selected_weapon = 1
alarm[4] = 1

{ // creates 8 player clones for pathfinding, janky and big...
var _new_phantom_player = instance_create_layer(x,y,"Instances",obj_player_pathfinding_clones)
with _new_phantom_player
{
	x_offset = room_width * -1
	y_offset = room_height * -1
}
var _new_phantom_player = instance_create_layer(x,y,"Instances",obj_player_pathfinding_clones)
with _new_phantom_player
{
	x_offset = room_width * 0
	y_offset = room_height * -1
}
var _new_phantom_player = instance_create_layer(x,y,"Instances",obj_player_pathfinding_clones)
with _new_phantom_player
{
	x_offset = room_width * 1
	y_offset = room_height * -1
}


var _new_phantom_player = instance_create_layer(x,y,"Instances",obj_player_pathfinding_clones)
with _new_phantom_player
{
	x_offset = room_width * -1
	y_offset = room_height * 0
}
var _new_phantom_player = instance_create_layer(x,y,"Instances",obj_player_pathfinding_clones)
with _new_phantom_player
{
	x_offset = room_width * 0
	y_offset = room_height * 0
	root = true
}
var _new_phantom_player = instance_create_layer(x,y,"Instances",obj_player_pathfinding_clones)
with _new_phantom_player
{
	x_offset = room_width * 1
	y_offset = room_height * 0
}


var _new_phantom_player = instance_create_layer(x,y,"Instances",obj_player_pathfinding_clones)
with _new_phantom_player
{
	x_offset = room_width * -1
	y_offset = room_height * 1
}
var _new_phantom_player = instance_create_layer(x,y,"Instances",obj_player_pathfinding_clones)
with _new_phantom_player
{
	x_offset = room_width * 0
	y_offset = room_height * 1
}
var _new_phantom_player = instance_create_layer(x,y,"Instances",obj_player_pathfinding_clones)
with _new_phantom_player
{
	x_offset = room_width * 1
	y_offset = room_height * 1
}
}