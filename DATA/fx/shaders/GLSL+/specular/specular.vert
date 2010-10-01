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
out vec3 V;
out vec3 vertexpos;
out float fogdist;
out vec2 tex0;
out float alphatest;

mat4 quaternionToMatrix(in vec4 q);
mat3 modelviewToNormal(in mat4 mv);

void main()
{
    mat4 modelview = quaternionToMatrix(rotation[gl_InstanceID]);

	modelview[3][0] = position[gl_InstanceID].x;
	modelview[3][1] = position[gl_InstanceID].y;
	modelview[3][2] = position[gl_InstanceID].z;

    modelview = MVMatrix * modelview;

    alphatest = position[gl_InstanceID].w;

    vec4 pos = modelview * vec4(in_pos, 1.0);

	V = pos.xyz;
    vertexpos = pos.xyz;

    mat3 normalmatrix = modelviewToNormal(modelview);

    N = normalmatrix * in_normal;
	
	tex0 = in_tex0;
	
    fogdist = abs(V.z);

 	gl_Position = ProjectionMatrix * pos;
}
