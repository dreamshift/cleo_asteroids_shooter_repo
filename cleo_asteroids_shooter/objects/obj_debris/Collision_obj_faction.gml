var _direction = direction
var _speed = speed

var _speed_push_cap = _speed / 160
if _speed_push_cap > 0.15
{
	_speed_push_cap = 0.15
}

var _speed_damage_cap = _speed / 40
if _speed_damage_cap > 0.5
{
	_speed_damage_cap = 0.5
}

var _debris_damage = debris_damage

if is_undefined(creator)
{

if other.type != "bullet" and other.type != "player" and other.type != "aoe_explosive"
{
	with other
	{
		hp -= _debris_damage + _speed_damage_cap 
		motion_add(_direction,_speed_push_cap)
	}
	instance_destroy()
}

}
else
{
	if other.type != "bullet" and other.id != creator and other.type != "aoe_explosive"
	{
		with other
		{
			hp -= _debris_damage + _speed_damage_cap 
			motion_add(_direction,_speed_push_cap)
		}
		instance_destroy()
}
}