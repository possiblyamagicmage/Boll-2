if (egg == "3") {
	var sprInfo = sprite_get_info(sprite_index);
	sprite_prefetch(sBlast1)
	
	game_set_speed(30,gamespeed_fps)
	sprite_index = sBlast1                       //the smaller the multiplier, the larger the image 
	ysc = sprite_get_height(sprite_index) * 1.75 //the division at draw makes it larger instead of smaller
	                                             //multiplying by 1 will stretch the image 3 times vertically
	xsc = sprite_get_width(sprite_index) //TODO: replace these with sprInfo.sprite_width, no idea what the key is though
	hsp = sprInfo.num_subimages
} else {
	boll = makeboll()
	//how do i draw this???
}