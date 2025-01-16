if hp > max_hp
{
	hp = max_hp
}


if hp <= 0
{
	hp = 0
	alarm[0] = 1
}


image_angle += rotation_speed
 
if rotation_speed > 0
{
	rotation_speed -= 0.03
}

if rotation_speed < 0
{
	rotation_speed += 0.03
}

speed *= 1 - aoe_explosive_friction

// all sorts of stuff to make the explosives repelled by light bullets

var _search_list = ds_list_create()

	image_xscale = aoe_explosive_push_distance;
	image_yscale = aoe_explosive_push_distance;
	instance_place_list(x,y,obj_faction,_search_list,true)
	instance_place_list(x,y,obj_thrust,_search_list,true);
	image_xscale = scale
	image_yscale = scale
	
if not ds_list_empty(_search_list)
{
	var _search_list_size = ds_list_size(_search_list)
	for (var i = 0; i < _search_list_size; ++i)
	{
		var _current = ds_list_find_value(_search_list, i)
		if !variable_instance_exists(_current, "aoe_explosive_push")
		{
			continue
		}
		var _current_dir = point_direction(x,y,_current.x,_current.y)
		var _current_dist = point_distance(x,y,_current.x,_current.y)
		var _push_force = 1 / _current_dist
		if _push_force > 0.15
		{
			_push_force = 0.15
		}
		
		var _push_force_scaled = _push_force * _current.aoe_explosive_push

		motion_add(_current_dir+180,_push_force_scaled)
		with _current
		{
			motion_add(_current_dir,_push_force_scaled/(aoe_explosive_push/2))
		}
		if irandom_range(1,100) <= 75 and hp > 0
		{
			show_debug_message(_current.aoe_explosive_push)
			var _aoe_explosive_push = max(1,_current.aoe_explosive_push)
			_aoe_explosive_push = round(_aoe_explosive_push)
			alarm[0] += 1 * _aoe_explosive_push
			alarm[1] += 1 * _aoe_explosive_push
			show_debug_message(_aoe_explosive_push)
		}
	}
}


move_wrap(1,1,sprite_width/2)

if alarm[0] > 60 * aoe_explosive_timer_length
{
	alarm[0] = 60 * aoe_explosive_timer_length
}
if alarm[1] > 60 * aoe_explosive_timer_length
{
	alarm[1] = 60 * aoe_explosive_timer_length
}

var _aoe_explosive_timer_spent = aoe_explosive_timer_length - alarm[0] / 60

if _aoe_explosive_timer_spent <= aoe_explosive_timer_length * 0.5
{
	image_index = 0
}
if _aoe_explosive_timer_spent >= aoe_explosive_timer_length - 15/60
{
	image_index = 3
}
else if _aoe_explosive_timer_spent > aoe_explosive_timer_length * 0.5
{
	if alarm[3] <= 1
	{
		if image_index + 1 != 3
		{
			image_index += 1
		}
		else
		{
			image_index = 1
		}
	}
}