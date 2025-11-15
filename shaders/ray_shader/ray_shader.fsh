uniform sampler2D u_scene;
uniform vec2 u_lightPos; // in screen space (0..1)
uniform float u_decay;
uniform float u_exposure;
uniform float u_density;
uniform int u_samples;

void main() {
    vec2 uv = gl_FragCoord.xy / resolution.xy;
    vec2 delta = uv - u_lightPos;
    delta *= u_density / float(u_samples);

    vec3 color = vec3(0.0);
    vec2 coord = uv;

    for(int i = 0; i < u_samples; i++) {
        coord -= delta;
        color += texture(u_scene, coord).rgb * u_exposure;
        u_exposure *= u_decay;
    }

    gl_FragColor = vec4(color, 1.0);
}
