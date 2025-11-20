vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();

v_buffer = vertex_create_buffer();

zz = 0;

vertex_begin(v_buffer, vertex_format);

vertex_set_floor(v_buffer, 0, 0, zz, room_width, room_height);

vertex_end(v_buffer);