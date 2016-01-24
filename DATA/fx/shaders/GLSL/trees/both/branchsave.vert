#define USE_NORMAL_MAP
//#undef USE_NORMAL_MAP

#define USE_SHADOW_MAP
//#undef USE_SHADOW_MAP

uniform vec4 rotation;
uniform vec3 treepos;

#ifdef USE_SHADOW_MAP
uniform vec2 shadowmotion;
#endif // USE_SHADOW_MAP

vec4 windEffect(vec4, vec2);
float fogValue(float);

varying float fog;
varying vec3 Ltan;
varying vec4 globalambient;

vec4 getLightPosition();
vec4 getLightDiffuse();
vec4 getLightAmbient();

void main()
{
	vec4 position = vec4(gl_Vertex.x, gl_Vertex.y, gl_Vertex.z, 1.0);
		
#ifdef USE_SHADOW_MAP
	/* Shadow Coords */
	gl_TexCoord[2].xy = gl_MultiTexCoord2.zw + shadowmotion;
#endif

	vec2 windparams = gl_MultiTexCoord2.xy;
	
#ifdef USE_NORMAL_MAP
	vec3 tangent = gl_MultiTexCoord3.xyz;
#endif

	/* Rotate Tree */
	position.xy = vec2(dot(rotation.yxw, position.xyz), dot(rotation.zyw, position.xyz));
	
	/* Rotate Normal */
	vec3 normal;
	normal.xy = vec2(dot(rotation.yxw, gl_Normal), dot(rotation.zyw, gl_Normal));
	normal.z = gl_Normal.z;
	
	/* Apply Wind to Vertice */
	position = windEffect(position, windparams);
	
	/* Set tree to world position */
	position.xyz += treepos.xyz;
	position.w = 1.0;

	vec3 L = normalize(getLightPosition().xyz);

#ifdef USE_NORMAL_MAP
	/* Apply normal mapping */
	tangent.xy = vec2(dot(rotation.yxw, tangent.xyz), dot(rotation.zyw, tangent.xyz));
	vec3 binormal = cross(normal, tangent);
	
	// All in eye space
	tangent = normalize(gl_NormalMatrix * tangent);
	binormal = normalize(gl_NormalMatrix * binormal);
	normal = normalize(gl_NormalMatrix * normal);
		
	Ltan.x = dot(L, tangent);
	Ltan.y = dot(L, binormal);
	Ltan.z = dot(L, normal);
	
#else
	normal = normalize(gl_NormalMatrix * normal);

	vec3 color = gl_FrontMaterial.diffuse.rgb * 
	             getLightDiffuse().rgb *
                 max(dot(normal.xyz, L), 0.0);
	
	gl_TexCoord[4].xyz = color;
#endif

	globalambient = gl_FrontMaterial.ambient * (getLightAmbient() + gl_LightModel.ambient);
	
	gl_Position = gl_ModelViewProjectionMatrix * position;
	
	/* Diffuse Coords */
	gl_TexCoord[0] = gl_MultiTexCoord0;
	
#ifdef USE_NORMAL_MAP
	/* Normal Map Coords */
	gl_TexCoord[1] = gl_MultiTexCoord1;
#endif

	fog = fogValue(gl_Position.z);
}
