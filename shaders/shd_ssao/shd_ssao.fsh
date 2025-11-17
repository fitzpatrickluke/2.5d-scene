uniform sampler2D depthMap;
uniform sampler2D normalMap;

uniform mat4 mView;
uniform mat4 mProj;

uniform float quality;
uniform vec3 samples[128*3]; //can use up to 128 samples

varying vec2 v_vTexcoord;

///////functions///////////
//get camera position
vec3 getPosition() { return -(mView[3] * mView).xyz; }

//get linear depth from world position
float linearDepth(vec3 pos) { return abs((mView * vec4(pos,1.)).z); }

//get 2D coordinates from 3D world position (script based off of 2D to 3D script by theSnidr)
vec2 getCoords(vec3 pos) {
    mat4 V = mView;
    mat4 P = mProj;
    float ww = V[0].z * pos.x + V[1].z * pos.y + V[2].z * pos.z + V[3].z;
    if (ww < 0.01) { return vec2(-1., -1.); }
    
    float cx = P[2].x + P[0].x * (V[0].x * pos.x + V[1].x * pos.y + V[2].x * pos.z + V[3].x) / ww;
    float cy = P[2].y + P[1].y * (V[0].y * pos.x + V[1].y * pos.y + V[2].y * pos.z + V[3].y) / ww;

    return vec2(.5 + .5 * cx, .5 + .5 * cy);
}

//get 3D world position from linear depth (script based off of 3D to 2D script by theSnidr)
vec3 depthToPosition(float depth, vec2 uv) {
    
    vec2 oc = (2. * (uv - .5)) / vec2(mProj[0].x,mProj[1].y);
    
    float mx = mView[0].z + oc.x * mView[0].x + oc.y * mView[0].y;
    float my = mView[1].z + oc.x * mView[1].x + oc.y * mView[1].y;
    float mz = mView[2].z + oc.x * mView[2].x + oc.y * mView[2].y;
                    
    return getPosition() + (vec3(mx,my,mz) * depth);
}
//pseudorandom noise generator based on 3D world position input
vec3 hash3(vec3 p) {
    return fract(cos(p*mat3(94.55,-69.38,73.63,-89.27,78.69,-73.23,84.56,-61.24,86.89))*8676.79);
}

void main() {
    
    //if current pixel has nothing, do not continue
	if (texture2D( depthMap, v_vTexcoord ).a < .001) discard; 
	
	///load deferred renders
    float depth = texture2D( depthMap, v_vTexcoord ).r;
	vec3 normal = texture2D( normalMap, v_vTexcoord ).rgb * 2. - 1.;
    
	//get 3D world position from current pixel's depth
	vec3 position = depthToPosition( depth, v_vTexcoord );
	
    ///create noise factor from our 3D world position
    vec3 random = hash3(position);
	
	//set up Tangent and bitangent to create the matrix for rotating our kernels
    vec3 tangent   = normalize(random - normal * dot(random, normal));
    vec3 bitangent = cross(normal, tangent);
    mat3 TBN       = mat3(tangent, bitangent, normal);
    
    ///create ao properties
    float bias = .025;
    float radius = 8.;
    float occlusion = 0.;
    
    ///Lets spawn some kernels around our pixel and find some occlusion!
    for(int i = 0; i < 128; i++) { //128 is the max acceptable buuuut.........
        
		if (int(quality) < i) break; //... we are only using how much we had set up
		
        //get sample position by rotating our kernels and applying them to our world position from current pixel
        vec3 samplePos = TBN * samples[i]; 
        samplePos = position + samplePos * radius;
        
        //get depth from our sampled position
        vec2 uv = getCoords(samplePos);
        float sampleDepth = texture2D( depthMap, uv ).r;
        
        //check if occluded...
        float rangeCheck = smoothstep(1., 0., abs(linearDepth(position) - sampleDepth)/radius);
        occlusion += (sampleDepth < linearDepth(samplePos) + bias ? rangeCheck : 0.);
    }
	occlusion = pow(1. - (occlusion/quality),1.5);//<---1.5 is the strength, you can either lower it or increase it
    if (quality < .1) occlusion = 1.;
	
	///TADAAA!!!
    gl_FragColor = vec4(vec3(occlusion),1.) * texture2D( gm_BaseTexture, v_vTexcoord );
}