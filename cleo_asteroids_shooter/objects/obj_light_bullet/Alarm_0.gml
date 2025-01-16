split = false
if alarm0ran = true
{
	exit
}
alarm0ran = true
if fade_delay_timer > 1
{
	repeat 5
	{
		var _light_bullet_speed = speed
		var _light_bullet_direction = direction
		var _debris_new = instance_create_layer(x,y,"Instances",obj_debris)
		with _debris_new
		{
			motion_add(_light_bullet_direction,_light_bullet_speed)
		}
	}
}

if image_xscale > 3
{


var _explosion_force = 0.5
var _explosion_damage = light_bullet_dmg / 2
var _explosion_size = 0.75
var _faction = faction

audio_sound_pitch(snd_bomb_explode,random_range(1.2,1.4))
audio_play_sound(snd_bomb_explode,0,0,0.5)

var _explosion_new = instance_create_layer(x,y,"Instances",obj_explosion)
with _explosion_new
{
	explosion_force = _explosion_force
	explosion_damage = _explosion_damage
	explosion_size = _explosion_size
	faction = _faction
}

} // if scale > 3

instance_destroy()