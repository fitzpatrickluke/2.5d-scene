
var spd = 2;

if(keyboard_check(vk_down)) {
	y += spd;
	curr_dir = 0;
	max_frame = 1;
}
else if(keyboard_check(vk_up)) {
	y -= spd;
	curr_dir = 1;
	max_frame = 1;
}
else if(keyboard_check(vk_right)) {
	x += spd;
	curr_dir = 2;
	max_frame = 1;
}
else if(keyboard_check(vk_left)) {
	x -= spd;
	curr_dir = 3;
	max_frame = 1;
}
else {
	curr_dir = 4;
	//curr_frame = 0;
	max_frame = 3;
}

