#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MatrixBlock
{
    mat4 b_MVMatrix;  
    mat4 b_NormalMatrix;
    mat4 b_ProjectionMatrix;
};

in vec3 in_pos;
in vec3 in_normal;
in vec2 in_tex0;

out vec3 N;
out float fogdist;
out vec3 eyepos;
out vec2 tex0;

void main()
{
	tex0 = in_tex0;

	vec4 pos = b_MVMatrix * vec4(in_pos, 1.0);
    eyepos = pos.xyz;

    N = mat3(b_NormalMatrix) * in_normal;

    fogdist = abs(pos.z);

 	gl_Position = b_ProjectionMatrix * pos;
}
