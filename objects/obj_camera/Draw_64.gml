

shader_set(shd_postProcessing);

texture_set_stage(shader_get_sampler_index(shd_postProcessing, "sampDepth"), surface_get_texture(surf_depth));
texture_set_stage(shader_get_sampler_index(shd_postProcessing, "sampBlur"), surface_get_texture(surf_blur));
texture_set_stage(shader_get_sampler_index(shd_postProcessing, "sampBloom"), surface_get_texture(surf_bloom_blur));
shader_set_uniform_f(shader_get_uniform(shd_postProcessing, "u_near"), 0.);
shader_set_uniform_f(shader_get_uniform(shd_postProcessing, "u_far"), 120.);
shader_set_uniform_f(shader_get_uniform(shd_postProcessing, "u_focus"), 240.);

draw_surface(surface_draw, 0, 0)

shader_reset();

shader_set(shd_godRays);

draw_surface(surface_draw, 0, 0);

shader_reset();


//draw_surface(surface_shadows, -400, -400)

