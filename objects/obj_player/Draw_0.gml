

matrix_set(matrix_world, matrix_build(x+10, y+36, zz, 90, 0, 0, 1, 1, 1));


draw_sprite(Sprite6, curr_dir*2+curr_frame, 0, 0);
//draw_sprite(Sprite6, curr_dir*2+curr_frame, x+12, y+36);


matrix_set(matrix_world, matrix_build_identity());




//draw_sprite_general(Sprite6, curr_dir*2+curr_frame, 0, 0, spr_width, spr_width, x, y, 1, 1, 0, c_top, c_top, c_bot, c_bot, 1);