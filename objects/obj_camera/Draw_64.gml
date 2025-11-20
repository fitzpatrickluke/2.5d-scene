
shader_set(shd_dof);

texture_set_stage(shader_get_sampler_index(shd_dof, "sampDepth"), surface_get_texture(surf_depth));
texture_set_stage(shader_get_sampler_index(shd_dof, "sampBlur"), surface_get_texture(surf_blur));
shader_set_uniform_f(shader_get_uniform(shd_dof, "u_near"), 0.);
shader_set_uniform_f(shader_get_uniform(shd_dof, "u_far"), 120.);
shader_set_uniform_f(shader_get_uniform(shd_dof, "u_focus"), 240.);



draw_surface(surface_1, 0, 0)
//draw_surface(shadowmap_surface, 0, -600)

shader_reset();



