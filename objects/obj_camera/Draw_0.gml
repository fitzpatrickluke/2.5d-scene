


var camera = camera_get_active();

// shadows
#region
shader_set(shd_depth);
surface_set_target(surface_shadows);
draw_clear(c_black);

// pov sun
var x_from_sun = sun_x;
var y_from_sun = sun_y;
var z_from_sun = sun_z;

var x_to_sun = x_from_sun + sun_dx;
var y_to_sun = y_from_sun + sun_dy;
var z_to_sun = z_from_sun + sun_dz;

light_view_mat = matrix_build_lookat(x_from_sun, y_from_sun, z_from_sun, x_to_sun, y_to_sun, z_to_sun, 0, 0, 1);
light_proj_mat = matrix_build_projection_ortho(shadow_tex_surf_ww, -shadow_tex_surf_hh, 1, 1000);
camera_set_view_mat(camera, light_view_mat);
camera_set_proj_mat(camera, light_proj_mat);
camera_apply(camera);

with(obj_terrain) {event_perform(ev_draw, 0);}
with(obj_object) {event_perform(ev_draw, 0);}
with(obj_water) {event_perform(ev_draw, 0);}
with(obj_player) {event_perform(ev_draw, 0);}

shader_reset();
surface_reset_target();

#endregion

// sprites and objects
#region

shader_set(shd_light);
shader_set_uniform_f_array(shader_get_uniform(shd_light,"u_lightViewMap"), light_view_mat);
shader_set_uniform_f_array(shader_get_uniform(shd_light,"u_lightProjMap"), light_proj_mat);
texture_set_stage(shader_get_sampler_index(shd_light, "s_DepthTexture"), surface_get_texture(surface_shadows));
shader_set_uniform_f(shader_get_uniform(shd_light,"u_lightDirection"), sun_dx, sun_dz, -sun_dy);
shader_set_uniform_f(shader_get_uniform(shd_light,"u_pointLightPos"), 400., -100, -100.);
shader_set_uniform_f(shader_get_uniform(shd_light,"u_pointLightRange"), 20.);
surface_set_target(surface_draw);
surface_set_target_ext(1, surf_depth)

draw_clear(make_color_rgb(126, 189, 242));

// pov player

view_mat = matrix_build_lookat(x_from, y_from, z_from, x_to, y_to, z_to, 0, 0, 1);
proj_mat = matrix_build_projection_perspective_fov(-60, -window_get_width()/window_get_height(), 1, 1000);
camera_set_view_mat(camera, view_mat);
camera_set_proj_mat(camera, proj_mat);
camera_apply(camera);


with(obj_terrain) {event_perform(ev_draw, 0);}
with(obj_object) {event_perform(ev_draw, 0);}
with(obj_player) {event_perform(ev_draw, 0);}
with(obj_particle) {event_perform(ev_draw, 0);}
shader_reset();

// water movement and foam
gpu_set_tex_filter(true);
gpu_set_tex_repeat(true);
shader_set(shd_water);
var displacement_sampler = shader_get_sampler_index(shd_water, "displacementMap");
texture_set_stage(displacement_sampler, sprite_get_texture(spr_noise, 0));
var time_uniform = shader_get_uniform(shd_water, "time");
shader_set_uniform_f(time_uniform, current_time / 1000);
shader_set_uniform_f_array(shader_get_uniform(shd_water,"u_lightViewMap"), light_view_mat);
shader_set_uniform_f_array(shader_get_uniform(shd_water,"u_lightProjMap"), light_proj_mat);
texture_set_stage(shader_get_sampler_index(shd_water, "s_DepthTexture"), surface_get_texture(surface_shadows));
shader_set_uniform_f(shader_get_uniform(shd_water,"u_lightDirection"), sun_dx, sun_dz, -sun_dy);
shader_set_uniform_f(shader_get_uniform(shd_water,"u_pointLightPos"), 400., -100, -100.);
shader_set_uniform_f(shader_get_uniform(shd_water,"u_pointLightRange"), 20.);
with(obj_water) {event_perform(ev_draw, 0);}
shader_reset();
gpu_set_tex_filter(false);
gpu_set_tex_repeat(false);

surface_reset_target();

#endregion

// DOF
#region

var surf_width = surface_get_width(application_surface);
var surf_height = surface_get_height(application_surface);

surface_set_target(surf_blur_h);
draw_clear(c_black);
shader_set(shd_blur_h);

shader_set_uniform_f(shader_get_uniform(shd_blur_h, "texture_size"), surf_width, surf_height);
shader_set_uniform_f(shader_get_uniform(shd_blur_h, "blur_radius"), 10);
draw_surface(surface_draw, 0, 0);
surface_reset_target();
shader_reset();

surface_set_target(surf_blur);
draw_clear(c_black);
shader_set(shd_blur_v);

shader_set_uniform_f(shader_get_uniform(shd_blur_v, "texture_size"), surf_width, surf_height);
shader_set_uniform_f(shader_get_uniform(shd_blur_v, "blur_radius"), 10);
draw_surface(surf_blur_h, 0, 0);
shader_reset();

surface_reset_target();
#endregion

// BLOOM
#region
surface_set_target(surf_bloom);
draw_clear(c_black);
shader_set(shd_bloom);
draw_surface(surface_draw, 0, 0);
shader_reset();

surface_reset_target();

surface_set_target(surf_bloom_blur_h);
draw_clear(c_black);
shader_set(shd_blur_h);

shader_set_uniform_f(shader_get_uniform(shd_blur_h, "texture_size"), surf_width, surf_height);
shader_set_uniform_f(shader_get_uniform(shd_blur_h, "blur_radius"), 10);
draw_surface(surf_bloom, 0, 0);
surface_reset_target();
shader_reset();

surface_set_target(surf_bloom_blur);
draw_clear(c_black);
shader_set(shd_blur_v);

shader_set_uniform_f(shader_get_uniform(shd_blur_v, "texture_size"), surf_width, surf_height);
shader_set_uniform_f(shader_get_uniform(shd_blur_v, "blur_radius"), 10);
draw_surface(surf_bloom_blur_h, 0, 0);
shader_reset();

surface_reset_target();
#endregion

