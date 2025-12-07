
if((obj_player.x < 120 || obj_player.x > 288) && obj_player.y < 264)
	audio_sound_gain(Sound_water, 0.1, 500);
else
	audio_sound_gain(Sound_water, 1, 1000);



if (keyboard_check(ord("B"))) {
    cam_angle += rot_speed;     // rotate clockwise
	if(cam_angle > 270+rot_max)
		cam_angle = 270+rot_max;
		
	cam_angle_bush += rot_speed*bush_dcr;     // rotate counter-clockwise
	if(cam_angle_bush > 270+rot_max*bush_dcr)
		cam_angle_bush = 270+rot_max*bush_dcr;
}
if (keyboard_check(ord("M"))) {
    cam_angle -= rot_speed;     // rotate counter-clockwise
	if(cam_angle < 270-rot_max)
		cam_angle = 270-rot_max;
		
	cam_angle_bush -= rot_speed*bush_dcr;     // rotate counter-clockwise
	if(cam_angle_bush < 270-rot_max*bush_dcr)
		cam_angle_bush = 270-rot_max*bush_dcr;
}
var a = degtorad(cam_angle);

// compute camera position around player (orbit)
x_from = obj_player.x + lengthdir_x(cam_distance, cam_angle);
y_from = obj_player.y + lengthdir_y(cam_distance, cam_angle);
z_from = cam_height;

// always look at player
x_to = obj_player.x;
y_to = obj_player.y;
z_to = 0;

/*
x_to = obj_player.x;
y_to = obj_player.y;
z_to = 0;

x_from = obj_player.x;
y_from = obj_player.y+72*1.5*2;
z_from = 72*1.5;
var spd = 2;

if(keyboard_check(ord("B"))) {
	x_offset += spd;
	y_offset += spd;
	z_offset += spd;
}
else if(keyboard_check(ord("M"))) {
	x_offset -= spd;
	y_offset -= spd;
	z_offset -= spd;
}
*/

var rr = irandom(3600);
if(!music_playing) {
	
	if(rr = 1) {
		var _snd = audio_play_sound(Sound_music, 0, true);
		audio_sound_gain(_snd, 0, 0);
		audio_sound_gain(_snd, 0.05, 5000);
		music_playing = true;
	}
}
if(music_playing && !audio_is_playing(Sound_music)) {
	music_playing = false;
}
if(rr == 2) {
	music_playing = false;
	audio_stop_sound(Sound_music)
}



/*
sun_dx += sun_dx_spd;
if(sun_dx == 1)
	sun_dx_spd = -1*sun_spd_const;
else if(sun_dx == -1)
	sun_dx_spd = sun_spd_const;

sun_dy += sun_dy_spd;	
if(sun_dx = 0 || (sun_dx == 1 || sun_dx == -1)) {
	sun_dy_spd *= -1;
}

*/
