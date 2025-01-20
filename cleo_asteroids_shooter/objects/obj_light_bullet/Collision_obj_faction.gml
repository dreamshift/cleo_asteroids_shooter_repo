if not instance_exists(obj_player)
{
	exit
}


if other.faction != faction and other.id != creator and other.type != "bullet"
{
	var _light_bullet_dmg = light_bullet_dmg
	with other
	{
		var _new_light_bullet_dmg = _light_bullet_dmg - hp
		hp -= _light_bullet_dmg
		var _hp = hp
	}
	light_bullet_dmg = _new_light_bullet_dmg
	light_bullet_dmg = max(0,light_bullet_dmg)
	if _hp > 0
	{
		alarm[0] = 1
	}
}