
if (!surface_exists(shadowmap_surface)) {
    shadowmap_surface = surface_create(shadow_tex_ww, shadow_tex_hh);
}


gpu_set_zwriteenable(true);
gpu_set_ztestenable(true);