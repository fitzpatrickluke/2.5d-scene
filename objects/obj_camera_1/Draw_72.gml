
if (!surface_exists(shadowmap_surface)) {
    shadowmap_surface = surface_create(2048, 2048);
}


gpu_set_zwriteenable(true);
gpu_set_ztestenable(true);