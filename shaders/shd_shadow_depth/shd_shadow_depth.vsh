// Vertex shader for shadow map generation

attribute vec3 in_Position;      // Vertex position (x, y, z)
uniform mat4 u_LightViewProj;    // Light's view-projection matrix

void main() {
    // Transform vertex to light's clip space
    gl_Position = u_LightViewProj * vec4(in_Position, 1.0);
    // No need to pass varyings; only depth is needed
}