/// @param vbuffer
/// @param xx
/// @param yy
/// @param zz
/// @param ww
/// @param offset_x
/// @param offset_y
/// @param offset_z
/// @param offset_r

function vertex_set_cube_round(argument0, argument1, argument2, argument3, argument4, argument5,
argument6, argument7, argument8){
	
	var vbuffer = argument0;
	var xx = argument1;
	var yy = argument2;
	var zz = argument3;
	var ww = argument4;
	var offset_x = argument5;
	var offset_y = argument6;
	var offset_z = argument7;
	var offset_r = argument8;
	
	var x1 = xx;
	var y1 = yy;
	var x2 = xx+ww+offset_x;
	var y2 = yy+ww+offset_y;
	var z1 = zz;
	var z2 = zz+ww+offset_z;
	
	
	var z3 = z2+offset_r;
	var x3 = x1+offset_r;
	var x4 = x2-offset_r;
	var y3 = y1+offset_r;
	var y4 = y2-offset_r;
	
	// LEFT
	vertex_add_point(v_buffer, x1, y1, z2, -1, 0, 0, 0, 0, c_white, 1); // TL
	vertex_add_point(v_buffer, x1, y1, z1, -1, 0, 0, 0, 1, c_white, 1); // TR
	vertex_add_point(v_buffer, x1, y2, z1, -1, 0, 0, 1, 1, c_white, 1); // BR

	vertex_add_point(v_buffer, x1, y2, z1, -1, 0, 0, 1, 1, c_white, 1); // TL
	vertex_add_point(v_buffer, x1, y1, z2, -1, 0, 0, 0, 0, c_white, 1); // BR
	vertex_add_point(v_buffer, x1, y2, z2, -1, 0, 0, 1, 0, c_white, 1); // BL

	// FRONT
	vertex_add_point(v_buffer, x1, y2, z2, 0, 0, -1, 0, 0, c_white, 1); // TL
	vertex_add_point(v_buffer, x1, y2, z1, 0, 0, -1, 0, 1, c_white, 1); // TR
	vertex_add_point(v_buffer, x2, y2, z1, 0, 0, -1, 1, 1, c_white, 1); // BR

	vertex_add_point(v_buffer, x2, y2, z1, 0, 0, -1, 1, 1, c_white, 1); // TL
	vertex_add_point(v_buffer, x1, y2, z2, 0, 0, -1, 0, 0, c_white, 1); // BR
	vertex_add_point(v_buffer, x2, y2, z2, 0, 0, -1, 1, 0, c_white, 1); // BL

	// RIGHT
	vertex_add_point(v_buffer, x2, y2, z2, 1, 0, 0, 0, 0, c_white, 1); // TL
	vertex_add_point(v_buffer, x2, y2, z1, 1, 0, 0, 0, 1, c_white, 1); // TR
	vertex_add_point(v_buffer, x2, y1, z1, 1, 0, 0, 1, 1, c_white, 1); // BR

	vertex_add_point(v_buffer, x2, y1, z1, 1, 0, 0, 1, 1, c_white, 1); // TL
	vertex_add_point(v_buffer, x2, y2, z2, 1, 0, 0, 0, 0, c_white, 1); // BR
	vertex_add_point(v_buffer, x2, y1, z2, 1, 0, 0, 1, 0, c_white, 1); // BL
	
	// RIGHT ROUND
	vertex_add_point(v_buffer, x2, y1, z2, 1, 1, 0, 1, 1, c_white, 1); // TL
	vertex_add_point(v_buffer, x4, y3, z3, 1, 1, 0, 1, 0, c_white, 1); // TR
	vertex_add_point(v_buffer, x4, y4, z3, 1, 1, 0, 0, 0, c_white, 1); // BR

	vertex_add_point(v_buffer, x4, y4, z3, 1, 1, 0, 0, 0, c_white, 1); // TL
	vertex_add_point(v_buffer, x2, y1, z2, 1, 1, 0, 1, 1, c_white, 1); // BR
	vertex_add_point(v_buffer, x2, y2, z2, 1, 1, 0, 0, 1, c_white, 1); // BL
	
	// FRONT ROUND
	vertex_add_point(v_buffer, x2, y2, z2, 0, 1, -1, 1, 1, c_white, 1); // TL
	vertex_add_point(v_buffer, x4, y4, z3, 0, 1, -1, 1, 0, c_white, 1); // TR
	vertex_add_point(v_buffer, x3, y4, z3, 0, 1, -1, 0, 0, c_white, 1); // BR

	vertex_add_point(v_buffer, x3, y4, z3, 0, 1, -1, 0, 0, c_white, 1); // TL
	vertex_add_point(v_buffer, x2, y2, z2, 0, 1, -1, 1, 1, c_white, 1); // BR
	vertex_add_point(v_buffer, x1, y2, z2, 0, 1, -1, 0, 1, c_white, 1); // BL
	
	// LEFT ROUND
	vertex_add_point(v_buffer, x1, y2, z2, -1, 1, 0, 1, 1, c_white, 1); // TL
	vertex_add_point(v_buffer, x1, y1, z2, -1, 1, 0, 0, 1, c_white, 1); // TR
	vertex_add_point(v_buffer, x3, y3, z3, -1, 1, 0, 0, 0, c_white, 1); // BR

	vertex_add_point(v_buffer, x3, y3, z3, -1, 1, 0, 0, 0, c_white, 1); // TL
	vertex_add_point(v_buffer, x1, y2, z2, -1, 1, 0, 1, 1, c_white, 1); // BR
	vertex_add_point(v_buffer, x3, y4, z3, -1, 1, 0, 1, 0, c_white, 1); // BL
	
	// TOP
	vertex_add_point(v_buffer, x3, y4, z3, 0, 1, 0, 0, 1, c_white, 1); // TL
	vertex_add_point(v_buffer, x3, y3, z3, 0, 1, 0, 0, 0, c_white, 1); // TR
	vertex_add_point(v_buffer, x4, y3, z3, 0, 1, 0, 1, 0, c_white, 1); // BR

	vertex_add_point(v_buffer, x4, y3, z3, 0, 1, 0, 1, 0, c_white, 1); // TL
	vertex_add_point(v_buffer, x3, y4, z3, 0, 1, 0, 0, 1, c_white, 1); // BR
	vertex_add_point(v_buffer, x4, y4, z3, 0, 1, 0, 1, 1, c_white, 1); // BL
	
}




