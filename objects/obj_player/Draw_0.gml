

//show_debug_message("YY: " + string(y div grid_size) + " XX: " + string(x div grid_size));
//show_debug_message(height_map[# y div grid_size, x div grid_size])
/*
matrix_set(matrix_world, matrix_build(x+12, y+16, height_map[# y div grid_size, x div grid_size], 90, 0, 0, 1, 1, 1));


draw_sprite(spr_player, curr_dir*2+curr_frame, 0, 0);



matrix_set(matrix_world, matrix_build_identity());

*/

matrix_set(matrix_world, matrix_build(x+12, y+16, height_map[# y div grid_size, x div grid_size], 0, 0, 0, 1, 1, 1));

vertex_submit(v_buffer, pr_trianglelist, sprite_get_texture(spr_player, curr_dir*2+curr_frame));


matrix_set(matrix_world, matrix_build_identity());
