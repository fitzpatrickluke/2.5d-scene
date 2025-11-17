///@description Deferred Renders
var camera = camera_get_active();
var width = camera_get_view_width(camera);
var height = camera_get_view_height(camera);

//////////////////////////////////////////////////////////////////////////////////////////////////
////DEFERRED RENDERS////
if (!surface_exists(normalmap)) { normalmap = surface_create(width,height); }
if (!surface_exists(depthmap)) { depthmap = surface_create(width,height,surface_r32float); }

//set target
surface_set_target_ext(0,normalmap);
surface_set_target_ext(1,depthmap);
draw_clear_alpha(0,0);

//apply 3D perspective into surface
camera_set_view_mat(camera,view_mat);
camera_set_proj_mat(camera,proj_mat);
camera_apply(camera);

//draw everything!!!
shader_set(shd_deferred);
with(all) event_perform(ev_draw,ev_draw_normal);
shader_reset();

//we done ^.^
surface_reset_target();

///////////////////////////////////////////////////////////////////////////////////////////////////

////////MATRICES reset///////
camera_set_view_mat(camera,view_mat);
camera_set_proj_mat(camera,proj_mat);
camera_apply(camera);