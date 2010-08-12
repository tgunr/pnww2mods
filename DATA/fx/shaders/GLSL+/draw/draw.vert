#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MatrixBlock
{
    mat4 MVMatrix;
    mat4 ProjectionMatrix;
    mat4 NormalMatrix;
};

uniform InstanceParamsBlock
{
    vec4 mat[128]; // 32 mat4 matrices
};

in vec3 in_pos;
in vec3 in_normal;
in vec2 in_tex0;

out vec3 V;
out vec3 N;
out float fogdist;
out vec3 vertexpos;
out vec2 tex0;

void main()
{
	tex0 = in_tex0;
	vec4 pos = vec4(in_pos, 1.0);

    int idx = gl_InstanceID * 4;

    mat4 world = mat4(mat[idx + 0],
                      mat[idx + 1],
                      mat[idx + 2],
                      mat[idx + 3]);
                      
    pos = world * pos;

	pos = MVMatrix * pos;
	V = pos.xyz;
    vertexpos = pos.xyz;

    N = mat3(NormalMatrix) * in_normal;

    fogdist = abs(V.z);

 	gl_Position = ProjectionMatrix * pos;
}
