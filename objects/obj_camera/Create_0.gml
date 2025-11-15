var ww = 240*4*1.5
var hh = 240*3*1.5

window_set_size(ww, hh);
surface_resize(application_surface, ww, hh);
window_center();

layer_force_draw_depth(true, 0);

//application_surface_enable(false);


sun_dx = 0.5; // right -> left
sun_dy = -1.0; // top -> bottom
sun_dz = 0; // backward -> forward