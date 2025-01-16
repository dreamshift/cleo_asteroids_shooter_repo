rotation_speed = random_range(-5,5)

// multiplier of the sprite size btw
aoe_explosive_push_distance = 15

aoe_explosive_friction = 0.02

// in seconds
aoe_explosive_timer_length = 1
alarm[0] = 60 * aoe_explosive_timer_length
alarm[1] = 60 * aoe_explosive_timer_length
alarm[3] = 6

scale = 1
explosion_force = 1
explosion_damage = 40
explosion_size = 1 // this is overridden by enemies when they fire an explosive, this value is just a default
crash_damage = explosion_damage * 0.25

max_hp = 30
hp = max_hp
type = "aoe_explosive"
faction = "neutral"
uncollidable = true 
alarm[2] = 10
image_speed = 0