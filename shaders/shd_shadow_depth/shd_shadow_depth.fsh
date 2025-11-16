// Fragment shader for shadow map generation

void main() {
    // The depth is automatically written to the depth buffer
    // If using a color surface, encode depth into color channels
    // For floating-point surfaces, this is not necessary
    // Example for encoding depth into red channel:
    float depth = gl_FragCoord.z; // Depth in [0, 1]
    gl_FragColor = vec4(depth, depth, depth, 1.0);
}