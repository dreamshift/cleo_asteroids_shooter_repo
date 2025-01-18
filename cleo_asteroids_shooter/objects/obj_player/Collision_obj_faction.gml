var _hp = hp
var _direction = direction
var _speed = speed
var _x = x
var _y = y
var _crash_damage = crash_damage

if other.faction != faction and other.type != "bullet" and other.uncollidable = false and uncollidable = false
{
	with other
	{
		hp -= _crash_damage
		var _dir = point_direction(x,y,_x,_y)
		if object_index != obj_enemy_basic and object_index != obj_enemy_basic_elite
		{
			motion_add(_dir+180,speed+0.5)
		}
		else
		{
			motion_add(_dir+180,0.5)
		}
	}
}
