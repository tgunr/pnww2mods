uniform vec4 rotation;
uniform vec3 treepos;
uniform vec2 shadowmotion;

uniform float diffuseScale;

varying vec3 N;

vec4 windEffect(vec4, vec2);

void main()
{
	vec4 position = vec4(gl_Vertex.x, gl_Vertex.y, gl_Vertex.z, 1.0);
		
	vec3 normal;
	vec2 diffusecoords = gl_MultiTexCoord0.xy;
	
	/* Shadow Coords */
	gl_TexCoord[1].xy = gl_MultiTexCoord1.zw + shadowmotion;
	
	vec2 windparams = gl_MultiTexCoord1.xy;
	
	position.xy = vec2(dot(rotation.yxw, position.xyz), dot(rotation.zyw, position.xyz));
	normal.xy = vec2(dot(rotation.yxw, gl_Normal), dot(rotation.zyw, gl_Normal));
	normal.z = gl_Normal.z;
	
	N = normalize(gl_NormalMatrix * normal);

	position = windEffect(position, windparams);
	
	position.xyz += treepos.xyz;
	position.w = 1.0;
	
	position = gl_ModelViewMatrix * position;
	gl_FogFragCoord = abs(position.z);
	
	gl_Position = gl_ProjectionMatrix * position;
	gl_TexCoord[0] = gl_MultiTexCoord0;
}
