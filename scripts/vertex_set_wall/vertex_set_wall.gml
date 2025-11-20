/// @param vbuffer
/// @param xx
/// @param yy
/// @param zz
/// @param ww
/// @param hh
/// @param rot_offset

function vertex_set_wall(argument0, argument1, argument2, argument3, argument4, argument5, argument6){
	var vbuffer = argument0;
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
	var y2 = yy//-argument6 // account for camera tilt
	
	var y3 = y2-10;
	var y4 = y1-10;

	// FRONT
	vertex_add_point(v_buffer, x1, y2, z2, 0, 0, -1, 0, 0, c_white, 1); // TL
	vertex_add_point(v_buffer, x1, y1, z1, 0, 0, -1, 0, 1, c_white, 1); // TR
	vertex_add_point(v_buffer, x2, y1, z1, 0, 0, -1, 1, 1, c_white, 1); // BR

	vertex_add_point(v_buffer, x1, y2, z2, 0, 0, -1, 0, 0, c_white, 1); // TL
	vertex_add_point(v_buffer, x2, y2, z2, 0, 0, -1, 1, 0, c_white, 1); // BR
	vertex_add_point(v_buffer, x2, y1, z1, 0, 0, -1, 1, 1, c_white, 1); // BL
	
	
	/*
	// FRONT
	vertex_add_point(v_buffer, x2, y1, z1, 0, 0, -1, 0, 0, c_white, 1); // TL
	vertex_add_point(v_buffer, x1, y1, z1, 0, 0, -1, 0, 1, c_white, 1); // TR
	vertex_add_point(v_buffer, x1, y2, z2, 0, 0, -1, 1, 1, c_white, 1); // BR

	vertex_add_point(v_buffer, x1, y2, z2, 0, 0, -1, 0, 0, c_white, 1); // TL
	vertex_add_point(v_buffer, x2, y1, z1, 0, 0, -1, 1, 0, c_white, 1); // BR
	vertex_add_point(v_buffer, x2, y2, z2, 0, 0, -1, 1, 1, c_white, 1); // BL
	
	// TOP
	vertex_add_point(v_buffer, x2, y2, z2, 0, 0, -1, 0, 0, c_white, 1); // TL
	vertex_add_point(v_buffer, x2, y3, z2, 0, 0, -1, 0, 1, c_white, 1); // TR
	vertex_add_point(v_buffer, x1, y2, z2, 0, 0, -1, 1, 1, c_white, 1); // BR

	vertex_add_point(v_buffer, x1, y2, z2, 0, 0, -1, 0, 0, c_white, 1); // TL
	vertex_add_point(v_buffer, x1, y3, z2, 0, 0, -1, 1, 0, c_white, 1); // BR
	vertex_add_point(v_buffer, x2, y3, z2, 0, 0, -1, 1, 1, c_white, 1); // BL
	
	// BACK
	vertex_add_point(v_buffer, x2, y3, z2, 0, 0, -1, 0, 0, c_white, 1); // TL
	vertex_add_point(v_buffer, x2, y4, z1, 0, 0, -1, 0, 1, c_white, 1); // TR
	vertex_add_point(v_buffer, x1, y4, z1, 0, 0, -1, 1, 1, c_white, 1); // BR

	vertex_add_point(v_buffer, x1, y4, z1, 0, 0, -1, 0, 0, c_white, 1); // TL
	vertex_add_point(v_buffer, x2, y3, z2, 0, 0, -1, 1, 0, c_white, 1); // BR
	vertex_add_point(v_buffer, x1, y3, z2, 0, 0, -1, 1, 1, c_white, 1); // BL
	
	*/

}