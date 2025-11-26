
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();

v_buffer = vertex_create_buffer();

zz = 0;

alarm[0] = 1;


spr_tex_base = deer;
spr_tex_run = deer_run;
spr_tex = spr_tex_base;

alert_run = false;
alert_range = 24;

spr_tex_w = sprite_get_width(spr_tex)*2;
spr_tex_h = sprite_get_height(spr_tex)*2;
curr_frame = 0;
max_frame = 3;
anim_time = 15;

x_move = 0;
x_start = x;
obj_on = true;

min_frame = 0;

alarm[1] = anim_time;