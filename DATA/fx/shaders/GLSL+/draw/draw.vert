#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MatrixBlock
{
    mat4 MVMatrix;  
    mat4 NormalMatrix;
    mat4 ProjectionMatrix;
};

uniform InstanceParamsBlock
{
    vec4 mv[128]; // 32 mat4 matrices
    vec4 nm[128]; // 32 mat4 matrices
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

    mat4 modelview = mat4(mv[idx + 0],
                          mv[idx + 1],
                          mv[idx + 2],
                          mv[idx + 3]);

    mat3 normal = mat3(nm[idx + 0].xyz,
                       nm[idx + 1].xyz,
                       nm[idx + 2].xyz);
                      
    pos = modelview * pos;
    N = normal * in_normal;

	V = pos.xyz;
    vertexpos = pos.xyz;

    fogdist = abs(V.z);

 	gl_Position = ProjectionMatrix * pos;
}
