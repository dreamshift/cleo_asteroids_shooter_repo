// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_entity_place_list(_object_check = obj_faction,_sprite_collision_mask = sprite_index,_sprite_collision_mask_scale = 1,_ordered = true)
{
	
	var _place_entity_list = ds_list_create()
	var _sprite_index = sprite_index
	var _image_index = image_index
	sprite_index = _sprite_collision_mask
	image_xscale = _sprite_collision_mask_scale
	image_yscale = _sprite_collision_mask_scale
	instance_place_list(x,y,_object_check,_place_entity_list,_ordered)
	image_xscale = 1
	image_yscale = 1
	sprite_index = _sprite_index
	image_index = _image_index
	
	return(_place_entity_list)
}