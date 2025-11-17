///@description View & Projection
////////CAMERA/////////
var width = camera_get_view_width(camera_get_active());
var height = camera_get_view_height(camera_get_active());

/////////VIEW//////////
var length = 260;

var xview = x + (dcos(direction) * dcos(angle) * length);
var yview = y - (dsin(direction) * dcos(angle) * length);
var zview = z + (dtan( angle ) * dcos( angle ) * length);

view_mat = matrix_build_lookat(xview,yview,zview, x,y,z, 0,0,1);

//////PROJECTION///////
proj_mat = matrix_build_projection_perspective( width/height, -1, 1, 32000 );
//proj_mat = matrix_build_projection_perspective_fov( -55, width/height, 1, 32000 );