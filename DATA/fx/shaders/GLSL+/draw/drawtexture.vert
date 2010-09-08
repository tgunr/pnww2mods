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
	vec4 data[2048];
};

in vec3 in_pos;
in vec3 in_normal;
in vec2 in_tex0;

out vec3 V;
out vec3 N;
out float fogdist;
out vec3 vertexpos;
out vec2 tex0;
out float alphatest;

void main()
{
	tex0 = in_tex0;
	vec4 pos = vec4(in_pos, 1.0);

    int idx = gl_InstanceID * 8;

    alphatest = data[idx + 4].w;

    mat4 modelview = mat4(data[idx + 0],
                          data[idx + 1],
                          data[idx + 2],
                          data[idx + 3]);

    mat3 normal = mat3(data[idx + 4].xyz,
                       data[idx + 5].xyz,
                       data[idx + 6].xyz);
	
    pos = modelview * pos;
    N = normal * in_normal;

	V = pos.xyz;
    vertexpos = pos.xyz;

    fogdist = abs(V.z);

 	gl_Position = ProjectionMatrix * pos;
}
