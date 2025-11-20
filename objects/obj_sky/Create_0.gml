
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();

v_buffer = vertex_create_buffer();


vertex_begin(v_buffer, vertex_format);

vertex_set_wall(v_buffer, 960, 0, 0, 24*57, 24*57, 64);

vertex_end(v_buffer);