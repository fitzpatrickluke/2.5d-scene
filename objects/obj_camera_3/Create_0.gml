var ww = 240*4*1.5
var hh = 240*3*1.5

window_set_size(ww, hh);
surface_resize(application_surface, ww, hh);
window_center();

layer_force_draw_depth(true, 0);

//application_surface_enable(false);



shadow_map_size = 1024;
surf_shadow_map = -1;

lx = 100; ly = 100; lz = 100;
tx = 0; ty = 0; tz = 0;
ux = 0; uy = 1; uz = 1;
// Example for a directional light (orthographic projection)
light_pos = [lx, ly, lz]; // Light position
light_target = [tx, ty, tz]; // Where the light is pointing
light_up = [ux, uy, uz]; // Up vector (usually [0, 1, 0])

light_view = matrix_build_lookat(light_pos[0], light_pos[1], light_pos[2],
                                 light_target[0], light_target[1], light_target[2],
                                 light_up[0], light_up[1], light_up[2]);

shadow_extent = 50; // Controls the area covered by the shadow map
shadow_near = 0;
shadow_far = 100;

light_proj = matrix_build_projection_ortho(-shadow_extent, shadow_extent,
                                           shadow_near, shadow_far);