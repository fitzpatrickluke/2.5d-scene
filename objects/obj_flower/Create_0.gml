
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();

v_buffer = vertex_create_buffer();

zz = 1;

spr_tex = spr_flower_2;
spr_tex_w = sprite_get_width(spr_tex)/1.25;
spr_tex_h = sprite_get_height(spr_tex)/1.25;

flower_num = irandom(5);

alarm[0] = 1;