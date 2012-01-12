#version 150
#extension GL_ARB_uniform_buffer_object : enable
#extension GL_EXT_gpu_shader4 : enable                             

uniform MatrixBlock
{
    mat4 b_MVMatrix;  
    mat4 b_NormalMatrix;
    mat4 b_ProjectionMatrix;
};

uniform InstanceBlock
{
    vec4 b_rotation[250];
    vec4 b_position[250];
};

in vec3 in_tangent;
in vec3 in_normal;
in vec3 in_pos;
in vec2 in_tex0;

out vec3 N;
out vec3 T;
out vec3 B;
out float fogdist;
out vec3 eyepos;
out vec2 tex0;
out float alphatest;

mat4 quaternionToMatrix(in vec4 q);

void main()
{
    vec4 rotation = b_rotation[gl_InstanceID];
    vec4 position = b_position[gl_InstanceID];

    mat4 world = quaternionToMatrix(rotation);

	world[3].xyz = position.xyz;

    mat4 modelview = b_MVMatrix * world;

    alphatest = position.w;
    
    vec4 pos = modelview * vec4(in_pos, 1.0);

    eyepos = pos.xyz;

	T = mat3(modelview) * in_tangent;
	N = mat3(modelview) * in_normal;
	B = cross(N, T);

	tex0 = in_tex0;

    fogdist = abs(eyepos.z);
	
 	gl_Position = b_ProjectionMatrix * pos;
}
