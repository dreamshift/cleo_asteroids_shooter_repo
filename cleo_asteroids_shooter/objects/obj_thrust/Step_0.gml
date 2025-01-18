image_angle += random_range(-12,12)
image_alpha += fade
if image_alpha <= 0
{
	instance_destroy()
}

if speed > 6
{
	speed *= 0.97
}

motion_add(random_accel_dir,random_accel)