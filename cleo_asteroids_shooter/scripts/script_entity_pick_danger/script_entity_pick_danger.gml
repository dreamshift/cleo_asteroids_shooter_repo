// takes a list of entity info packages, entity_place_info, and returns a single entity package
// picks an entity based on danger level, weighted

function script_entity_pick_danger(_entity_place_info){
if not ds_list_empty(_entity_place_info)
{	
	var _entity_place_info_size = ds_list_size(_entity_place_info) -1
	var _current_package = 0
	var _current_package_danger = 0
	var _danger_sum = 0
	for (var _iteration = 0; _iteration < _entity_place_info_size; ++_iteration)
	{
		_current_package = ds_list_find_value(_entity_place_info, _iteration)
		_current_package_danger = _current_package.entity_danger
		_danger_sum += _current_package_danger
	}
	var _picked_package = undefined
	while is_undefined(_picked_package)
	{
		// pick a random package
		_current_package = ds_list_find_value(_entity_place_info, irandom_range(0,_entity_place_info_size-1))
		_current_package_danger = _current_package.entity_danger
		var _random_danger_threshold = irandom_range(1,_danger_sum)
		if _random_danger_threshold < _current_package_danger
		{
			_picked_package = _current_package
		}
	}
	return(_picked_package)
}
}
