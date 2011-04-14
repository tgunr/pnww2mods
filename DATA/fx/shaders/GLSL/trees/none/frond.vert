#version 120

uniform vec4 rotation;
uniform vec3 treepos;

varying vec3 N;
varying vec3 vertexpos;

void main()
{
	vec4 position = vec4(gl_Vertex.x, gl_Vertex.y, gl_Vertex.z, 1.0);
		
	vec3 normal;
	vec2 diffusecoords = gl_MultiTexCoord0.xy;
			
	position.xy = vec2(dot(rotation.yxw, position.xyz), dot(rotation.zyw, position.xyz));
	normal.xy = vec2(dot(rotation.yxw, gl_Normal), dot(rotation.zyw, gl_Normal));
	normal.z = gl_Normal.z;
	
	N = normalize(gl_NormalMatrix * normal);
	
	position.xyz += treepos.xyz;
	position.w = 1.0;
	
	position = gl_ModelViewMatrix * position;
	vertexpos = position.xyz;
	
	gl_FogFragCoord = abs(position.z);
	
	gl_Position = gl_ProjectionMatrix * position;
	gl_TexCoord[0] = gl_MultiTexCoord0;
}
