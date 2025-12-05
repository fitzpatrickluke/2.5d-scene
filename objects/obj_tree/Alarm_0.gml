

vertex_begin(v_buffer, vertex_format);

vertex_set_wall(v_buffer, x, y, zz, spr_tex_w, spr_tex_h, 24);
//vertex_set_wall_2(v_buffer, x, y, zz, 72, 72);

vertex_end(v_buffer);




vertex_begin(v_buffer_shadow, vertex_format_2);

vertex_set_tree(v_buffer_shadow, x, y, zz, spr_tex_w, spr_tex_h, 24);

vertex_end(v_buffer_shadow);


//v_buffer_shadow = import_obj("CartoonTree.obj", vertex_format_2, x-spr_tex_w/2, y-spr_tex_w/2, zz-2, scale);