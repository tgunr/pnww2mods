#version 150

uniform mat4 MVMatrix;
uniform mat4 ProjectionMatrix;
uniform mat3 NormalMatrix;

in vec3 in_pos;
in vec3 in_normal;
in vec2 in_tex0;

out vec3 N;
out vec3 V;
out vec3 vertexpos;
out float fogdist;
out vec2 tex0;

void main()
{
	N = normalize(NormalMatrix * in_normal);
	
	tex0 = in_tex0;
	
	vec4 pos = MVMatrix * vec4(in_pos, 1.0);
	vertexpos = pos.xyz;
    V = pos.xyz;

    fogdist = abs(V.z);

 	gl_Position = ProjectionMatrix * pos;
}
