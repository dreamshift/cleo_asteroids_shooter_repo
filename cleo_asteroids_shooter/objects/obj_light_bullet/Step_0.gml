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
	image_xscale -= 0.08
	image_yscale = image_xscale
}
if fade_delay_timer > 30
{
	image_xscale = scale
	image_yscale = scale
}

if image_xscale <= 0
{
	alarm[0] = 1
}

if screenwrap = true
{
	move_wrap(1,1,sprite_width/2)
}