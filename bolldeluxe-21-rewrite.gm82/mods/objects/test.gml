#define create
sprite_index = spr_empty
player.hsp=10

#define step
if place_meeting(player.x,player.y+1,collider)
{
	player.vsp=-6
}



#define draw
draw_text_transformed(x,y,"hiiii :PPP im a custom object!!!",1,1,wave_val(-45,45,2,0))