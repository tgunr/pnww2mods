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

out vec3 N;
out float fogdist;
out vec3 eyepos;

mat4 quaternionToMatrix(in vec4 q);
mat3 modelviewToNormal(in mat4 mv);

void main()
{
    mat4 modelview = quaternionToMatrix(rotation[gl_InstanceID]);

	modelview[3][0] = position[gl_InstanceID].x;
	modelview[3][1] = position[gl_InstanceID].y;
	modelview[3][2] = position[gl_InstanceID].z;

    modelview = MVMatrix * modelview;

    vec4 pos = modelview * vec4(in_pos, 1.0);

    eyepos = pos.xyz;

    mat3 normalmatrix = modelviewToNormal(modelview);

    N = normalmatrix * in_normal;

    fogdist = abs(eyepos.z);

 	gl_Position = ProjectionMatrix * pos;
}
