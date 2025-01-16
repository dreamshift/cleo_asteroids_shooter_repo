var _direction = direction
var _speed = speed

var _thrust_damage = thrust_damage


if other.type != "bullet" and other.id != creator
{
	with other
	{
		if other.type != "aoe_explosive"
		{
			hp -= _thrust_damage
		}
		motion_add(_direction,_speed/60)
	}
	image_alpha -= 0.2
	
}