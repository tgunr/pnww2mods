#version 150

uniform mat4 MVMatrix;
uniform mat4 ProjectionMatrix;
uniform mat4 TextureMatrix[4];
uniform mat3 NormalMatrix;

in vec3 in_pos;
in vec3 in_normal;
in vec2 in_tex0;
in vec2 in_tex1;
in vec2 in_tex2;

out vec3 V;
out vec3 N;
out float fogdist;
out vec3 vertexpos;
out vec2 tex0;
out vec2 tex1;
out vec2 tex2;

void main()
{
	tex0 = (TextureMatrix[0] * vec4(in_tex0, 1.0, 1.0)).xy;
	tex1 = (TextureMatrix[1] * vec4(in_tex1, 1.0, 1.0)).xy;
	tex2 = (TextureMatrix[2] * vec4(in_tex2, 1.0, 1.0)).xy;

	vec4 pos = MVMatrix * vec4(in_pos, 1.0);
	V = pos.xyz;
    vertexpos = pos.xyz;

    N = NormalMatrix * in_normal;

    fogdist = abs(V.z);
	
 	gl_Position = ProjectionMatrix * pos;
}
