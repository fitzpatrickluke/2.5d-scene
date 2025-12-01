/// @param vbuffer
/// @param xx
/// @param yy
/// @param zz
/// @param ww
/// @param hh

function vertex_set_floor(argument0, argument1, argument2, argument3, argument4, argument5){
	var vbuffer = argument0;
	var xx = argument1;
	var yy = argument2;
	var zz = argument3;
	var ww = argument4;
	var hh = argument5;
	
	var z = 0;
	var num_ww = ww/24;
	var num_hh = hh/24;


	vertex_add_point(v_buffer, xx, yy, z, 0, 1, 0, 0, 0, c_blue, 1); // TL
	vertex_add_point(v_buffer, xx, yy+hh, z, 0, 1, 0, 0, 1, c_blue, 1); // TR
	vertex_add_point(v_buffer, xx+ww, yy+hh, z, 0, 1, 0, 1, 1, c_blue, 1); // BR

	vertex_add_point(v_buffer, xx+ww, yy+hh, z, 0, 1, 0, 1, 1, c_blue, 1); // TL
	vertex_add_point(v_buffer, xx, yy, z, 0, 1, 0, 0, 0, c_blue, 1); // BR
	vertex_add_point(v_buffer, xx+ww, yy, z, 0, 1, 0, 1, 0, c_blue, 1); // BL

}