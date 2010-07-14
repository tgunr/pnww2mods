#version 150

uniform mat4 MVMatrix;
uniform mat4 ProjectionMatrix;
uniform mat3 NormalMatrix;

in vec3 tangent;
in vec3 in_normal;
in vec3 in_pos;
in vec2 in_tex0;

out vec3 N;
out vec3 T;
out vec3 B;
out vec3 V;
out float fogdist;
out vec3 vertexpos;
out vec2 tex0;

void main()
{
	T = normalize(NormalMatrix * tangent);
	N = normalize(NormalMatrix * in_normal);
	B = cross(N, T);

	tex0 = in_tex0;
	vec4 pos = vec4(in_pos, 1.0);

	pos = MVMatrix * pos;
	V = pos.xyz;
    vertexpos = pos.xyz;

    fogdist = abs(V.z);
	
 	gl_Position = ProjectionMatrix * pos;
}
