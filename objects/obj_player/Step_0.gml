
if(place_meeting(x,y, obj_ground)) {
	var oo = instance_place(x, y, obj_ground)
	zz = 24+oo.land_oz;
}
else
	zz = -4;
	
	
var spd = 2;

if(keyboard_check(vk_down)) {

	var lay_id = layer_get_id("Tiles_1");
	var map_id = layer_tilemap_get_id(lay_id);
	if(place_meeting(x,y+spd,map_id))
		spd = 0;
	y += spd;
	curr_dir = 0;
	max_frame = 1;
}
else if(keyboard_check(vk_up)) {
	
	var lay_id = layer_get_id("Tiles_1");
	var map_id = layer_tilemap_get_id(lay_id);
	if(place_meeting(x,y-spd,map_id))
		spd = 0;
	y -= spd;
	curr_dir = 1;
	max_frame = 1;
}
else if(keyboard_check(vk_right)) {

	
	var lay_id = layer_get_id("Tiles_1");
	var map_id = layer_tilemap_get_id(lay_id);
	if(place_meeting(x+spd,y,map_id))
		spd = 0;
	x += spd;
	curr_dir = 2;
	max_frame = 1;

}
else if(keyboard_check(vk_left)) {


	var lay_id = layer_get_id("Tiles_1");
	var map_id = layer_tilemap_get_id(lay_id);
	if(place_meeting(x-spd,y,map_id))
		spd = 0;
	x -= spd;
	curr_dir = 3;
	max_frame = 1;

}
else {
	curr_dir = 4;
	//curr_frame = 0;
	max_frame = 3;
}

