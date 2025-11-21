curr_dir = 0;
curr_frame = 0;
max_frame = 1;
alarm[0] = 15;

zz = 0;


var ww = 18+1;
var hh = 14+1;
grid_size = 24;
height_map = ds_grid_create(ww, hh);
// ww -> y, hh -> x
for(var i = 0; i < ww; i+=1) {
	for(var j = 0; j < hh; j+=1) {
		height_map[# i, j] = 4;
		if(j > 4 && j < 10)
			height_map[# i, j] = 12;
	}
}
var ss = "";
for(var i = 0; i < ww; i+=1) {
	for(var j = 0; j < hh; j+=1) {
		ss += string(height_map[# i, j]) + " ";
	}
	ss += "\n"
	show_debug_message(ss);
	ss = "";
}
/*
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();

v_buffer = vertex_create_buffer();

zz = 0;

vertex_begin(v_buffer, vertex_format);

vertex_set_wall(v_buffer, x, y, zz, 24, 32, 24);

vertex_end(v_buffer);
*/


