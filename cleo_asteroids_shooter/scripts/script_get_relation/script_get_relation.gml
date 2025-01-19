
function script_get_relation(_entity_struct){

var _relation = variable_struct_get(variable_struct_get(global.faction_pairs,faction),_entity_struct.entity_faction)

return(_relation)

}