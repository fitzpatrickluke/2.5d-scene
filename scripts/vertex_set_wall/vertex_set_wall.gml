/// @param vbuffer
/// @param xx
/// @param yy
/// @param zz
/// @param ww
/// @param hh
/// @param rot_offset

function vertex_set_wall(argument0, argument1, argument2, argument3, argument4, argument5, argument6){
	var v_buffer = argument0;
	var xx = argument1;
	var yy = argument2;
	var zz = argument3;
	var ww = argument4;
	var hh = argument5;

	var x1 = xx-ww;
	var y1 = yy;
	var x2 = xx;
	var z1 = zz;
	var z2 = zz+hh;


	// FRONT
	vertex_add_point(v_buffer, x1, yy, z2, 0, 0, -1, 0, 0, c_white, 1); // TL
	vertex_add_point(v_buffer, x1, yy, z1, 0, 0, -1, 0, 1, c_white, 1); // TR
	vertex_add_point(v_buffer, x2, yy, z1, 0, 0, -1, 1, 1, c_white, 1); // BR

	vertex_add_point(v_buffer, x1, yy, z2, 0, 0, -1, 0, 0, c_white, 1); // TL
	vertex_add_point(v_buffer, x2, yy, z2, 0, 0, -1, 1, 0, c_white, 1); // BR
	vertex_add_point(v_buffer, x2, y1, z1, 0, 0, -1, 1, 1, c_white, 1); // BL
	
	
}