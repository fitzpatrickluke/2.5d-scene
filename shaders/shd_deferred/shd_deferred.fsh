varying vec3 v_vNormal;
varying float v_fDepth;

void main() {
    gl_FragData[0] = vec4( normalize(v_vNormal) * .5 + .5, 1.);
	gl_FragData[1] = vec4(vec3(v_fDepth),1.);
}