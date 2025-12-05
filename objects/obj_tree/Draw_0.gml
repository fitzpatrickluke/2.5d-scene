

if(obj_camera.draw_shadow) {
vertex_submit(v_buffer_shadow, pr_trianglelist, sprite_get_texture(spr_tex_bridge, 0));
//vertex_submit(v_buffer, pr_trianglelist, sprite_get_texture(spr_tex, curr_frame));
}
else {
//vertex_submit(v_buffer_shadow, pr_trianglelist, sprite_get_texture(spr_tex_bridge, 0));
vertex_submit(v_buffer, pr_trianglelist, sprite_get_texture(spr_tex, curr_frame));
}
