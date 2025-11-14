attribute vec3 in_Position;
attribute vec2 in_Texcoord;

varying vec2 vUV;

void main() {
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
    vUV = in_Texcoord;
}
