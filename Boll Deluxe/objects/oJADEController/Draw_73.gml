#region Cursor Drawing
//Draw object
var obj=selected_obj
var drawx = gridx*16
var drawy = gridy*16
if (obj!=-1) {
	draw_sprite_ext(obj.sprite,0,drawx+obj.xoff,drawy+obj.yoff,(1*obj.sizex),(1*obj.sizey),0,c_white,0.5);
}
#endregion