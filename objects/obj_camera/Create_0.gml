
audio_play_sound(Sound_water, 1, true);
audio_play_sound(Sound_forest, 1, true, 0.4);
music_playing = false;

shadow_tex_ww = 2048;
shadow_tex_hh = 2048;

shadow_tex_surf_ww = power(2, 10)
shadow_tex_surf_hh = power(2, 10)
surface_shadows = surface_create(2048, 2048);

layer_force_draw_depth(true, 0);

sun_x = 0;
sun_y = 200;
sun_z = 400;

sun_dx = 1.0; 
sun_dy = -0.5
sun_dz = -1.0; 

sun_spd_const = 0.0005;
sun_dx_spd = -1*sun_spd_const;
sun_dy_spd = -1*sun_spd_const/4

// surfaces
surface_draw = -1;
surf_blur_h = surface_create(window_get_width(), window_get_height());
surf_blur = surface_create(window_get_width(), window_get_height());
surf_depth = surface_create(window_get_width(), window_get_height(), surface_r32float);
surf_bloom = surface_create(window_get_width(), window_get_height());
surf_bloom_blur_h = surface_create(window_get_width(), window_get_height());
surf_bloom_blur = surface_create(window_get_width(), window_get_height());


// camera coordinates
x_to = obj_player.x;
y_to = obj_player.y;
z_to = 0;

x_from = obj_player.x;
y_from = obj_player.y+72*1.5*2;
z_from = 72*1.5

x_offset = 0;
y_offset = 0;
z_offset = 0;
