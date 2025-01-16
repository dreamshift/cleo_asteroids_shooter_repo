if image_alpha < 1
{
	image_alpha += 0.03
}

if hp <= 0
{
	instance_destroy()
}
if hp > max_hp
{
	hp = max_hp
}

move_wrap(1,1,sprite_width/2)
image_angle += rotation_speed

if speed >= speed_cap
{
	speed *= 0.98
}