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
	vec4 data[1024];
};

in vec3 tangent;
in vec3 in_normal;
in vec3 in_pos;
in vec2 in_tex0;

out vec3 N;
out vec3 T;
out vec3 B;
out vec3 V;
out float fogdist;
out vec3 vertexpos;
out vec2 tex0;
out float alphatest;

void main()
{
    int idx = gl_InstanceID * 8;

    alphatest = data[idx + 0].w;

    mat4 modelview = mat4(data[idx + 0],
                          data[idx + 1],
                          data[idx + 2],
                          data[idx + 3]);

    mat3 normal = mat3(data[idx + 0].xyz,
                       data[idx + 1].xyz,
                       data[idx + 2].xyz);
    
	vec4 pos = vec4(in_pos, 1.0);

    pos = modelview * pos;

	V = pos.xyz;
    vertexpos = pos.xyz;

    N = normal * in_normal;

	T = normalize(normal * tangent);
	N = normalize(normal * in_normal);
	B = cross(N, T);

	tex0 = in_tex0;

    fogdist = abs(V.z);
	
 	gl_Position = ProjectionMatrix * pos;
}
