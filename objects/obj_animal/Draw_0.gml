

if(obj_on)
{
	matrix_set(matrix_world, matrix_build(x, y, 0, 0, 0, 0, 1, 1, 1));

	vertex_submit(v_buffer, pr_trianglelist, sprite_get_texture(spr_tex, curr_frame));

	matrix_set(matrix_world, matrix_build_identity());
}