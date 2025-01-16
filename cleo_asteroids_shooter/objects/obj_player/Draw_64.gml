draw_text(20,20,"player ship selected weapon")
switch player_ship_selected_weapon
{
	case 1:
	draw_text(20,40,player_ship_selected_weapon)
	draw_text(40,40,"(minigun)")
	break;
	
	case 2:
	draw_text(20,40,player_ship_selected_weapon)
	draw_text(40,40,"(explosive)")
	break;
	
	case 3:
	draw_text(20,40,player_ship_selected_weapon)
	draw_text(40,40,"(railgun)")
	break;
	
}
draw_text(20,60,"player health")
draw_text(20,80,round(hp))

draw_text(288,20,"CONTROLS:")
draw_text(288,40,"PRESS 1, 2, 3 ON YOUR KEYBOARD TO SWITCH WEAPONS!")
draw_text(288,60,"WASD to Strafe. Strafe is relative to ship rotation.")
draw_text(288,80,"Press F to Deflect projectiles in front of you.")
if obj_game.game_start_cooldown = true
{
	draw_text(288,120,"PRE-GAME TIPS:")
	draw_text(288,140,"YOUR WEAPONS WILL INTERACT WITH EACH OTHER!")
	draw_text(288,160,"Try sniping your explosive with your railgun.")
	draw_text(288,180,"Try splitting your minigun bullets with your railgun.")
}

