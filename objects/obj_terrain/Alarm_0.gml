
land_ox = (image_xscale-1)*24;
land_oy = (image_yscale-1)*24;

vertex_begin(v_buffer, vertex_format);

vertex_set_cube_round(v_buffer, x, y, zz, land_w, land_ox, land_oy, land_oz, 4)

vertex_end(v_buffer);