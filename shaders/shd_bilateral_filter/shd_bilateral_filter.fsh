uniform sampler2D depthMap;
uniform sampler2D normalMap;

varying vec2 v_vTexcoord;

uniform vec3 texel;
uniform mat4 mView;
uniform mat4 mProj;

//get view position
vec3 getPosition() { return -(mView[3] * mView).xyz; }

//get 3D world position from linear depth (script based off of 3D to 2D script by theSnidr)
vec3 depthToPosition(float depth, vec2 uv) {
    
    vec2 oc = (2. * (uv - .5)) / vec2(mProj[0].x,mProj[1].y);
    
    float mx = mView[0].z + oc.x * mView[0].x + oc.y * mView[0].y;
    float my = mView[1].z + oc.x * mView[1].x + oc.y * mView[1].y;
    float mz = mView[2].z + oc.x * mView[2].x + oc.y * mView[2].y;
                    
    return getPosition() + (vec3(mx,my,mz) * depth);
}

vec3 getNormal(vec2 uv) {
	return texture2D( normalMap, uv ).rgb * 2. - 1.;
}

///Lets a go!
void main() {
	
	float md = 1.;
	float mn = .5;
	
    vec2 sc = texel.z/texel.xy;
    vec4 color = texture2D( gm_BaseTexture, v_vTexcoord); if (color.a < .01) discard;
    
	vec4 pxy = color;
	vec4 px1 = texture2D(gm_BaseTexture, clamp(v_vTexcoord+vec2( sc.x,0.),vec2(0.),vec2(1.))); //x+
	vec4 px2 = texture2D(gm_BaseTexture, clamp(v_vTexcoord+vec2(-sc.x,0.),vec2(0.),vec2(1.))); //x-
	vec4 py1 = texture2D(gm_BaseTexture, clamp(v_vTexcoord+vec2(0.,-sc.y),vec2(0.),vec2(1.))); //y-
	vec4 py2 = texture2D(gm_BaseTexture, clamp(v_vTexcoord+vec2( 0.,sc.y),vec2(0.),vec2(1.))); //y+
	
	float dxy = texture2D(depthMap, v_vTexcoord).r;
	float dx1 = texture2D(depthMap, clamp(v_vTexcoord+vec2( sc.x,0.),vec2(0.),vec2(1.))).r;
	float dx2 = texture2D(depthMap, clamp(v_vTexcoord+vec2(-sc.x,0.),vec2(0.),vec2(1.))).r;
	float dy1 = texture2D(depthMap, clamp(v_vTexcoord+vec2(0.,-sc.y),vec2(0.),vec2(1.))).r;
	float dy2 = texture2D(depthMap, clamp(v_vTexcoord+vec2( 0.,sc.y),vec2(0.),vec2(1.))).r;
	
	vec3 nxy = getNormal(v_vTexcoord);
	vec3 nx1 = getNormal(clamp(v_vTexcoord+vec2( sc.x,0.),vec2(0.),vec2(1.)));
	vec3 nx2 = getNormal(clamp(v_vTexcoord+vec2(-sc.x,0.),vec2(0.),vec2(1.)));
	vec3 ny1 = getNormal(clamp(v_vTexcoord+vec2(0.,-sc.y),vec2(0.),vec2(1.)));
	vec3 ny2 = getNormal(clamp(v_vTexcoord+vec2( 0.,sc.y),vec2(0.),vec2(1.)));
	
	vec4 fx1 = (dot(nxy,nx1) > mn ? px1 : pxy);
	vec4 fx2 = (dot(nxy,nx2) > mn ? px2 : pxy);
	vec4 fy1 = (dot(nxy,ny1) > mn ? py1 : pxy);
	vec4 fy2 = (dot(nxy,ny2) > mn ? py2 : pxy);
	
    color += (distance(dx1,dxy) > md ? pxy : fx1);
    color += (distance(dx2,dxy) > md ? pxy : fx2);
    color += (distance(dy1,dxy) > md ? pxy : fy1);
    color += (distance(dy2,dxy) > md ? pxy : fy2);
    
    gl_FragColor = color/5.;
}