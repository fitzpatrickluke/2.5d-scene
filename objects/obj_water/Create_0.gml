vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();

v_buffer = vertex_create_buffer();

zz = 0;

vertex_begin(v_buffer, vertex_format);

vertex_set_floor(v_buffer, -room_width/2, -room_height/2, room_width*2, room_height*2, 48);

vertex_end(v_buffer);
