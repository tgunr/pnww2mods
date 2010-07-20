#version 150

uniform mat4 MVMatrix;
uniform mat4 ProjectionMatrix;
uniform mat3 NormalMatrix;

in vec3 in_pos;
in vec3 in_normal;
in vec4 in_color;

out vec3 N;
out float fogdist;
out vec3 vertexpos;
out vec4 color;

void main()
{
	vec4 pos = vec4(in_pos, 1.0);

	pos = MVMatrix * pos;
    vertexpos = pos.xyz;

    N = NormalMatrix * in_normal;

    fogdist = abs(pos.z);
    color = in_color / 255.0;

 	gl_Position = ProjectionMatrix * pos;
}
