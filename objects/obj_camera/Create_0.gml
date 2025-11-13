var ww = 640*1.5
var hh = 640*1.5

window_set_size(ww, hh);
surface_resize(application_surface, ww, hh);
window_center();

layer_force_draw_depth(true, 0);