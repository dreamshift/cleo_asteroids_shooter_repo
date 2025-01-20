randomize()
alarm[0] = 60 * 5
wave_number = 0 // will start the wave just after the one you put in
game_start_cooldown = true
progress_waves = false
frame = 0
play_this_wave = false

{ // faction pairs
global.faction_pairs = {

incon : {
	incon  : {flee : 0.0, attack : 0.0, heal : 0.5, ignore : 0.5},
	etech  : {flee : 0.0, attack : 1.0, heal : 0.0, ignore : 0.0},
	passive: {flee : 0.0, attack : 1.0, heal : 0.0, ignore : 0.0},
},
etech : {
	incon  : {flee : 0.2, attack : 0.8, heal : 0.0, ignore : 0.0},
	etech  : {flee : 0.0, attack : 0.0, heal : 0.8, ignore : 0.2},
	passive: {flee : 0.0, attack : 0.0, heal : 0.1, ignore : 0.9},
},
passive : {
	incon  : {flee : 0.9, attack : 0.1, heal : 0.0, ignore : 0.0},
	etech  : {flee : 0.5, attack : 0.0, heal : 0.0, ignore : 0.5},
	passive: {flee : 0.1, attack : 0.1, heal : 0.1, ignore : 0.7},
},

}
}

{ // waves array
preset_waves = [
	{ // 0-50. basic
		desc : "0-50. basic",
		timer : 8, // time in seconds before the next wave is force spawned, NO enemies on screen to have the next wave spawn early
		maxwave : 50,
		minwave : 0,
		enemylist : 1,
		enemies : [
			{
				type : obj_test_enemy,
				preplaced : false, // false makes enemies appear randomly along screen edges, true is for preset positions and not coded yet
				maxcount : 10,
				mincount : 10
			}
		]
	},
]
chosen_wave = array_get(preset_waves,0)
}