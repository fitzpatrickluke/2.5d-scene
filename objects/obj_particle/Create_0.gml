
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();

v_buffer = vertex_create_buffer();


setPos();


alarm[0] = 1;




function setPos() {
	zz = irandom(120);
	x = irandom_range(-240, room_width+240);
	y = irandom_range(obj_player.y - 240, obj_player.y+180);

	spr_tex = spr_particle;
	spr_tex_w = random_range(0.5, 2)

	spd_x = random_range(-0.2, 0.2);
	spd_y = random_range(-0.05, 0.05);
	spd_z = random_range(-0.05, 0.05);
	
	alarm[1] = 60*60*irandom_range(1, 2);
}
