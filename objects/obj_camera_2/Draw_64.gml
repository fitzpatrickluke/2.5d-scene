///@description Add SSAO effect

///check if surface exists before continuing
var width = camera_get_view_width(camera_get_active());
var height = camera_get_view_height(camera_get_active());
if (!surface_exists(ssao_surface)) { ssao_surface = surface_create(width,height); }

///apply ssao effect to our surface
surface_apply_ssao(ssao_surface,depthmap,normalmap);

///apply bilateral filter blur to smoothen the noise out
bilateral_filter(ssao_surface,depthmap,normalmap);

///draw our surface image :)
draw_surface(ssao_surface,0,0);

///////////////////////////////////////////////////////////////////////////////////////////////
//////DRAW TEXT/////////

draw_text(4,4,"press left|right to rotate view!   press SPACEBAR to switch occlusion on|off");