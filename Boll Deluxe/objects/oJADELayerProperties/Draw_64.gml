draw_gui(x-3,y-3,image_xscale+6,image_yscale+6,oJADEController.themeaccent4,1,true)

draw_rect(x-2,y+16,image_xscale+4,2,oJADEController.themeaccent3,1)

draw_set_font(global.rulerGold)

draw_text(x,y+2,$"{selected_layer.name} - Tile Layer Properties")

selected_layer.name = JADEstringinput(x,y+24,"Layer Name", selected_layer.name, 201,128)

draw_set_font(global.rulerGold)

draw_text(x,y+50,$"Tileset: {selected_layer.tileset_info[2]}")

tilesetselector.draw();

//preview
var width = 256;
var height = 256;
draw_rect(x-1,y-1+86,width+2,height+2,c_white,1,true)
draw_rect(x,y+86,width,height,oJADEController.themeaccent2,1,false)
		
var scissor = gpu_get_scissor();
gpu_set_scissor(x,y+86,width,height)
		
draw_sprite(selected_layer.sprite,0,x,y+86)
gpu_set_scissor(scissor);