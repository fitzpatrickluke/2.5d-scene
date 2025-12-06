
var spd = 2;

if(keyboard_check(vk_down) || keyboard_check(ord("S"))) {

	var lay_id = layer_get_id("Tiles_1");
	var map_id = layer_tilemap_get_id(lay_id);
	if(place_meeting(x,y+spd,map_id))
		spd = 0;
	y += spd;
	curr_dir = 0;
	max_frame = 1;
	curr_spr = spr_player_D;
}
else if(keyboard_check(vk_up) || keyboard_check(ord("W"))) {
	var lay_id = layer_get_id("Tiles_1");
	var map_id = layer_tilemap_get_id(lay_id);
	if(place_meeting(x,y-spd,map_id))
		spd = 0;
	y -= spd;
	curr_dir = 1;
	max_frame = 1;
	curr_spr = spr_player_U;
}
else if(keyboard_check(vk_right) || keyboard_check(ord("D"))) {
	var lay_id = layer_get_id("Tiles_1");
	var map_id = layer_tilemap_get_id(lay_id);
	if(place_meeting(x+spd,y,map_id))
		spd = 0;
	x += spd;
	curr_dir = 2;
	max_frame = 1;
	curr_spr = spr_player_R;
}
else if(keyboard_check(vk_left) || keyboard_check(ord("A"))) {

	var lay_id = layer_get_id("Tiles_1");
	var map_id = layer_tilemap_get_id(lay_id);
	if(place_meeting(x-spd,y,map_id))
		spd = 0;
	x -= spd;
	curr_dir = 3;
	max_frame = 1;
	curr_spr = spr_player_L;
}
else {

	curr_dir = 4;
	max_frame = 3;
	curr_spr = spr_player_Idle;
}

