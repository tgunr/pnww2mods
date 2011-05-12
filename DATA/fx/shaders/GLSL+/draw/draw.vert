#version 150
#extension GL_ARB_uniform_buffer_object : enable
#extension GL_EXT_gpu_shader4 : enable                             

uniform MatrixBlock
{
    mat4 b_MVMatrix;  
    mat4 b_NormalMatrix;
    mat4 b_ProjectionMatrix;
};

uniform samplerBuffer data;

in vec3 in_pos;
in vec3 in_normal;

out vec3 N;
out float fogdist;
out vec3 eyepos;

mat4 quaternionToMatrix(in vec4 q);

void main()
{
    int idx = gl_InstanceID * 2;

    vec4 rotation = texelFetchBuffer(data, idx);
    vec4 position = texelFetchBuffer(data, idx + 1);

    mat4 world = quaternionToMatrix(rotation);

	world[3].xyz = position.xyz;

    mat4 modelview = b_MVMatrix * world;

    vec4 pos = modelview * vec4(in_pos, 1.0);

    eyepos = pos.xyz;

    N = mat3(modelview) * in_normal;

    fogdist = abs(eyepos.z);

 	gl_Position = b_ProjectionMatrix * pos;
}
