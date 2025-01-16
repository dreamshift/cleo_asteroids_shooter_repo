var _id = id
var _flicker_chance = irandom_range(1,15)

if _flicker_chance = 1
{
	player_ship_sightline_flicker = -0.08
}
else
{
	player_ship_sightline_flicker = 0
}

// obviously we'd like the player to be able to die
// and we also don't want the player to get health over their max

if hp <= 0
{
	audio_play_sound(snd_bomb_explode,0,0)
	var _explosion_new = instance_create_layer(x,y,"Instances",obj_explosion)
	instance_deactivate_object(obj_player)
}

if hp > max_hp
{
	hp = max_hp
}

// soft capping the speed, and making it scale based on thrust power

player_ship_speed_cap = player_ship_thrust * sqrt(player_ship_thrust*0.2) + 2
if speed > player_ship_speed_cap and alarm[5] < 30 * player_ship_strafe_cooldown
{
	speed *= 0.97
}
else if speed > player_ship_speed_cap * 2
{
	speed *= 0.97
}

// friction

if speed > 0
{
	speed -= 1 - player_ship_friction
}

// now, let's work on controls
// we want the player to look at the mouse cursor, we'll just set the image angle to whatever the calculated direction is with a function
// and we also want the player to accelerate whenever left click is pressed, we'll do that with another function

image_angle = point_direction(x,y,mouse_x,mouse_y)

// horrifically, i'm using the image angle as the direction to accelerate in instead of just directly grabbing the direction to the mouse again

if mouse_check_button(mb_left)
{
	motion_add(image_angle,player_ship_thrust/20)	// apply force
	
	{
	var _sound_thrust_pitch = (random_range(0.75, 1.75));
	audio_sound_pitch(snd_thrust, _sound_thrust_pitch);
	audio_play_sound(snd_thrust, 0, 0, 1.0, 0, 1.0);
	
	repeat(1)
	{
	var _newthrust = instance_create_layer(x + 0, y + 0, "Instances", obj_thrust);
	with(_newthrust) 
	{
		direction = obj_player.image_angle + random_range(-25, 25) + 180
		speed = random_range(2, 6)
		motion_set(direction, speed)
		motion_add(obj_player.direction,obj_player.speed)
		creator = _id
		faction = "ally"
	}
	}
	}
}

// we want the 1, 2 and 3 buttons to switch between the three weapons

if (keyboard_check_pressed(ord("1"))) and alarm[6] <= 1
{
	alarm[6] = 10
	player_ship_selected_weapon = 1
}

if (keyboard_check_pressed(ord("2"))) and alarm[6] <= 1
{
	alarm[6] = 25
	player_ship_selected_weapon = 2
}

if (keyboard_check_pressed(ord("3"))) and alarm[6] <= 1
{
	alarm[6] = 10
	player_ship_selected_weapon = 3
}

if alarm[5] <= 1
{
if keyboard_check_pressed(ord("W")) 
{
	alarm[5] = 60 * player_ship_strafe_cooldown
	speed = speed* 0.5
	motion_add(image_angle,player_ship_thrust*0.75+1.5)
{
	var _sound_thrust_pitch = (random_range(1, 1.25));
	audio_sound_pitch(snd_thrust, _sound_thrust_pitch);
	audio_play_sound(snd_thrust, 0, 0, 5.0, 0, 1.0);
	
	repeat(8)
	{
	var _newthrust = instance_create_layer(x + 0, y + 0, "Instances", obj_thrust);
	with(_newthrust) 
	{
		direction = obj_player.image_angle + random_range(-90, 90) + 180
		speed = random_range(1, 3)
		motion_set(direction, speed)
	}
	}
	}
}

if keyboard_check_pressed(ord("A")) 
{
	alarm[5] = 60 * player_ship_strafe_cooldown	
	speed = speed* 0.5
	motion_add(image_angle+90,player_ship_thrust*0.75+1.5)
{
	var _sound_thrust_pitch = (random_range(1, 1.25));
	audio_sound_pitch(snd_thrust, _sound_thrust_pitch);
	audio_play_sound(snd_thrust, 0, 0, 5.0, 0, 1.0);
	
	repeat(8)
	{
	var _newthrust = instance_create_layer(x + 0, y + 0, "Instances", obj_thrust);
	with(_newthrust) 
	{
		direction = obj_player.image_angle + random_range(-90, 90) - 90
		speed = random_range(1, 3)
		motion_set(direction, speed)
	}
	}
	}
}

if keyboard_check_pressed(ord("S")) 
{
	alarm[5] = 60 * player_ship_strafe_cooldown	
	speed = speed* 0.5
	motion_add(image_angle+180,player_ship_thrust*0.75+1.5)
{
	var _sound_thrust_pitch = (random_range(1, 1.25));
	audio_sound_pitch(snd_thrust, _sound_thrust_pitch);
	audio_play_sound(snd_thrust, 0, 0, 5.0, 0, 1.0);
	
	repeat(8)
	{
	var _newthrust = instance_create_layer(x + 0, y + 0, "Instances", obj_thrust);
	with(_newthrust) 
	{
		direction = obj_player.image_angle + random_range(-90, 90)
		speed = random_range(1, 3)
		motion_set(direction, speed)
	}
	}
	}
}

if keyboard_check_pressed(ord("D")) 
{
	alarm[5] = 60 * player_ship_strafe_cooldown	
	speed = speed* 0.5
	motion_add(image_angle-90,player_ship_thrust*0.75+1.5)
{
	var _sound_thrust_pitch = (random_range(1, 1.25));
	audio_sound_pitch(snd_thrust, _sound_thrust_pitch);
	audio_play_sound(snd_thrust, 0, 0, 5.0, 0, 1.0);
	
	repeat(8)
	{
	var _newthrust = instance_create_layer(x + 0, y + 0, "Instances", obj_thrust);
	with(_newthrust) 
	{
		direction = obj_player.image_angle + random_range(-90, 90) + 90
		speed = random_range(1, 3)
		motion_set(direction, speed)
	}
	}
	}
}
}

// then we need to do a lot of stuff related to firing bullets... uhhgg...
if mouse_check_button(mb_right) if player_ship_selected_weapon = 1
{
	if alarm[1] <= 1
	{
		var _light_bullet_sound_pitch = player_ship_light_bullet_rof / 16 + 0.5
		motion_add(image_angle+180,0.15)
		audio_sound_pitch(snd_light_bullet_shoot,random_range(_light_bullet_sound_pitch-0.1,_light_bullet_sound_pitch+0.1))
		audio_play_sound(snd_light_bullet_shoot,0,0,0.7)
		audio_play_sound(snd_light_bullet_shoot,0,0,0.7)

		alarm[1] = 60 / player_ship_light_bullet_rof
		var _light_bullet_new = instance_create_layer(x,y,"Instances",obj_light_bullet)
		with _light_bullet_new
		{
			motion_set(obj_player.image_angle,6)
			motion_add(obj_player.direction,obj_player.speed/2)
			faction = "ally"
			creator = _id
		}
		repeat 1
		{
			var _debris_new = instance_create_layer(x,y,"Instances",obj_debris)
			with _debris_new
			{
				image_angle = obj_player.image_angle + random_range(-15,15)
				motion_set(image_angle,random_range(2.5,3.5))
				motion_add(obj_player.direction,obj_player.speed)
				debris_fade_time = 1
				creator = _id
			}
		}
	}
}

if mouse_check_button(mb_right) if player_ship_selected_weapon = 2
{
	if alarm[2] <= 1
	{
		motion_add(image_angle+180,0.5)
		audio_sound_pitch(snd_bomb_drop,random_range(0.9,1.1))
		audio_play_sound(snd_bomb_drop,0,0)
		alarm[2] = 60 / player_ship_aoe_explosive_rof
		var _aoe_explosive_new = instance_create_layer(x,y,"Instances",obj_aoe_explosive)
		with _aoe_explosive_new
		{
			motion_set(obj_player.image_angle,4)
			motion_add(obj_player.direction,obj_player.speed)
			faction = "ally"
			explosion_size = 1.8
		}
		repeat random_range(2,5)
		{
			var _debris_new = instance_create_layer(x,y,"Instances",obj_debris)
			with _debris_new
			{
				image_angle = obj_player.image_angle + random_range(-45,45)
				motion_set(image_angle,random_range(0.5,4))
				motion_add(obj_player.direction,obj_player.speed)
				debris_fade_time = 1
				creator = _id
			}
		}
	}
}

if mouse_check_button(mb_right) if player_ship_selected_weapon = 3
{
	if alarm[3] <= 1
	{
		motion_set(direction,speed*0.8)
		motion_add(image_angle+180,speed*0.3+2)
		audio_play_sound(snd_heavy_bullet_shoot,0,0)
		alarm[3] = 60 / player_ship_heavy_bullet_rof
		var _heavy_bullet_new = instance_create_layer(x,y,"Instances",obj_heavy_bullet)
		with _heavy_bullet_new
		{
			image_angle = obj_player.image_angle
			faction = "ally"
			creator = _id
			var _heavy_bullet_dmg = heavy_bullet_dmg
		}
		repeat 20
		{
			var _debris_new = instance_create_layer(x,y,"Instances",obj_debris)
			with _debris_new
			{
				image_angle = obj_player.image_angle + random_range(-3,3)
				motion_set(image_angle,random_range(5,80))
				debris_fade_time = 0.5
				debris_damage = _heavy_bullet_dmg / 60
				creator = _id
			}
		}
		repeat random_range(1,3)
		{
			var _debris_new = instance_create_layer(x,y,"Instances",obj_debris)
			with _debris_new
			{
				image_angle = obj_player.image_angle + random_range(-70,70)
				motion_set(image_angle,random_range(0.5,5))
				debris_fade_time = 0.8
				creator = _id
			}
		}
	}
}

if keyboard_check_pressed(ord("F"))
{
	if alarm[7] <= 1
	{
		alarm[7] = 60 / player_ship_energy_blast_rof
		var _energy_blast_new = instance_create_layer(x,y,"Instances",obj_energy_blast)
		with _energy_blast_new
		{
			image_angle = obj_player.image_angle
		}
	}
	
}

// misc

move_wrap(1,1,sprite_width/2)