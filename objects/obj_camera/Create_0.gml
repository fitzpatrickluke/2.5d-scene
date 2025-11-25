

shadow_tex_ww = 2048;
shadow_tex_hh = 2048;

shadow_tex_surf_ww = power(2, 10)
shadow_tex_surf_hh = power(2, 10)
shadowmap_surface = surface_create(2048, 2048);
/*
shadow_tex_surf_ww = power(2, 11)
shadow_tex_surf_hh = power(2, 11)
shadowmap_surface = surface_create(2048*2, 2048*2);
*/
surface_1 = -1;
surface_2 = -1;

layer_force_draw_depth(true, 0);

sun_x = 0;
sun_y = 200;//640;
sun_z = 400;

sun_dx = 1.0; 
sun_dy = -1.0; 
sun_dz = -1.0; 

// surfaces
surf_blur_h = surface_create(window_get_width(), window_get_height());
surf_blur = surface_create(window_get_width(), window_get_height());
surf_depth = surface_create(window_get_width(), window_get_height(), surface_r32float);
surf_bloom = surface_create(window_get_width(), window_get_height());
surf_bloom_blur_h = surface_create(window_get_width(), window_get_height());
surf_bloom_blur = surface_create(window_get_width(), window_get_height());


