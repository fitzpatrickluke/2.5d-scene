
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();
v_buffer = vertex_create_buffer();

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format_2 = vertex_format_end();
v_buffer_shadow = vertex_create_buffer();

zz = 0;

alarm[0] = 1;


spr_tex = spr_tree_3;
spr_tex_w = sprite_get_width(spr_tex);
spr_tex_h = sprite_get_height(spr_tex);
curr_frame = 0;
max_frame = 24;
anim_time = 6;
scale = 20;

var rr = irandom(2);
switch(rr) {
	case 1:
	spr_tex = spr_tree_1;
spr_tex_w = sprite_get_width(spr_tex);
spr_tex_h = sprite_get_height(spr_tex);
max_frame = 22;
scale = 16;
	break;
	case 2:
	spr_tex = spr_tree_2;
spr_tex_w = sprite_get_width(spr_tex);
spr_tex_h = sprite_get_height(spr_tex);
max_frame = 15;
scale = 16;
	break;
}

curr_frame = irandom(max_frame);
anim_time = irandom_range(4, 6);

draw_shadow = true;



alarm[1] = anim_time;