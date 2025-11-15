/*
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
*/

//vertex_submit(v_buffer, pr_trianglelist, sprite_get_texture(Sprite7, 0));
vertex_submit(v_buffer, pr_trianglelist, -1);

/*
gpu_set_zwriteenable(false);
gpu_set_ztestenable(false);
*/