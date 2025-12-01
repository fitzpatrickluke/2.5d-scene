varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D displacementMap;
uniform sampler2D foamMap;
uniform float time;

varying float v_depth;

uniform sampler2D s_DepthTexture;
uniform vec3 u_lightDirection;

uniform vec3 u_pointLightPos;
uniform vec3 u_pointLightColor;
uniform float u_pointLightRange;

varying float v_lightDist;
varying vec2 v_ShadowTexcoord;

const vec3 UNDO = vec3(1.0, 256.0, 65536.0) / 16777215.0 * 255.0;
float depthFromColor(vec3 color) {
    return dot(color, UNDO);
}

void main() {
	/////////////// SHADOWS
	vec4 sampledDepthColor = texture2D(s_DepthTexture, v_ShadowTexcoord);
	float depthValue = depthFromColor(sampledDepthColor.rgb);
	vec4 final_col =  v_vColour;
	float bias = 0.01;
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
	final_col.rgb *= 1.0 - shadow*0.5;
	
	/////////////// MOVING EFFECT
	vec2 time_offset = vec2(time, -time / 2.0) / 4.0;
    
    vec4 displace = texture2D(displacementMap, v_vTexcoord + time_offset);
    float brightness = ((displace.r + displace.g + displace.b) / 3.0) - 0.5;
    vec2 offset = vec2(brightness, 0.0) / 4.0;
	
	final_col =  final_col * texture2D(gm_BaseTexture, v_vTexcoord + offset);
	
	/////////////// SET COLOR
	gl_FragData[0] = final_col;
	gl_FragData[1] = vec4(v_depth, 0., 0., 1.);
}