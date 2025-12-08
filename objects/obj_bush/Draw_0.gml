
var face_angle = 90 + obj_camera.cam_angle_bush;
matrix_set(matrix_world, matrix_build(x, y, zz, 0, 0, face_angle, 1, 1, 1));

vertex_submit(v_buffer, pr_trianglelist, sprite_get_texture(spr_tex, 0));

matrix_set(matrix_world, matrix_build_identity());
