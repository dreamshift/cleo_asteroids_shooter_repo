// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_speed(_speedcap_strength = 2){

if speed >= speed_cap
{
	speed *= 1 - (_speedcap_strength / 100)
}

if speed > 0
{
	speed -= friction_force
}

}