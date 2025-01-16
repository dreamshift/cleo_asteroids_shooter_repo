explosion_size_grow += 0.015 * explosion_size
if explosion_size_grow < 0.015
{
	explosion_size_grow = 0.015
}
image_alpha -= 0.1 / explosion_size

image_xscale = explosion_size + explosion_size_grow
image_yscale = explosion_size + explosion_size_grow
image_scale = explosion_size + explosion_size_grow

if image_alpha <= 0
{
	instance_destroy()
}
