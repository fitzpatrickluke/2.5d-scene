///@description Button stuff!

direction += keyboard_check(vk_left) - keyboard_check(vk_right);

occlude = (keyboard_check_pressed(vk_space) ? !occlude : occlude);

occlusion_quality = (occlude ? 64 : 0);