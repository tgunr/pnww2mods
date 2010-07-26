#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MatrixBlock
{
    mat4 MVMatrix;
    mat4 ProjectionMatrix;
    mat4 NormalMatrix;
};

uniform mat4 TextureMatrix[4];

in vec3 in_pos;
in vec3 in_normal;
in vec2 in_tex0;
in vec2 in_tex1;
in vec2 in_tex2;

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
    vertexpos = pos.xyz;

    N = mat3(NormalMatrix) * in_normal;

    fogdist = abs(vertexpos.z);
	
 	gl_Position = ProjectionMatrix * pos;
}
