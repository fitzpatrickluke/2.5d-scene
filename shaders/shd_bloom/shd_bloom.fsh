//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec3 col = (v_vColour * texture2D( gm_BaseTexture, v_vTexcoord )).rgb;
	float brightness = dot(col, vec3(0.7, 0.7, 0.7));
  
	  if (brightness > 0.6) {
	    gl_FragColor = vec4(col, 1.0);
	  } 
	  else {
	    gl_FragColor = vec4(0.0);
	  }

}
