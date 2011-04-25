#version 120

uniform vec4 rotation;
uniform vec3 treepos;

void main()
{
	vec4 position = vec4(gl_Vertex.x, gl_Vertex.y, gl_Vertex.z, 1.0);
		
	position.xy = vec2(dot(rotation.yxw, position.xyz), dot(rotation.zyw, position.xyz));
	
	position.xyz += treepos.xyz;
	position.w = 1.0;
	
	gl_Position = gl_ProjectionMatrix * (gl_ModelViewMatrix * position);
	gl_TexCoord[0] = gl_MultiTexCoord0;
}
