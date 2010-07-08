#version 120

uniform vec4 rotation;
uniform vec3 treepos;

varying vec3 N;
varying vec3 vpos;

void main()
{
	vec4 position = vec4(gl_Vertex.x, gl_Vertex.y, gl_Vertex.z, 1.0);
			
	/* Rotate Tree */
	position.xy = vec2(dot(rotation.yxw, position.xyz), dot(rotation.zyw, position.xyz));
	
	/* Rotate Normal */
	N.xy = vec2(dot(rotation.yxw, gl_Normal), dot(rotation.zyw, gl_Normal));
	N.z = gl_Normal.z;
	
	N = normalize(gl_NormalMatrix * N);
	
	/* Set tree to world position */
	position.xyz += treepos.xyz;
	position.w = 1.0;

	position = gl_ModelViewMatrix * position;
	vpos = position.xyz;
	
	gl_FogFragCoord = abs(position.z);
	
	gl_Position = gl_ProjectionMatrix * position;
	
	/* Diffuse Coords */
	gl_TexCoord[0] = gl_MultiTexCoord0;
	gl_TexCoord[1] = gl_MultiTexCoord1;
}
