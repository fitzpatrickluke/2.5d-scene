// adapted from: https://godotshaders.com/shader/god-rays/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const float ANGLE          = 0.65;
const float POSITION       = 0.2;
const float SPREAD         = 0.8;
const float CUTOFF         = 0.25;
const float FALLOFF        = 0.2;
const float EDGE_FADE      = 0.5;

const float SPEED          = 1.0;
const float RAY1_DENSITY   = 40.0;
const float RAY2_DENSITY   = 8.0;
const float RAY2_INTENSITY = 0.2;

const vec4  COLOR_VEC      = vec4(1.0, 0.9, 0.65, 0.8);

const float HDR_ON         = 1.0;
const float SEED_CONST     = 30.0;

const float TIME_CONST     = 1.0;

float random(vec2 uv) {
    return fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453123);
}

float noise(vec2 uv) {
    vec2 i = floor(uv);
    vec2 f = fract(uv);

    float a = random(i);
    float b = random(i + vec2(1.0, 0.0));
    float c = random(i + vec2(0.0, 1.0));
    float d = random(i + vec2(1.0, 1.0));

    vec2 u = f * f * (3.0 - 2.0 * f);

    return mix(a, b, u.x)
         + (c - a) * u.y * (1.0 - u.x)
         + (d - b) * u.x * u.y;
}

mat2 rotate(float a) {
    float s = sin(a);
    float c = cos(a);
    return mat2(c, -s, s, c);
}

vec4 screen(vec4 base, vec4 blend) {
    return 1.0 - (1.0 - base) * (1.0 - blend);
}

void main() {
    vec2 uv = v_vTexcoord;

    vec2 transformed_uv =
        (rotate(ANGLE) * (uv - POSITION)) /
        ((uv.y + SPREAD) - (uv.y * SPREAD));

    vec2 ray1 = vec2(
        transformed_uv.x * RAY1_DENSITY
        + sin(TIME_CONST * 0.1 * SPEED) * (RAY1_DENSITY * 0.1)
        + SEED_CONST,
        1.0
    );

    vec2 ray2 = vec2(
        transformed_uv.x * RAY2_DENSITY
        + sin(TIME_CONST * 0.2 * SPEED) * (RAY1_DENSITY * 0.2)
        + SEED_CONST,
        1.0
    );

    float cut = step(CUTOFF, transformed_uv.x) * step(CUTOFF, 1.0 - transformed_uv.x);
    ray1 *= cut;
    ray2 *= cut;

    float rays;
    if (HDR_ON > 0.5) {
        rays = noise(ray1) + noise(ray2) * RAY2_INTENSITY;
    } else {
        rays = clamp(noise(ray1) + noise(ray2) * RAY2_INTENSITY, 0.0, 1.0);
    }

    rays *= smoothstep(0.0, FALLOFF, (1.0 - uv.y));
    rays *= smoothstep(CUTOFF, EDGE_FADE + CUTOFF, transformed_uv.x);
    rays *= smoothstep(CUTOFF, EDGE_FADE + CUTOFF, 1.0 - transformed_uv.x);

    vec3 shine = vec3(rays) * COLOR_VEC.rgb;

    vec4 base = texture2D(gm_BaseTexture, uv);
    shine = screen(base, COLOR_VEC).rgb;

    gl_FragColor = vec4(shine, rays * COLOR_VEC.a);
}
