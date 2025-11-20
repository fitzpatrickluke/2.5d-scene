varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D displacementMap;
uniform float time;

varying float v_depth;

void main() {
    vec2 time_offset = vec2(time, -time / 2.0) / 4.0;
    vec4 displace = texture2D(displacementMap, v_vTexcoord + time_offset);
    float brightness = ((displace.r + displace.g + displace.b) / 3.0) - 0.5;
    vec2 offset = vec2(brightness, 0.0) / 4.0;
    //gl_FragColor = 
	gl_FragData[0] = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord + offset);
	gl_FragData[1] = vec4(v_depth, 0., 0., 1.);
}