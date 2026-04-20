if (timer > 20 || owner == noone) {
	instance_destroy();
}

var _star_shine_offset = (((global.roomTimer + creation_time_snap) * 1.5) + (((global.roomTimer / 3) mod 5) * 16)) * 2,
	_cSize = (owner.bbox_bottom - owner.bbox_top) - ((timer / 23) * 8),
	
	_xoffset = dcos(_star_shine_offset) * _cSize,
	_yoffset =-dsin(_star_shine_offset) * _cSize;

x = xstart + _xoffset;
y = ystart + _yoffset;

timer += 1;