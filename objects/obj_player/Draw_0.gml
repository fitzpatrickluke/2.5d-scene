
var face_angle = 90 + obj_camera.cam_angle;


matrix_set(matrix_world, matrix_build(x+12, y+16, height_map[# y div grid_size, x div grid_size], 0, 0, face_angle, 1, 1, 1));

vertex_submit(v_buffer, pr_trianglelist, sprite_get_texture(curr_spr, curr_frame));




matrix_set(matrix_world, matrix_build_identity());
