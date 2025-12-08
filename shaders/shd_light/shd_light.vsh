
attribute vec3 in_Position;                  // (x,y,z)
attribute vec3 in_Normal;					 // (x,y,z)     
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_worldNormal;

uniform mat4 u_lightViewMap;
uniform mat4 u_lightProjMap;

varying float v_lightDist;
varying vec2 v_ShadowTexcoord;

varying float v_depth;

varying vec3 v_worldPos;


void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
	
	vec3 worldNormal = normalize(gm_Matrices[MATRIX_WORLD] * vec4(in_Normal, 0.)).xyz;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
	v_worldNormal = worldNormal;
	
	vec4 worldSpace = gm_Matrices[MATRIX_WORLD] * vec4(in_Position, 1.);
	vec4 cameraSpace = u_lightViewMap * worldSpace;
	vec4 screenSpace = u_lightProjMap * cameraSpace;
	
	v_worldPos = worldSpace.xyz;
	
	v_lightDist = screenSpace.z / screenSpace.w;
	v_ShadowTexcoord = ((screenSpace.xy / screenSpace.w) * 0.5) + 0.5;
	
	v_depth = (gm_Matrices[MATRIX_WORLD_VIEW] * vec4(in_Position, 1.)).z;
	
}
