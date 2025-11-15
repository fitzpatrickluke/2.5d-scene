vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();

v_buffer = vertex_create_buffer();

land_w = 24;
land_ox = 24;
land_oy = 0;
land_oz = 0;
zz = 0;


alarm[0] = 1;