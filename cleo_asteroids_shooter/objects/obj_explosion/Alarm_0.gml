var _explosion_force = explosion_force
var _explosion_damage = explosion_damage
var _explosion_size = explosion_size
var _faction = faction

if instance_exists(obj_player)
{
	var _search_list_other = ds_list_create()
	instance_place_list(x,y,obj_faction,_search_list_other,true);
	if not ds_list_empty(_search_list_other)
	{
		var _search_list_other_size = ds_list_size(_search_list_other)
		for (var i1 = 0; i1 < _search_list_other_size; ++i1)
		{
			var _current_other = ds_list_find_value(_search_list_other, i1)
			var _dir_other = point_direction(x,y,_current_other.x,_current_other.y)
			with _current_other
			{
				motion_add(_dir_other,_explosion_force+speed*0.5)
				if type != "bullet"
				{
					if faction != _faction
					{
						hp -= _explosion_damage
					}
					else faction = _faction
					{
						hp -= _explosion_damage * 0.5
					}
				}
			}
		}
	}
	ds_list_destroy(_search_list_other)
}

