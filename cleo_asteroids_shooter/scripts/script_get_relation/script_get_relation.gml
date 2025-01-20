// takes a specific entity's info package and returns the faction relation between the current object and other object
// you don't wanna give it entity_place_info, instead give it ds_list_find_value(entity_place_info,i)

function script_get_relation(_entity_struct) {
	var _entity_faction = variable_struct_get(_entity_struct, entity_faction)
	return global.faction_pairs[$ faction][$ _entity_faction];
}

