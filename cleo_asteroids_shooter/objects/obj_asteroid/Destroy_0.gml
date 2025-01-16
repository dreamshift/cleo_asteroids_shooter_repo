audio_sound_pitch(snd_asteroid_break,random_range(0.8+break_pitch_bias,1.2+break_pitch_bias))
audio_play_sound(snd_asteroid_break,0,0,1-break_pitch_bias)

repeat 15
	{
		var _asteroid_speed = speed
		var _asteroid_direction = direction
		var _debris_new = instance_create_layer(x,y,"Instances",obj_debris)
		with _debris_new
		{
			motion_add(_asteroid_direction,_asteroid_speed)
		}
	}

if irandom_range(1,2) = 1 and image_xscale > 0.5 and asteroid_splinters = true
{
	var _x = x
	var _y = y
	var _image_xscale = image_xscale
	var _max_hp = max_hp
	var _break_pitch_bias = break_pitch_bias
	var _asteroid_new = instance_create_layer(x,y,"Instances",obj_asteroid)
	with _asteroid_new
	{
		y = _y + 15
		image_xscale = _image_xscale - 0.1
		image_yscale = _image_xscale - 0.1
		max_hp = _max_hp - 2
		break_pitch_bias = _break_pitch_bias + 0.3
	}
	var _asteroid_new = instance_create_layer(x,y,"Instances",obj_asteroid)
	with _asteroid_new
	{
		y = _y - 15
		image_xscale = _image_xscale - 0.1
		image_yscale = _image_xscale - 0.1
		max_hp = _max_hp - 2
		break_pitch_bias = _break_pitch_bias + 0.3
	}
}