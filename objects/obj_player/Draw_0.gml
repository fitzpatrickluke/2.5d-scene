matrix_set(matrix_world, matrix_build(x+10, y+24, 0, 90, 0, 0, 1, 1, 1));


draw_sprite(Sprite6, curr_dir*2+curr_frame, 0, 0);
//draw_sprite(Sprite6, curr_dir*2+curr_frame, x+12, y+36);


matrix_set(matrix_world, matrix_build_identity());