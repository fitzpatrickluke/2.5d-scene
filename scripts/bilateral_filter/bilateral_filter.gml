function bilateral_filter(surf,depth_surf,normal_surf){
		var camera = view_camera[0];
		var width = camera_get_view_width(camera);
		var height = camera_get_view_height(camera);
		
		///set up the temporary surfaces
		var blur_temp1 = surface_create(width,height);
		var blur_temp2 = surface_create(width,height);
		var s2, s1 = blur_temp1;
		
		surface_set_target(blur_temp1);
		draw_clear_alpha(0,0);
		draw_surface(surf,0,0);
		surface_reset_target();
		
		surface_set_target(blur_temp2);
		draw_clear_alpha(0,0);
		draw_surface(surf,0,0);
		surface_reset_target();
		
		///apply bilateral filter per each surface blur
		for(var f = 0; f < 4; f++) {
                s1 = frac(f/2) == 0 ? blur_temp1 : blur_temp2;
                s2 = frac(f/2) ==.5 ? blur_temp1 : blur_temp2;

                surface_set_target(s1);
                shader_set(shd_bilateral_filter);
				shader_set_uniform_matrix_array(shader_get_uniform(shader_current(),"mView"),view_mat);
				shader_set_uniform_matrix_array(shader_get_uniform(shader_current(),"mProj"),proj_mat);
                shader_set_uniform_f(shader_get_uniform(shader_current(),"texel"),width,height,f+1);
				texture_set_stage(shader_get_sampler_index(shader_current(),"depthMap"),surface_get_texture(depth_surf));
				texture_set_stage(shader_get_sampler_index(shader_current(),"normalMap"),surface_get_texture(normal_surf));
                draw_surface(s2,0,0);
                shader_reset();
                surface_reset_target();
         }
		 
		 ///apply last surface render to the final ssao render
		 surface_set_target(surf);
		 draw_clear_alpha(0,0);
		 draw_surface(s1,0,0);
		 surface_reset_target();
		 
		 ///Im FWEEEEEE!!!
		 surface_free(blur_temp1);
		 surface_free(blur_temp2);
}