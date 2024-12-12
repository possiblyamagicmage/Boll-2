varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float time;
uniform vec3 wave_data; // x = amplitude, y = wavelength, z = frequency
uniform float array_xOffsets[256];
uniform float array_yOffsets[256];

// UV vectors, so visuals don't wig out in texture pages
uniform vec2 u_uv;
uniform vec2 u_uv_x;
/*
#define A 0.02  //(A)mplitude
#define W 32.0  //(W)avelength
#define F 0.1  //(F)requency
*/
void main() {
	
	float alpha = texture2D(gm_BaseTexture, v_vTexcoord).a;
	
	
	float xx = (u_uv_x[1] - u_uv_x[0]);
	float yy = (u_uv[1] - u_uv[0]);
	float ipos = (v_vTexcoord.y - u_uv[0]);
	
	float pos = ipos / yy;
	
	int i = int(max(0.0, min(256.0, pos * 256.0)));
	float offset = (array_yOffsets[i] / 256.0);
	float fin_offset = (min(1.0, float(i) / 256.0) + offset);
	
	float V = (-v_vTexcoord.y) + (fin_offset * yy);
	
	// get xoffset as prelim
	float xoff = (array_xOffsets[i] * xx);
	
	//new (T)exture coordinates
	vec2 T = v_vTexcoord + vec2(xoff, V);
	float fin_y = (T.y - u_uv[0]) / yy;
	float fin_x = (T.x - u_uv_x[0]) / xx;
	
	vec4 texColor = texture2D(gm_BaseTexture, T);
	
	// if we're clipping out of bounds, don't draw the pixel
	if (((fin_y > 1.0)||(fin_y < 0.0))
		||((fin_x > 1.0)||(fin_x < 0.0)))
	{
		texColor.a = 0.0;
	}
	
	
	gl_FragColor = v_vColour * texColor;
}