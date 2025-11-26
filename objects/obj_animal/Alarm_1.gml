curr_frame += 1;
if(curr_frame > max_frame)
	curr_frame = min_frame;
	
if((obj_player.x < x+alert_range && obj_player.x > x-alert_range-spr_tex_w) && !alert_sleep)
{
	alert_sleep = true;
	spr_tex = spr_tex_base;
	curr_frame = 0;
	min_frame = 4;
	anim_time = 5;
}
else if((obj_player.x >= x+alert_range || obj_player.x <= x-alert_range-spr_tex_w) && alert_sleep) {
	alert_sleep = false;
	spr_tex = spr_tex_sleep;
	curr_frame = 0;
	min_frame = 4;
	anim_time = 5;
}

if(curr_frame == 3)
	anim_time = 15;
	
alarm[1] = anim_time;