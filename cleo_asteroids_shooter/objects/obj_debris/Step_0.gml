image_alpha -= 0.01 / debris_fade_time
if image_alpha <= 0
{
	instance_destroy()
}

speed *= 0.99

//move_wrap(1,1,sprite_width/2)