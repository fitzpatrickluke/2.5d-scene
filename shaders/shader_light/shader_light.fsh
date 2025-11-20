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
uniform vec3 u_lightDirection;

uniform vec3 u_pointLightPos;
uniform vec3 u_pointLightColor;
uniform float u_pointLightRange; 

varying vec3 v_worldPos;

const vec3 UNDO = vec3(1.0, 256.0, 65536.0) / 16777215.0 * 255.0;
float depthFromColor(vec3 color) {
    return dot(color, UNDO);
}

void main()
{
	// directional light stuff
	
	float ambient = 0.2;
	vec4 lightColor = vec4(1., 5., 5., 1.);
	
	vec3 lightDirection = -normalize(vec3(u_lightDirection));
	
	float NdotL = max(dot(v_worldNormal, lightDirection), 0.) + ambient;
	
	vec4 final_col =  v_vColour * texture2D( gm_BaseTexture, v_vTexcoord )*vec4((lightColor * NdotL).xyz, 1.);
	
	// Point light stuff
	/*
	vec4 lightColor = vec4(1., 5., 5., 1.);
	vec4 lightAmbient = vec4(0.25, 0.25, 0.25, 1.);
    vec3 pointLightDir = v_worldPos - u_pointLightPos;
    float pointLightDist = length(pointLightDir);
    float att = max((u_pointLightRange - pointLightDist) / u_pointLightRange, 0.);
    
    pointLightDir = normalize(-pointLightDir);
    float NdotL = max(dot(v_worldNormal, pointLightDir), 0.);
    
    vec4 final_col =  v_vColour * texture2D( gm_BaseTexture, v_vTexcoord ) * vec4(min(lightAmbient + att * lightColor * NdotL, vec4(1.)).rgb, 1.);
	
	*/
	
	// shadow stuff
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

	if(final_col.a < 0.1)
		discard;
	
	gl_FragData[0] = vec4(final_col.rgb*.4, 1.);
	gl_FragData[1] = vec4(v_depth, 0., 0., 1.);
	
}



