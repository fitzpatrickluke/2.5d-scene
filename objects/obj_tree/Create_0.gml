
/*
spr_width = sprite_get_width(Sprite5);
spr_height = sprite_get_height(Sprite5);

c_top = make_color_rgb(spr_height, 0, 0);
c_bot = make_color_rgb(0, 0, 0);

c_top_2 = make_color_rgb(0, spr_height, 0);

c_top_3 = make_color_rgb(0, 0, spr_height);
*/


vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();

v_buffer = vertex_create_buffer();

zz = 0;

alarm[0] = 1;