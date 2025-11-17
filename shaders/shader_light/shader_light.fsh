//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_worldNormal;

varying float v_lightDist;
varying vec2 v_ShadowTexcoord;

varying float v_depth;

uniform sampler2D s_DepthTexture;

const vec3 UNDO = vec3(1.0, 256.0, 65536.0) / 16777215.0 * 255.0;
float depthFromColor(vec3 color) {
    return dot(color, UNDO);
}

void main()
{
	float ambient = 0.2;
	vec4 lightColor = vec4(1., 5., 5., 1.);
	//vec3 lightDirection = -normalize(vec3(.5, -1., 0.5));
	vec3 lightDirection = -normalize(vec3(0.5, -1., 0.5));
	
	float NdotL = max(dot(v_worldNormal, lightDirection), 0.) + ambient;
	
	vec4 final_col =  v_vColour * texture2D( gm_BaseTexture, v_vTexcoord )*vec4((lightColor * NdotL).xyz, 1.);
	
    //gl_FragColor = texture2D(s_DepthTexture, v_ShadowTexcoord);//final_col;
	
	vec4 sampledDepthColor = texture2D(s_DepthTexture, v_ShadowTexcoord);
	float depthValue = depthFromColor(sampledDepthColor.rgb);
	
	float bias = 0.01;
	if (v_lightDist > depthValue + bias) {
        final_col.rgb *= 0.1;
    }
	
	final_col *= 2.;// high exposure

	
	gl_FragData[0] = final_col;
	gl_FragData[1] = vec4(v_depth, 0., 0., 1.);
}



