
matrix_set(matrix_world, matrix_build(x, y, height_map[# y div grid_size, x div grid_size], 0, 0, 0, 1, 1, 1));

vertex_submit(v_buffer, pr_trianglelist, sprite_get_texture(spr_player, curr_dir*2+curr_frame));


matrix_set(matrix_world, matrix_build_identity());
