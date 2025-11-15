
/*
shader_set(Shader1);


shader_set_uniform_f(shader_get_uniform(Shader1, "u_Rotation"),0, pi/2,0);

with(obj_tree) {
event_perform(ev_draw, 0);
}

shader_reset();
*/


shader_set(shader_test_light);

with(obj_ground) {
event_perform(ev_draw, 0);
}

shader_reset();
with(obj_tree) {
event_perform(ev_draw, 0);
}
shader_reset();
with(obj_player) {
event_perform(ev_draw, 0);
}






