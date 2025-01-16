if not instance_exists(obj_player)
{
	exit
}


if other.faction != faction and other.id != creator and other.type != "bullet"
{
	var _light_bullet_dmg = light_bullet_dmg
	with other
	{
		hp -= _light_bullet_dmg
	}
	alarm[0] = 1
}