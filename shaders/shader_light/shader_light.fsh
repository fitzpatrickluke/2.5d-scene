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
	vec3 lightDirection = -normalize(vec3(1., -1., -1.));
	
	float NdotL = max(dot(v_worldNormal, lightDirection), 0.) + ambient;
	
	vec4 final_col =  v_vColour * texture2D( gm_BaseTexture, v_vTexcoord )*vec4((lightColor * NdotL).xyz, 1.);
	
    //gl_FragColor = texture2D(s_DepthTexture, v_ShadowTexcoord);//final_col;
	
	vec4 sampledDepthColor = texture2D(s_DepthTexture, v_ShadowTexcoord);
	float depthValue = depthFromColor(sampledDepthColor.rgb);
	
	/*
	float bias = 0.;//max(0.05 * (1.0 -dot(v_worldNormal, lightDirection)), 0.0005);  
	if (v_lightDist > depthValue + bias) {
        final_col.rgb *= 0.1;
    }
	*/
	
	float bias = 0.0;//1;
	float shadow = 0.0;
	vec2 texelSize = vec2(1.0 / 1024.0);
	for(int x = -2; x <= 2; x+=1)
	{
	    for(int y = -2; y <= 2; y+=1)
	    {
	       float sampleDepth = depthFromColor(
            texture2D(
                s_DepthTexture,
                v_ShadowTexcoord + vec2(x, y) * texelSize
            ).rgb
        );
		        shadow += (v_lightDist > sampleDepth + bias) ? 0.8 : 0.0;
	    }    
	}
	shadow /= 25.;

	final_col.rgb *= 1.0 - shadow;

	
	//final_col *= 2.;// high exposure
	
	gl_FragData[0] = final_col;
	gl_FragData[1] = vec4(v_depth, 0., 0., 1.);
	
}



