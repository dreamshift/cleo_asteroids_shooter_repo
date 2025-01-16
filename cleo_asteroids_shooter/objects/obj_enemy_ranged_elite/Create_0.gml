event_inherited();

max_hp = 80
hp = max_hp
crash_damage = 5
speed_cap = 1.5

enemy_thrust = 0.5
enemy_strafe = 0.35
enemy_friction = 0.015
light_bullet_rof = 0.2

alarm[1] = random_range(1,60/2/light_bullet_rof) + 60
alarm[0] = random_range(60,180)

strafe = choose(-90,90)