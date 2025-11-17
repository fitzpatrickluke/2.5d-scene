///////VARIABLES////////
x = room_width/2; y = room_height/2; z = -20; 

angle = 45;

occlude = true;

view_mat = -1;
proj_mat = -1;

/////VERTEX FORMAT/////
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_texcoord();
vertex_format_add_normal();
vertex_format_add_color();

global.vformat = vertex_format_end();

//////////GPU///////////
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

layer_force_draw_depth(true,0); //<---DISABLE LAYER'S DEPTH SYSTEM AND FORCE ALL CONTENT IN ROOM WITH 0 depth

////////SURFACES////////
depthmap = -1;
normalmap = -1;
ssao_surface = -1;

/////////KERNELS/////////<---------------IMPORTANT FOR SSAO
occlusion_quality = 64;

//generate our kernels
for (var o = 0; o < occlusion_quality; o++) {
     var scale = o / occlusion_quality; 
     scale = lerp(.1, 1, scale * scale) * random(1);
     _KERNEL[(o*3)+0] = random_range(-1,1)*scale;
     _KERNEL[(o*3)+1] = random_range(-1,1)*scale;
     _KERNEL[(o*3)+2] = random_range(.1,1)*scale;
}