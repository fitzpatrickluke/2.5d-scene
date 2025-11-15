precision mediump float;

varying vec2 v_tex;
varying vec3 v_nrm;

uniform sampler2D u_texture;
uniform vec3 u_lightDir;   // normalized
uniform float u_strength;  // 0–2

void main() {
    vec4 albedo = texture2D(u_texture, v_tex);

    // simple N·L lighting
    float ndl = max(dot(normalize(v_nrm), normalize(-u_lightDir)), 0.0);

    vec3 lit = albedo.rgb * (0.2 + ndl * u_strength); // 0.2 = tiny ambient

    gl_FragColor = vec4(lit, albedo.a);
}
