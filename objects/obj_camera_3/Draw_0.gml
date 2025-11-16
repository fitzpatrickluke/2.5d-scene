

if (!surface_exists(surf_shadow_map)) {
    surf_shadow_map = surface_create(shadow_map_size, shadow_map_size);
}
surface_set_target(surf_shadow_map);
draw_clear(c_white); // Or c_black, depending on depth encoding
// ... Render scene from light's perspective here ...

var prev_view = matrix_get(matrix_view);
var prev_proj = matrix_get(matrix_projection);

matrix_set(matrix_view, light_view);
matrix_set(matrix_projection, light_proj);

// ... Draw scene for shadow map ...
shader_set(shd_shadow_depth);
// Set any required uniforms (e.g., light matrices, near/far planes)

with(obj_ground) {
event_perform(ev_draw, 0);
}

shader_reset();


matrix_set(matrix_view, prev_view);
matrix_set(matrix_projection, prev_proj);


surface_reset_target();

/*
shader_set(shd_shadow_apply);
// Set camera matrices as usual
// Pass shadow map texture and light matrices as uniforms
texture_set_stage(shadow_map_sampler, surface_get_texture(surf_shadow_map));
with(obj_ground) {
	event_perform(ev_draw, 0);
}
shader_reset();

*/
/*
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
*/





