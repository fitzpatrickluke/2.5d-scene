
if (!surface_exists(shadowmap_surface)) {
    shadowmap_surface = surface_create(shadow_tex_ww, shadow_tex_hh);
}

if (!surface_exists(surface_1)) {
    surface_1 = surface_create(window_get_width(), window_get_height());
}
if (!surface_exists(surface_2)) {
    surface_2 = surface_create(window_get_width(), window_get_height());
}
if (!surface_exists(surf_blur_h)) {
    surf_blur_h = surface_create(window_get_width(), window_get_height());
}

if (!surface_exists(surf_blur)) {
    surf_blur = surface_create(window_get_width(), window_get_height());
}

if (!surface_exists(surf_depth)) {
    surf_depth = surface_create(window_get_width(), window_get_height(), surface_r32float);
}

if (!surface_exists(surf_bloom)) {
    surf_bloom = surface_create(window_get_width(), window_get_height(), surface_r32float);
}
if (!surface_exists(surf_bloom_blur)) {
    surf_bloom_blur = surface_create(window_get_width(), window_get_height(), surface_r32float);
}
if (!surface_exists(surf_bloom_blur_h)) {
    surf_bloom_blur_h = surface_create(window_get_width(), window_get_height(), surface_r32float);
}

gpu_set_zwriteenable(true);
gpu_set_ztestenable(true);