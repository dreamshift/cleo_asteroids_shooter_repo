var _direction = direction
var _speed = speed

var _thrust_damage = thrust_damage

if is_undefined(creator)
{

if other.type != "bullet" and other.type != "player" and other.type != "aoe_explosive"
{
	with other
	{
		hp -= _thrust_damage
		motion_add(_direction,_speed/30)
	}
}

}
else
{
	if other.type != "bullet" and other.id != creator and other.type != "aoe_explosive"
	{
		with other
	{
		hp -= _thrust_damage
		motion_add(_direction,_speed/30)
	}
}
}