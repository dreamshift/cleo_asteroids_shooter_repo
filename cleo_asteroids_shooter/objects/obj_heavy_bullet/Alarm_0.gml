var _heavy_bullet_x = x
var _heavy_bullet_y = y
var _heavy_bullet_dmg = heavy_bullet_dmg
var _heavy_bullet_direction = image_angle
var _faction = faction

var _search_list_explosive = ds_list_create()
image_yscale = 7
instance_place_list(x,y,obj_aoe_explosive,_search_list_explosive,true);
image_yscale = 1

if not ds_list_empty(_search_list_explosive)
{
	var _search_list_explosive_size = ds_list_size(_search_list_explosive)
	for (var i = 0; i < _search_list_explosive; ++i)
	{
		
		var _current_explosive = ds_list_find_value(_search_list_explosive, i)
		with _current_explosive
		{
			hp -= _heavy_bullet_dmg
			explosion_force += 3
			explosion_damage += 60
			explosion_size += 1
			var _current_explosive_x = x
			var _current_explosive_y = y
			motion_set(direction,speed*0.5)
			motion_add(_heavy_bullet_direction,5)
			faction = _faction
		}
		var _current_explosive_distance = point_distance(_heavy_bullet_x,_heavy_bullet_y,_current_explosive_x,_current_explosive_y)
	}
}

ds_list_destroy(_search_list_explosive)

var _search_list_other = ds_list_create()
image_yscale = 7
instance_place_list(x,y,obj_faction,_search_list_other,true);
image_yscale = 1

if not ds_list_empty(_search_list_other)
{
	var _search_list_other_size = ds_list_size(_search_list_other)
	for (var i1 = 0; i1 < _search_list_other_size; ++i1)
	{
		var _current_other = ds_list_find_value(_search_list_other, i1)
		if _current_other.type != "bullet" and _current_other.id != creator and _current_other.faction != faction
		{
			with _current_other
			{
				hp -= _heavy_bullet_dmg
				if hp <= 0
				{
					motion_set(direction,speed*1.5)
					motion_add(_heavy_bullet_direction,5)
				}
				else
				{
					motion_add(_heavy_bullet_direction,2)
				}
			}
		}
	}
}

ds_list_destroy(_search_list_other)

var _search_list_light_bullet = ds_list_create()
image_yscale = 30
instance_place_list(x,y,obj_light_bullet,_search_list_light_bullet,true);
image_yscale = 1

if not ds_list_empty(_search_list_light_bullet)
{
	var _search_list_light_bullet_size = ds_list_size(_search_list_light_bullet)
	var _loops = 0
	for (var i2 = 0; i2 < _search_list_light_bullet_size; ++i2)
	{
		_loops += 1
		if _loops > 50
		{
			show_debug_message("over 50 loops in obj_heavy_bullet: alarm[0], '_search_list_light_bullet' ")
			break
		}
		var _current_light_bullet = ds_list_find_value(_search_list_light_bullet, i2)
		if _current_light_bullet.split = false
		{
			// show_debug_message("split = false")
			continue
		}
		with _current_light_bullet
		{
			split = false
			var _current_light_bullet_direction = direction
			var _current_light_bullet_fade_delay = fade_delay
			var _split_scaling = image_xscale * 5
			_split_scaling = round(_split_scaling)
			var _ship_id = id
			if creator = _ship_id
			{
				
				repeat _split_scaling
				{

					var _current_light_bullet_speed = speed + random_range(-2,7)
					var _heavy_bullet_direction_change = _heavy_bullet_direction + random_range(-45,45)
				
					var _new_bullet = instance_create_layer(x,y,"Instances",obj_light_bullet)
					
					with _new_bullet
					{
						split = false
						motion_add(_heavy_bullet_direction_change,_current_light_bullet_speed)
						faction = _faction
						light_bullet_dmg = light_bullet_dmg
						fade_delay = _current_light_bullet_fade_delay * random_range(0.2,0.3)
						fade_delay_timer = fade_delay * 60
						if speed < 5
						{
							speed = 5 + random_range(-2,2)
						}
					}
				}
			}
			else
			{
				repeat _split_scaling * 2
				{
					split = false
					var _current_light_bullet_speed = speed + random_range(-2,7)
					var _heavy_bullet_direction_change = _heavy_bullet_direction + random_range(-35,35)
				
					var _new_bullet = instance_create_layer(x,y,"Instances",obj_light_bullet)
					
					with _new_bullet
					{
						motion_add(_heavy_bullet_direction_change,_current_light_bullet_speed)
						faction = _faction
						light_bullet_dmg = light_bullet_dmg
						fade_delay = _current_light_bullet_fade_delay * random_range(0.2,0.3)
						fade_delay_timer = fade_delay * 60
						if speed < 5
						{
							speed = 5 + random_range(-2,2)
						}
					}
				}
			}
			instance_destroy()
		}
	}
}

ds_list_destroy(_search_list_light_bullet)