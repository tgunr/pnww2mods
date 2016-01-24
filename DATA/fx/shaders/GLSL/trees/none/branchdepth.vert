#version 120

uniform vec4 rotation;
uniform vec3 treepos;

void main()
{
	vec4 position = vec4(gl_Vertex.x, gl_Vertex.y, gl_Vertex.z, 1.0);

    vec4 rot = vec4(rotation.xyz, 0.0f);

	position.xy = vec2(dot(rot.yxw, position.xyz), dot(rot.zyw, position.xyz));
	
	position.xyz += treepos.xyz;
	position.w = 1.0;

	gl_Position = gl_ProjectionMatrix * (gl_ModelViewMatrix * position);
}
