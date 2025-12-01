
// have sound of river player louder when closer to river
if((obj_player.x < 120 || obj_player.x > 288) && obj_player.y < 264)
	audio_sound_gain(sound_river, 0.1, 500);
else
	audio_sound_gain(sound_river, 1, 1000);


// unused play music
/*
var rr = irandom(3600);
if(!music_playing) {
	
	if(rr = 1) {
		var _snd = audio_play_sound(sound_music, 0, true);
		audio_sound_gain(_snd, 0, 0);
		audio_sound_gain(_snd, 0.05, 5000);
		music_playing = true;
	}
}

if(music_playing && !audio_is_playing(sound_music)) {
	music_playing = false;
}
if(rr == 2) {
	music_playing = false;
	audio_stop_sound(sound_music)
}
*/

// unused move sun
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