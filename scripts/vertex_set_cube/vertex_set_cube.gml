/// @param vbuffer
/// @param xx
/// @param yy
/// @param zz
/// @param ww
/// @param offset_x
/// @param offset_y
/// @param offset_z

function vertex_set_cube(argument0, argument1, argument2, argument3, argument4, argument5,
argument6, argument7){
	
	var vbuffer = argument0;
	var xx = argument1;
	var yy = argument2;
	var zz = argument3;
	var ww = argument4;
	var offset_x = argument5;
	var offset_y = argument6;
	var offset_z = argument7;
	
	var x1 = xx;
	var y1 = yy;
	var x2 = xx+ww+offset_x;
	var y2 = yy+ww+offset_y;
	var z1 = zz;
	var z2 = zz+ww+offset_z;
	
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
	vertex_add_point(v_buffer, x2, y2, z2, 1, 0, 0, 0, 0, c_blue, 1); // TL
	vertex_add_point(v_buffer, x2, y2, z1, 1, 0, 0, 0, 1, c_blue, 1); // TR
	vertex_add_point(v_buffer, x2, y1, z1, 1, 0, 0, 1, 1, c_blue, 1); // BR

	vertex_add_point(v_buffer, x2, y1, z1, 1, 0, 0, 1, 1, c_blue, 1); // TL
	vertex_add_point(v_buffer, x2, y2, z2, 1, 0, 0, 0, 0, c_blue, 1); // BR
	vertex_add_point(v_buffer, x2, y1, z2, 1, 0, 0, 1, 0, c_blue, 1); // BL
	
	// TOP
	vertex_add_point(v_buffer, x2, y1, z2, 0, 1, 0, 0, 1, c_blue, 1); // TL
	vertex_add_point(v_buffer, x1, y1, z2, 0, 1, 0, 0, 0, c_blue, 1); // TR
	vertex_add_point(v_buffer, x2, y2, z2, 0, 1, 0, 1, 1, c_blue, 1); // BR

	vertex_add_point(v_buffer, x2, y2, z2, 0, 1, 0, 1, 1, c_blue, 1); // TL
	vertex_add_point(v_buffer, x1, y1, z2, 0, 1, 0, 0, 0, c_blue, 1); // BR
	vertex_add_point(v_buffer, x1, y2, z2, 0, 1, 0, 0, 1, c_blue, 1); // BL
	
	// bottom and back fasces are never seen so do not draw them

}