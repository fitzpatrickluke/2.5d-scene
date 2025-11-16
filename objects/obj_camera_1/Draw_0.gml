

//draw_clear(c_black);
var camera = camera_get_active();

#region
// pov sun
var x_from = 0;
var y_from = 0;
var z_from = 200;

var x_to = x_from + 1;
var y_to = y_from + 1;
var z_to = z_from + -1;

shader_set(shader_test_depth);

surface_set_target(shadowmap_surface);

view_mat = matrix_build_lookat(x_from, y_from, z_from, x_to, y_to, z_to, 0, 0, 1);
//proj_mat = matrix_build_projection_perspective_fov(-60, -window_get_width()/window_get_height(), 1, 1000);
proj_mat = matrix_build_projection_ortho(2048, -2048, 1, 1000);
camera_set_view_mat(camera, view_mat);
camera_set_proj_mat(camera, proj_mat);
camera_apply(camera);

draw_clear(c_black);

shader_set(shader_test_depth);
with(obj_ground) {
event_perform(ev_draw, 0);
}
shader_reset();

with(obj_tree) {
event_perform(ev_draw, 0);
}

surface_reset_target();
#endregion

#region


// pov player
var x_to = obj_player.x;
var y_to = obj_player.y;
var z_to = 0;

var x_from = obj_player.x;
var y_from = obj_player.y+72*1.5*2;
var z_from = 72*1.5

shader_set(shader_test_depth);


view_mat = matrix_build_lookat(x_from, y_from, z_from, x_to, y_to, z_to, 0, 0, 1);
proj_mat = matrix_build_projection_perspective_fov(-60, -window_get_width()/window_get_height(), 1, 1000);
//proj_mat = matrix_build_projection_ortho(ww, -hh, 1, 1000);
camera_set_view_mat(camera, view_mat);
camera_set_proj_mat(camera, proj_mat);
camera_apply(camera);

draw_clear(c_black);

shader_set(shader_test_light_3);
with(obj_ground) {
event_perform(ev_draw, 0);
}
shader_reset();

with(obj_tree) {
event_perform(ev_draw, 0);
}
with(obj_player) {
event_perform(ev_draw, 0);
}

#endregion
