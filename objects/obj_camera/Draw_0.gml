

shader_set(shader_z);

with(obj_player) {
	event_perform(ev_draw, 0)
}
/*
with(obj_tree) {
	event_perform(ev_draw, 0)
}
*/
shader_reset();


