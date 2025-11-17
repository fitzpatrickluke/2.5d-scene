function surface_apply_ssao(surf,depth_surf,normal_surf){
	///get albedo (color map)
	var albedo = application_surface;

	///create our ssao and apply it to our scene
	shader_set(shd_ssao);

	//pass occlusion factor
	shader_set_uniform_f(shader_get_uniform(shader_current(),"quality"),occlusion_quality);

	//pass view and projection matrix to the sader
	shader_set_uniform_matrix_array(shader_get_uniform(shader_current(),"mView"),view_mat);
	shader_set_uniform_matrix_array(shader_get_uniform(shader_current(),"mProj"),proj_mat);

	//pass the kernels to the shader
	shader_set_uniform_f_array(shader_get_uniform(shader_current(),"samples"),_KERNEL);

	//pass the deferred renders into the shader
	texture_set_stage(shader_get_sampler_index(shader_current(),"depthMap"),surface_get_texture(depth_surf));
	texture_set_stage(shader_get_sampler_index(shader_current(),"normalMap"),surface_get_texture(normal_surf));

	//draw scene into surface
	surface_set_target(surf);
	draw_clear_alpha(0,0);
	draw_surface(albedo,0,0);
	surface_reset_target();

	shader_reset();
}