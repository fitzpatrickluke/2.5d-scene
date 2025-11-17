



ww = 240*4*1.5
hh = 240*3*1.5

shadow_tex_ww = 2048;
shadow_tex_hh = 2048;
shadow_tex_surf_ww = shadow_tex_ww/4;
shadow_tex_surf_hh = shadow_tex_hh/4;

shadowmap_surface = surface_create(2048, 2048);

window_set_size(ww, hh);
surface_resize(application_surface, ww, hh);
window_center();

//layer_force_draw_depth(true, 0);

sun_x = 0;
sun_y = 0;
sun_z = 400;

sun_dx = 1.0; 
sun_dy = 1.0; 
sun_dz = -1.0; 


occlusion_quality = 64;

depthmap = -1;
normalmap = -1;
ssao_surface = -1;
//generate our kernels
for (var o = 0; o < occlusion_quality; o++) {
     var scale = o / occlusion_quality; 
     scale = lerp(.1, 1, scale * scale) * random(1);
     _KERNEL[(o*3)+0] = random_range(-1,1)*scale;
     _KERNEL[(o*3)+1] = random_range(-1,1)*scale;
     _KERNEL[(o*3)+2] = random_range(.1,1)*scale;
}



