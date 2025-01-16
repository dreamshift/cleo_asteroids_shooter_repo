event_inherited();

max_hp = 300
hp = max_hp
crash_damage = 30
hard_speed_cap = 2
speed_cap = 1.2
rotation = 0
rotation_cap = 2
rotation_acceleration = 3 / 100

enemy_thrust = 1
enemy_friction = 0.02
aoe_explosive_rof = 1 * 0.8

alarm[1] = random_range(1,60/2/aoe_explosive_rof) + 60
alarm[0] = random_range(60,180)
barrel = "primary"