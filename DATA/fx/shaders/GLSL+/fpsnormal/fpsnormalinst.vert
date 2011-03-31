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
in vec3 in_tex1;

out vec3 T;
out vec3 B;
out vec3 N;
out vec2 tex0;

out float fogdist;
out vec3 eyepos;

float fogValue(float);

mat3 modelviewToNormal(mat4);

void main()
{
    int idx = gl_InstanceID * 4;

    mat4 modelview;

    modelview[0] = texelFetchBuffer(data, idx);
    modelview[1] = texelFetchBuffer(data, idx+1);
    modelview[2] = texelFetchBuffer(data, idx+2);
    modelview[3] = texelFetchBuffer(data, idx+3);

    modelview = b_MVMatrix * modelview;
    mat3 normalmatrix = modelviewToNormal(modelview);

	N = normalize(normalmatrix * in_normal);	
	T = normalize(normalmatrix * in_tex1);
	B = normalize(cross(N, T));
				
	tex0 = in_tex0;
	
	vec4 pos = (modelview * vec4(in_pos, 1.0));
		
	fogdist = abs(pos.z);
    eyepos = pos.xyz;

 	gl_Position = b_ProjectionMatrix * pos;
}
