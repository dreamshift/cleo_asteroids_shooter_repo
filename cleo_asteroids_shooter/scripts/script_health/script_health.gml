// clamps hp
// destroys object if hp = 0
function script_health(){

hp = clamp(hp,0,max_hp)

if hp = 0 {
	instance_destroy()
}

}