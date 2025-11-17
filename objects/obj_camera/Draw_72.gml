

if (!surface_exists(shadowmap_surface)) {
    shadowmap_surface = surface_create(shadow_tex_ww, shadow_tex_hh);
}

if (!surface_exists(surface_1)) {
    surface_1 = surface_create(window_get_width(), window_get_height());
}
if (!surface_exists(surface_2)) {
    surface_2 = surface_create(window_get_width(), window_get_height());
}


gpu_set_zwriteenable(true);
gpu_set_ztestenable(true);