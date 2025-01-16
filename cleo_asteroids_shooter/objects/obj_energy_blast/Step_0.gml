speed = 0
if image_alpha <= 0
{
	instance_destroy()
}
if image_alpha > 0.5
{
	image_alpha -= 0.15
}
else
{
	image_alpha -= 0.05
}

if not instance_exists(obj_player)
{
	exit
}

image_angle = obj_player.image_angle
x = obj_player.x
y = obj_player.y