var x_to = obj_player.x;
var y_to = obj_player.y;
var z_to = 0;

var x_from = obj_player.x;
var y_from = obj_player.y+72*2;
var z_from = 72*2;

var camera = camera_get_active();
camera_set_view_mat(camera, matrix_build_lookat(x_from, y_from, z_from, x_to, y_to, z_to, 0, 0, 1));
camera_set_proj_mat(camera, matrix_build_projection_perspective_fov(-60, -window_get_width()/window_get_height(), 1, 1000));
camera_apply(camera);

draw_clear(c_black);

gpu_set_zwriteenable(true);
gpu_set_ztestenable(false);
