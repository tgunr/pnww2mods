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
in vec2 in_tex0;

out vec3 N;
out vec3 eyepos;
out float fogdist;
out vec2 tex0;
out float alphatest;

mat4 quaternionToMatrix(in vec4 q);
mat3 modelviewToNormal(in mat4 mv);

void main()
{
    int idx = gl_InstanceID * 2;

    vec4 rotation = texelFetchBuffer(data, idx);
    vec4 position = texelFetchBuffer(data, idx + 1);

    mat4 world = quaternionToMatrix(rotation);

	world[3].xyz = position.xyz;

    mat4 modelview = b_MVMatrix * world;

    alphatest = position.w;

    vec4 pos = modelview * vec4(in_pos, 1.0);

    eyepos = pos.xyz;

    mat3 normalmatrix = modelviewToNormal(modelview);

    N = normalmatrix * in_normal;
	
	tex0 = in_tex0;
	
    fogdist = abs(eyepos.z);

 	gl_Position = b_ProjectionMatrix * pos;
}
