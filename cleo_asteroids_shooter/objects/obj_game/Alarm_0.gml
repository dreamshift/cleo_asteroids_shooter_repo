alarm[0] = 60 * 2
var _rand_x = 0
var _rand_y = 0
repeat 1
{
	if irandom_range(1,2) = 1
	{
		if irandom_range(1,2) = 1
		{
			_rand_x = 0
		}
		else
		{
			_rand_x = room_width
		}
		_rand_y = random_range(0,room_height)
	}
	else
	{
		if irandom_range(1,2) = 1
		{
			_rand_y = 0
		}
		else
		{
			_rand_y = room_height
		}
		_rand_x = random_range(0,room_width)
	}
	instance_create_layer(_rand_x,_rand_y,"Instances",obj_asteroid)
}