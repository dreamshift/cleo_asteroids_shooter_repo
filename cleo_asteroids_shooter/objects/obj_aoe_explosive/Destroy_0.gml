repeat 30 * explosion_size
	{
		var _aoe_explosive_speed = speed
		var _aoe_explosive_direction = direction
		var _explosion_force = explosion_force
		var _debris_new = instance_create_layer(x,y,"Instances",obj_debris)
		with _debris_new
		{
			motion_add(_aoe_explosive_direction,_aoe_explosive_speed)
			speed += _explosion_force / 2 * random_range(0.1,1)
		}
	}