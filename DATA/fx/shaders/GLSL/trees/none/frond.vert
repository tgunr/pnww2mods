#version 120

uniform vec4 rotation;
uniform vec3 treepos;

varying vec3 N;
varying vec3 vertexpos;

void main()
{
	vec4 position = vec4(gl_Vertex.x, gl_Vertex.y, gl_Vertex.z, 1.0);
		
	vec3 normal;
			
    vec4 rot = vec4(rotation.xyz, 0.0f);

	position.xy = vec2(dot(rot.yxw, position.xyz), dot(rot.zyw, position.xyz));
	normal.xy = vec2(dot(rot.yxw, gl_Normal), dot(rot.zyw, gl_Normal));
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
