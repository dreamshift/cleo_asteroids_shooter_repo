// hologram to show the line of sight if weapon 3 is selected

if player_ship_selected_weapon = 3
{
	draw_sprite_ext(spr_heavy_bullet,1,x,y,500,1,image_angle,c_white,0.1-player_ship_sightline_flicker)
}

draw_self()

draw_text_transformed(x-8,y+8,round(hp),0.5,0.5,0)