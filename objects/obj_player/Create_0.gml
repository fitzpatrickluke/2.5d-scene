curr_dir = 0;
curr_frame = 0;
curr_spr = spr_player_Idle;
max_frame = 1;
alarm[0] = 15;
change_dir = false;

flutter_on = false;

zz = 0;

grid_size = 1;
ww = room_height/grid_size+1;
hh = room_width/grid_size+1;

height_map = ds_grid_create(ww, hh);
// ww -> y, hh -> x
var br = 4;
var bb = 1;
var br_m = bb;
for(var i = 0; i < ww; i+=1) {
	for(var j = 0; j < hh; j+=1) {
		height_map[# i, j] = 4;
		if(j > 144 && j < 240) {
			br += sin(br_m*0.5)*0.8
			height_map[# i, j] = br;
			if(j == 144+96/2)
				br_m = bb*-1;
		}
	}
	br = 4;
	br_m = bb;
}
// 10 11 12 | 13 14 15 16 | 17 18 19 


vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();

v_buffer = vertex_create_buffer();

zz = 0;

vertex_begin(v_buffer, vertex_format);

vertex_set_wall(v_buffer, 0, 0, zz, 24, 32, 24);

vertex_end(v_buffer);



