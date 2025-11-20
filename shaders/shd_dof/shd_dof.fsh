varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D sampDepth;
uniform sampler2D sampBlur;
uniform sampler2D sampBloom;

uniform float u_near;
uniform float u_far;
uniform float u_focus;

void main()
{
	/////// DOF
    vec4 color_main = texture2D(gm_BaseTexture, v_vTexcoord);
    vec4 color_blur = texture2D(sampBlur, v_vTexcoord);
	vec4 color_bloom = texture2D(sampBlur, v_vTexcoord);
    float depth_value = texture2D(sampDepth, v_vTexcoord).r;
    /*
	if(depth_value > u_near  && depth_value < u_far)
		gl_FragColor = color_blur;
	else
		gl_FragColor = color_main;
	*/
	float depth_under_crosshairs = clamp(texture2D(sampDepth, vec2(0.5, 0.5)).r, 10.0, 1000.0);
    
    float blur_amount = smoothstep(u_near, u_far, abs(depth_value-u_focus));
	
	vec4 finalCol = mix(color_main, color_blur, blur_amount);
	
	finalCol += color_bloom*0.5;
	
    gl_FragColor = finalCol;

	

	
}