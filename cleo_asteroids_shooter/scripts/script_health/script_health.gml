// clamps hp
// destroys object if hp = 0
function script_health(
_explode = false,
_sound_min_pitch = 1,
_sound_max_pitch = 1,
_sound_gain = 1,)
{

hp = clamp(hp,0,max_hp)

if hp = 0 {
	if _explode = true
	{
		var _sound_bomb_explode_pitch = (random_range(_sound_min_pitch, _sound_max_pitch));
		audio_play_sound(snd_bomb_explode,0,0,_sound_gain,0,_sound_bomb_explode_pitch)
		var _explosion_new = instance_create_layer(x,y,"Instances",obj_explosion)
	}
	if object_index = obj_player
	{
		instance_deactivate_object(obj_player)
	}
	else
	{
		instance_destroy()
	}
}

}