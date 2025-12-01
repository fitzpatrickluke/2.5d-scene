curr_frame += 1;
if(curr_frame > max_frame)
	curr_frame = min_frame;

if(alert_run) {
	x += 16;
	if(x > 600) {
		x = x_start;
		alert_run = false;
		spr_tex = spr_tex_base;
		curr_frame = 0;
		anim_time = 15;
		obj_on = false;
	}
}
	

if((obj_player.x < x+alert_range && obj_player.x > x-alert_range-spr_tex_w) && !alert_run)
{
	alert_run = true;
	spr_tex = spr_tex_run;
	curr_frame = 0;
	anim_time = 5;
}
	
	
if(obj_on)
	alarm[1] = anim_time;
else
	alarm[2] = 60*10;
