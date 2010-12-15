#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MatrixBlock
{
    mat4 MVMatrix;  
    mat4 NormalMatrix;
    mat4 ProjectionMatrix;
};

uniform InstanceBlock
{
    vec4 rotation[1000];
	vec4 position[1000];
};

in vec3 in_pos;
in vec3 in_normal;
in vec2 in_tex0;

out vec3 N;
out float fogdist;
out vec3 eyepos;
out vec2 tex0;
out float alphatest;

mat4 quaternionToMatrix(in vec4 q);
mat3 modelviewToNormal(in mat4 mv);

void main()
{
    mat4 world = quaternionToMatrix(rotation[gl_InstanceID]);

	world[3].xyz = position[gl_InstanceID].xyz;

    mat4 modelview = MVMatrix * world;

    alphatest = position[gl_InstanceID].w;

    vec4 pos = modelview * vec4(in_pos, 1.0);

    eyepos = pos.xyz;

    mat3 normalmatrix = modelviewToNormal(modelview);

    N = normalmatrix * in_normal;
	
	tex0 = in_tex0;
	
    fogdist = abs(eyepos.z);

 	gl_Position = ProjectionMatrix * pos;
}
