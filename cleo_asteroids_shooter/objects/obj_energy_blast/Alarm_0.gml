var _energy_blast_force = energy_blast_force
var _energy_blast_direction = image_angle
var _energy_blast_damage = energy_blast_damage

if not instance_exists(obj_player)
{
	exit
}


if current_frame >= push_frames
{
	exit
}

current_frame += 1
alarm[0] = 1

var _colliding_energy_blast = ds_list_create()
instance_place_list(x,y,obj_faction,_colliding_energy_blast,true)

if ds_list_empty(_colliding_energy_blast)
{
	exit
}

var _colliding_energy_blast_size = ds_list_size(_colliding_energy_blast)
var _collisions_done = 0
var _comparisons_done = 0

for (var i = 0; i < _colliding_energy_blast_size; ++i) 
{
	_collisions_done += 1
	if _collisions_done > 50
	{
		show_debug_message("looped over 50 times in COLLISION loop, breaking for this frame")
		break
	}
	var _will_be_affected = true
	var _current_colliding_energy_blast = ds_list_find_value(_colliding_energy_blast,i)
	if ds_list_empty(pushed_already)
	{
		//show_debug_message("list: pushed_already is empty")
		//show_debug_message("current iteration of list: _colliding_energy_blast added to list: pushed_already")
		ds_list_add(pushed_already,_current_colliding_energy_blast)
		//show_debug_message("current colliding ID: " + string(_current_colliding_energy_blast))
		//show_debug_message("frame: " + string(current_frame))
		//show_debug_message("")
	}
	else
	{
	var _pushed_already_size = ds_list_size(pushed_already)
	for (var i1 = 0; i1 < _pushed_already_size; ++i1) 
	{
		var _current_pushed_already = ds_list_find_value(pushed_already,i1)
		_comparisons_done += 1
		if _comparisons_done > 500
		{
			show_debug_message("looped over 500 times in COMPARISON loop, breaking for this frame")
			break
		}
		if _current_colliding_energy_blast = _current_pushed_already
		{
			//show_debug_message("current iteration of list: _colliding_energy_blast matches an iteration of list: pushed_already")
			//show_debug_message("current colliding ID: " + string(_current_colliding_energy_blast))
			//show_debug_message("current pushed already ID: " + string(_current_pushed_already))
			//show_debug_message("frame: " + string(current_frame))
			//show_debug_message("")
			_will_be_affected = false
			break
		}
		else
		{
			//show_debug_message("current iteration of list: _colliding_energy_blast does not match any iteration of list: pushed_already")
			//show_debug_message("current iteration of list: _colliding_energy_blast added to list: pushed_already")
			ds_list_add(pushed_already,_current_colliding_energy_blast)
			//show_debug_message("current colliding ID: " + string(_current_colliding_energy_blast))
			//show_debug_message("current pushed already ID: " + string(_current_pushed_already))
			//show_debug_message("frame: " + string(current_frame))
			//show_debug_message("")
		}
	}
	}
if _will_be_affected = true and _current_colliding_energy_blast != obj_player.id
{
	with _current_colliding_energy_blast
		{
			motion_set(_energy_blast_direction,_energy_blast_force+speed)
			motion_add(obj_player.direction,obj_player.speed)
			if type != "bullet" and object_index != obj_aoe_explosive
			{
				var _energy_blast_damage_scaling =_energy_blast_damage * obj_player.speed * 2
				if _energy_blast_damage_scaling < _energy_blast_damage
				{
					_energy_blast_damage_scaling = _energy_blast_damage
				}
				hp -= _energy_blast_damage_scaling
				//show_debug_message(_energy_blast_damage_scaling)
				//show_debug_message(obj_player.speed)
			}
			if type = "bullet" or type = "aoe_explosive"
			{
				if object_index = obj_light_bullet
				{
					scale += 1
					light_bullet_dmg = light_bullet_dmg * 2
					if creator != obj_player.id
					{
					scale = max(4,scale)
					light_bullet_dmg = max(30,light_bullet_dmg)
					}
					creator = obj_player.id
					fade_delay_timer = fade_delay * 60
					if faction != "ally"
					{
						faction = "ally"
						with obj_player
						{
							show_debug_message(hp)
							hp += 10
							if hp > max_hp
							{
								hp = max_hp
							}
							alarm[7] -= 30
							alarm[5] -= 60
							show_debug_message(hp)
						}
					}
				}
				if object_index = obj_aoe_explosive
				{
					creator = obj_player.id
					scale += 0.2
					explosion_force += 2
					explosion_damage += 20
					explosion_size += 0
					crash_damage = explosion_damage * 0.25
					if faction != "ally"
					{
						faction = "ally"
						with obj_player
						{
							// show_debug_message(hp)
							hp += 10
							if hp > max_hp
							{
								hp = max_hp
							}
							alarm[7] -= 30
							alarm[5] -= 60
							// show_debug_message(hp)
						}
					}
				}
			}
		}
}
}