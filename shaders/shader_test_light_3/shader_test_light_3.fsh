//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_worldNormal;

void main()
{
	float ambient = 0.2;
	vec4 lightColor = vec4(1., 1., 1., 1.);
	vec3 lightDirection = -normalize(vec3(.5, -1., 0.5));
	
	float NdotL = max(dot(v_worldNormal, lightDirection), 0.) + ambient;
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord )*vec4((lightColor * NdotL).xyz, 1.);
}
