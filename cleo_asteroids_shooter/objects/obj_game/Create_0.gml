randomize()
alarm[0] = 60 * 5
wave_number = 0 // will start the wave just after the one you put in
game_start_cooldown = true
progress_waves = false
frame = 0
play_this_wave = false

preset_waves = [
	{ // 0-5. basic
		desc : "0-5. basic",
		timer : 8, // time in seconds before the next wave is force spawned, NO enemies on screen to have the next wave spawn early
		maxwave : 5,
		minwave : 0,
		enemylist : 1,
		enemies : [
			{
				type : obj_test_enemy,
				preplaced : false, // false makes enemies appear randomly along screen edges, true is for preset positions and not coded yet
				maxcount : 1,
				mincount : 1
			}
		]
	},
]

chosen_wave = array_get(preset_waves,0)