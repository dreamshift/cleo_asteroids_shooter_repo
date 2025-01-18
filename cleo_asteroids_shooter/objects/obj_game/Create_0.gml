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
				type : obj_enemy_basic,
				preplaced : false, // false makes enemies appear randomly along screen edges, true is for preset positions and not coded yet
				maxcount : 6,
				mincount : 3
			}
		]
	},
	{ // 6-10. basic, basic_elite
		desc : "6-10. basic, basic_elite",
		timer : 12, 
		maxwave : 10,
		minwave : 6,
		enemylist : 2,
		enemies : [
			{
				type : obj_enemy_basic,
				preplaced : false,
				maxcount : 4,
				mincount : 2
			},
			{
				type : obj_enemy_basic_elite,
				preplaced : false,
				maxcount : 2,
				mincount : 1
			}
		]
	},
	{ // 10-12. ranged
		desc : "10-12. ranged",
		timer : 12, 
		maxwave : 12,
		minwave : 10,
		enemylist : 1,
		enemies : [
			{
				type : obj_enemy_ranged,
				preplaced : false,
				maxcount : 4,
				mincount : 2
			}
		]
	},
	{ // 13. ranged elites
		desc : "13. ranged elites",
		timer : 20, 
		maxwave : 13,
		minwave : 13,
		enemylist : 1,
		enemies : [
			{
				type : obj_enemy_ranged_elite,
				preplaced : false,
				maxcount : 2,
				mincount : 2
			}
		]
	},
	{ // 14-17. more basic, basic_elite
		desc : "14-17. more basic, basic_elite",
		timer : 20, 
		maxwave : 17,
		minwave : 14,
		enemylist : 2,
		enemies : [
			{
				type : obj_enemy_basic,
				preplaced : false,
				maxcount : 7,
				mincount : 5
			},
			{
				type : obj_enemy_basic_elite,
				preplaced : false,
				maxcount : 3,
				mincount : 2
			}
		]
	},
	{ // 14-17. ranged, basic elite
		desc : "14-17. ranged, basic elite",
		timer : 20, 
		maxwave : 17,
		minwave : 14,
		enemylist : 2,
		enemies : [
			{
				type : obj_enemy_basic_elite,
				preplaced : false,
				maxcount : 3,
				mincount : 2
			},
			{
				type : obj_enemy_ranged,
				preplaced : false,
				maxcount : 9,
				mincount : 7
			}
		]
	},
	{ // 18-21. ranged elite, basic elite, basic
		desc : "18-21. ranged elite, basic elite, basic",
		timer : 20, 
		maxwave : 21,
		minwave : 18,
		enemylist : 3,
		enemies : [
			{
				type : obj_enemy_basic,
				preplaced : false,
				maxcount : 7,
				mincount : 5
			},
			{
				type : obj_enemy_basic_elite,
				preplaced : false,
				maxcount : 3,
				mincount : 2
			},
			{
				type : obj_enemy_ranged_elite,
				preplaced : false,
				maxcount : 3,
				mincount : 2
			}
		]
	},
	{ // 18-21. many basic, ranged elite
		desc : "18-21. many basic, ranged elite",
		timer : 20, 
		maxwave : 21,
		minwave : 18,
		enemylist : 2,
		enemies : [
			{
				type : obj_enemy_basic,
				preplaced : false,
				maxcount : 16,
				mincount : 12
			},
			{
				type : obj_enemy_ranged_elite,
				preplaced : false,
				maxcount : 3,
				mincount : 2
			}
		]
	},
	{ // 22. cannon
		desc : "22. cannon",
		timer : 10, 
		maxwave : 22,
		minwave : 22,
		enemylist : 1,
		enemies : [
			{
				type : obj_enemy_cannon,
				preplaced : false,
				maxcount : 1,
				mincount : 1
			},
		]
	},
	{ // 23-24. multiple cannons
		desc : "23-24. multiple cannons",
		timer : 16, 
		maxwave : 24,
		minwave : 23,
		enemylist : 1,
		enemies : [
			{
				type : obj_enemy_cannon,
				preplaced : false,
				maxcount : 3,
				mincount : 2
			},
		]
	},
	{ // 25-28. cannon, many basic
		desc : "25-28. cannon, many basic",
		timer : 28, 
		maxwave : 28,
		minwave : 25,
		enemylist : 2,
		enemies : [
			{
				type : obj_enemy_cannon,
				preplaced : false,
				maxcount : 2,
				mincount : 1
			},
			{
				type : obj_enemy_basic,
				preplaced : false,
				maxcount : 10,
				mincount : 6
			},
		]
	},
	{ // 25-28. cannon, few basic elite
		desc : "25-28. cannon, few basic elite",
		timer : 28, 
		maxwave : 28,
		minwave : 25,
		enemylist : 2,
		enemies : [
			{
				type : obj_enemy_cannon,
				preplaced : false,
				maxcount : 2,
				mincount : 1
			},
			{
				type : obj_enemy_basic_elite,
				preplaced : false,
				maxcount : 3,
				mincount : 2
			},
		]
	},
	{ // 25-28. ranged, cannon, basic elite
		desc : "25-28. ranged, cannon, basic elite",
		timer : 28, 
		maxwave : 28,
		minwave : 25,
		enemylist : 3,
		enemies : [
			{
				type : obj_enemy_cannon,
				preplaced : false,
				maxcount : 1,
				mincount : 1
			},
			{
				type : obj_enemy_basic_elite,
				preplaced : false,
				maxcount : 2,
				mincount : 2
			},
						{
				type : obj_enemy_ranged,
				preplaced : false,
				maxcount : 7,
				mincount : 5
			},
		]
	},
	{ // 25-28. many ranged elite, cannon
		desc : "25-28. many ranged elite, cannon",
		timer : 28, 
		maxwave : 28,
		minwave : 25,
		enemylist : 2,
		enemies : [
			{
				type : obj_enemy_cannon,
				preplaced : false,
				maxcount : 2,
				mincount : 1
			},
			{
				type : obj_enemy_ranged_elite,
				preplaced : false,
				maxcount : 5,
				mincount : 4
			},
		]
	},
	{ // 29. basic, basic elite, ranged, ranged elite, cannon
		desc : "29. basic, basic elite, ranged, ranged elite, cannon",
		timer : 35, 
		maxwave : 29,
		minwave : 29,
		enemylist : 5,
		enemies : [
			{
				type : obj_enemy_basic,
				preplaced : false,
				maxcount : 4,
				mincount : 4
			},
			{
				type : obj_enemy_basic_elite,
				preplaced : false,
				maxcount : 2,
				mincount : 2
			},
			{
				type : obj_enemy_ranged,
				preplaced : false,
				maxcount : 4,
				mincount : 4
			},
			{
				type : obj_enemy_ranged_elite,
				preplaced : false,
				maxcount : 3,
				mincount : 3
			},
			{
				type : obj_enemy_cannon,
				preplaced : false,
				maxcount : 1,
				mincount : 1
			},
		]
	},
	{ // 30-31. ranged, this is a break after waves 25-29
		desc : "30-31. ranged, this is a break after waves 25-29",
		timer : 12, 
		maxwave : 31,
		minwave : 30,
		enemylist : 1,
		enemies : [
			{
				type : obj_enemy_ranged,
				preplaced : false,
				maxcount : 3,
				mincount : 1
			},
		]
	},
	{ // 32-33. basic, ranged elite, still kinda a break
		desc : "32-33. basic, ranged elite, still kinda a break",
		timer : 24, 
		maxwave : 33,
		minwave : 32,
		enemylist : 2,
		enemies : [
			{
				type : obj_enemy_ranged_elite,
				preplaced : false,
				maxcount : 4,
				mincount : 3
			},
			{
				type : obj_enemy_basic,
				preplaced : false,
				maxcount : 7,
				mincount : 4
			},
		]
	},	
	{ // 34. cannon elite, somewhat of a boss enemy
		desc : "34. cannon elite, somewhat of a boss enemy",
		timer : 28, 
		maxwave : 34,
		minwave : 34,
		enemylist : 1,
		enemies : [
			{
				type : obj_enemy_cannon_elite,
				preplaced : false,
				maxcount : 1,
				mincount : 1
			},
		]
	},
	{ // 35. cannon elite, many basic
		desc : "35. cannon elite, many basic",
		timer : 28, 
		maxwave : 35,
		minwave : 35,
		enemylist : 2,
		enemies : [
			{
				type : obj_enemy_cannon_elite,
				preplaced : false,
				maxcount : 1,
				mincount : 1
			},
			{
				type : obj_enemy_basic,
				preplaced : false,
				maxcount : 16,
				mincount : 12
			},
		]
	},
	{ // 36. cannon elite, basic elite
		desc : "36. cannon elite, basic elite, basic",
		timer : 28, 
		maxwave : 36,
		minwave : 36,
		enemylist : 3,
		enemies : [
			{
				type : obj_enemy_cannon_elite,
				preplaced : false,
				maxcount : 1,
				mincount : 1
			},
			{
				type : obj_enemy_basic_elite,
				preplaced : false,
				maxcount : 4,
				mincount : 3
			},
			{
				type : obj_enemy_basic,
				preplaced : false,
				maxcount : 12,
				mincount : 8
			},
		]
	},
]

chosen_wave = array_get(preset_waves,0)