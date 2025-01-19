// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_collide(_push = 0.1, _push_scaling = 0.1,
_collide_same_faction = false)
{

var _hp = hp
var _direction = direction
var _speed = speed
var _x = x
var _y = y
var _crash_damage = crash_damage

if _collide_same_faction = false
{
if other.faction != faction and other.type != "bullet" and other.uncollidable = false and uncollidable = false
{
	with other
	{
		hp -= _crash_damage
		var _dir = point_direction(x,y,_x,_y) // direction from other -> og
		var _final_push = _push + speed * _push_scaling
		motion_add(_dir+180,_final_push) // other pushes away from og, with a flat value of 0.1 and scaling up with its current speed
	}
}
}
else
{
	if other.type != "bullet" and other.uncollidable = false and uncollidable = false
	{
		with other
		{
			hp -= _crash_damage
			var _dir = point_direction(x,y,_x,_y) // direction from other -> og
			var _final_push = _push + speed * _push_scaling
			motion_add(_dir+180,_final_push) // other pushes away from og, with a flat value of 0.1 and scaling up with its current speed
		}
}
}

}