attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying float v_DistanceToCamera;

varying vec4 v_vColour;
varying vec2 v_vTexcoord;

void main() {
    vec4 object_space_pos = vec4(in_Position, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;

    v_DistanceToCamera = gl_Position.z / gl_Position.w;
	
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}