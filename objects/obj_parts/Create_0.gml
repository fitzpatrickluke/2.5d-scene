

// Particle system
ps = part_system_create();
part_system_depth(ps, -100); // draw above stuff

// Particle type
pt = part_type_create();

// Visuals
//part_type_shape(pt, pt_shape_circle);
part_type_sprite(pt, Sprite29, 0, 0, 0)
part_type_size(pt, 0.5, 2, 0, 0);
part_type_color1(pt, c_red); // pale yellow & pale blue
part_type_alpha3(pt, 0, 0.7, 0); // fade in/out
part_type_blend(pt, true);


// Behavior
part_type_speed(pt, 0.05, 0.15, 0, 0); // slow float
part_type_direction(pt, 0, 360, 0, 0); // all directions
part_type_gravity(pt, 0, 0);
part_type_life(pt, 120, 300); // lives a while

// Orientation wiggle
part_type_orientation(pt, 0, 360, 0, 1, true);

// Emitters so it hangs around the whole room
em = part_emitter_create(ps);
part_emitter_region(ps, em, 0, window_get_width(), 0, window_get_height(), ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(ps, em, pt, 2); // spawns every step, keeps room filled


/*


num_lights = 8;
spr_scale = 2;
lights = array_create(0);
alarm[0] = 1;
*/