
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();

v_buffer = vertex_create_buffer();

zz = 0;

spr_tex = Sprite20;

var rr = irandom(5);
switch(rr) {
	case 1:
	spr_tex = Sprite19;
	break;
	case 2:
	spr_tex = Sprite18;
	break;
	case 3:
	spr_tex = Sprite22;
	break;
	case 4:
	spr_tex = Sprite23;
	break;
	case 5:
	spr_tex = Sprite24;
	break;
}
spr_tex_w = sprite_get_width(spr_tex)/1.25;
spr_tex_h = sprite_get_height(spr_tex)/1.25;

alarm[0] = 1;