var _explosion_force = explosion_force
var _explosion_damage = explosion_damage
var _explosion_size = explosion_size
var _faction = faction

audio_sound_pitch(snd_bomb_explode,random_range(0.95,1.05))
audio_play_sound(snd_bomb_explode,0,0)

var _explosion_new = instance_create_layer(x,y,"Instances",obj_explosion)
with _explosion_new
{
	explosion_force = _explosion_force
	explosion_damage = _explosion_damage
	explosion_size = _explosion_size
	faction = _faction
}
instance_destroy()