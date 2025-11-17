


var camera = camera_get_active();

#region
// pov sun
var x_from = sun_x;
var y_from = sun_y;
var z_from = sun_z;

var x_to = x_from + sun_dx;
var y_to = y_from + sun_dy;
var z_to = z_from + sun_dz;

shader_set(shader_depth);

surface_set_target(shadowmap_surface);

light_view_mat = matrix_build_lookat(x_from, y_from, z_from, x_to, y_to, z_to, 0, 0, 1);
light_proj_mat = matrix_build_projection_ortho(shadow_tex_surf_ww, -shadow_tex_surf_hh, 1, 1000);
camera_set_view_mat(camera, light_view_mat);
camera_set_proj_mat(camera, light_proj_mat);
camera_apply(camera);

draw_clear(c_black);

with(obj_ground) {event_perform(ev_draw, 0);}
with(obj_tree) {event_perform(ev_draw, 0);}
with(obj_ground) {event_perform(ev_draw, 0);}
with(obj_player) {event_perform(ev_draw, 0);}

shader_reset();
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
var width = camera_get_view_width(camera)*2;
var height = camera_get_view_height(camera)*2;

//////////////////////////////////////////////////////////////////////////////////////////////////
////DEFERRED RENDERS////
if (!surface_exists(normalmap)) { normalmap = surface_create(width,height); }
if (!surface_exists(depthmap)) { depthmap = surface_create(width,height,surface_r32float); }

//set target
surface_set_target_ext(0,normalmap);
surface_set_target_ext(1,depthmap);
draw_clear_alpha(0,0);

view_mat = matrix_build_lookat(x_from, y_from, z_from, x_to, y_to, z_to, 0, 0, 1);
proj_mat = matrix_build_projection_perspective_fov(-60, -window_get_width()/window_get_height(), 1, 1000);
camera_set_view_mat(camera, view_mat);
camera_set_proj_mat(camera, proj_mat);
camera_apply(camera);


//draw everything!!!
shader_set(shd_deferred);
with(obj_ground) {event_perform(ev_draw, ev_draw_normal);}
with(obj_tree) {event_perform(ev_draw, ev_draw_normal);}
shader_reset();

//we done ^.^
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
/*
shader_set(shader_light);
shader_set_uniform_f_array(shader_get_uniform(shader_light,"u_lightViewMap"), light_view_mat);
shader_set_uniform_f_array(shader_get_uniform(shader_light,"u_lightProjMap"), light_proj_mat);
texture_set_stage(shader_get_sampler_index(shader_light, "s_DepthTexture"), surface_get_texture(shadowmap_surface));
*/
view_mat = matrix_build_lookat(x_from, y_from, z_from, x_to, y_to, z_to, 0, 0, 1);
proj_mat = matrix_build_projection_perspective_fov(-60, -window_get_width()/window_get_height(), 1, 1000);
camera_set_view_mat(camera, view_mat);
camera_set_proj_mat(camera, proj_mat);
camera_apply(camera);

draw_clear(c_white);

with(obj_ground) {event_perform(ev_draw, 0);}
with(obj_tree) {event_perform(ev_draw, 0);}

shader_reset();

with(obj_floor) {event_perform(ev_draw, 0);}
with(obj_player) {event_perform(ev_draw, 0);}

#endregion
