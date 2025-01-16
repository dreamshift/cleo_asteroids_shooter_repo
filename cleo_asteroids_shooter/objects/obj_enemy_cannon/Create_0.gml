event_inherited();

max_hp = 120
hp = max_hp
crash_damage = 15
speed_cap = 1.5
rotation = 0
rotation_cap = 1.5
rotation_acceleration = 5 / 100

enemy_thrust = 1.25
enemy_friction = 0.03
aoe_explosive_rof = 1 / 5

alarm[1] = random_range(1,60/2/aoe_explosive_rof) + 60
alarm[0] = random_range(60,180)
