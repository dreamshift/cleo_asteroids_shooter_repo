aoe_explosive_push = scale

fade_delay_timer -= (1 * scale / 2) + 0.5

if fade_delay_timer > fade_delay * 60
{
	fade_delay_timer = fade_delay * 60
}
if fade_delay_timer <= 0
{
	fade_delay_timer = 0
}

if fade_delay_timer <= 1
{
	scale -= 0.08
}
if fade_delay_timer > 30
{
	scale = start_scale
}
image_xscale = scale
image_yscale = scale
var _speed_scaled = speed / 24
var _length_scale = lerp(1,8,_speed_scaled)
if do_length_scale = true
{
image_xscale = scale * _length_scale
}

if image_xscale <= 0
{
	alarm[0] = 1
}

if screenwrap = true
{
	move_wrap(1,1,sprite_width/2)
}