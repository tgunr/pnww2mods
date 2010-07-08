uniform vec4 rotation;
uniform vec3 treepos;

uniform vec2 shadowmotion;

vec4 windEffect(vec4, vec2);

varying vec3 normal;

void main()
{
	vec4 position = vec4(gl_Vertex.x, gl_Vertex.y, gl_Vertex.z, 1.0);
		
	/* Shadow Coords */
	gl_TexCoord[2].xy = gl_MultiTexCoord2.zw + shadowmotion;

	vec2 windparams = gl_MultiTexCoord2.xy;
	
	/* Rotate Tree */
	position.xy = vec2(dot(rotation.yxw, position.xyz), dot(rotation.zyw, position.xyz));
	
	/* Rotate Normal */
	normal.xy = vec2(dot(rotation.yxw, gl_Normal), dot(rotation.zyw, gl_Normal));
	normal.z = gl_Normal.z;
	
	normal = normalize(gl_NormalMatrix * normal);
	
	/* Apply Wind to Vertice */
	position = windEffect(position, windparams);
	
	/* Set tree to world position */
	position.xyz += treepos.xyz;
	position.w = 1.0;

	position = gl_ModelViewMatrix * position;
	gl_FogFragCoord = abs(position.z);
	
	gl_Position = gl_ProjectionMatrix * position;
	
	/* Diffuse Coords */
	gl_TexCoord[0] = gl_MultiTexCoord0;
}
