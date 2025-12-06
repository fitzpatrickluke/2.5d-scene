varying float v_DistanceToCamera;
varying vec4 v_vColour;
varying vec2 v_vTexcoord;

const float DEPTH_SCALE_FACTOR = 16777215.0;

vec3 toDepthColor(float depth) {
    float longDepth = depth * DEPTH_SCALE_FACTOR;
    vec3 depthAsColor = vec3(mod(longDepth, 256.0),
                             mod(longDepth / 256.0, 256.0),
                             longDepth / 65536.0);
    depthAsColor = floor(depthAsColor);
    depthAsColor /= 255.0;
    return depthAsColor;
}

void main() {

    vec4 tex = texture2D(gm_BaseTexture, v_vTexcoord);

    float alpha = tex.a * v_vColour.a;

    if (alpha < 0.1) {
        discard;
    }
    gl_FragColor = vec4(toDepthColor(v_DistanceToCamera), 1.0);
}