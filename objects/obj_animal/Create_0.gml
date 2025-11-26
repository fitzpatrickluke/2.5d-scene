
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();

v_buffer = vertex_create_buffer();

zz = 0;

alarm[0] = 1;

spr_tex_alart_down = Sprite25_1;
spr_tex_alart_up = Sprite25_3;
spr_tex_sleep = Sprite25_2;
spr_tex_base = Sprite25;
alert_down = false;
alert_up = false;
alert_sleep = false;
alert_range = 24;

spr_tex = spr_tex_sleep;
spr_tex_w = sprite_get_width(spr_tex)*2;
spr_tex_h = sprite_get_height(spr_tex)*2;
curr_frame = 0;
max_frame = 7;
anim_time = 15;

min_frame = 0;





curr_frame = irandom(max_frame);



alarm[1] = anim_time;