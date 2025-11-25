if(!music_playing) {
	var rr = irandom(600);
	if(rr = 1) {
		var _snd = audio_play_sound(Sound2, 0, false);
		audio_sound_gain(_snd, 0, 0);
		audio_sound_gain(_snd, 0.05, 5000);
		music_playing = true;
	}
}
if(music_playing && !audio_is_playing(Sound2)) {
	music_playing = false;
}

if((obj_player.x < 120 || obj_player.x > 288) && obj_player.y < 264)
	audio_sound_gain(Sound1, 0.1, 500);
else
	audio_sound_gain(Sound1, 1, 1000);


sun_dx += sun_dx_spd;
if(sun_dx == 1)
	sun_dx_spd = -1*sun_spd_const;
else if(sun_dx == -1)
	sun_dx_spd = sun_spd_const;

sun_dy += sun_dy_spd;	
if(sun_dx = 0 || (sun_dx == 1 || sun_dx == -1)) {
	sun_dy_spd *= -1;
}
	