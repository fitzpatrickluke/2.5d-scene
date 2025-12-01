vertex_begin(v_buffer, vertex_format);
show_debug_message(image_yscale)
show_debug_message(image_xscale)
vertex_set_floor_9slice(v_buffer, x, y, zz, image_xscale*24, image_yscale*24, 24);

vertex_end(v_buffer);