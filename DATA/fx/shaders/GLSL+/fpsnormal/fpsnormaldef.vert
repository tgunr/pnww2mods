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
in vec4 in_weights;
in vec4 in_indices;

out vec3 T;
out vec3 B;
out vec3 N;
out vec2 tex0;

out float fogdist;
out vec3 eyepos;

float fogValue(float);

const vec4 zero = vec4(0, 0, 0, 0);

void main()
{
    mat4 bonemat;
    vec4 totalpos = zero;
    vec4 totalnrm = zero;
    vec4 totaltgt = zero;

    int idx;

    for(int i = 0; i < 4; ++i)
    {
        idx = int(in_indices[i]) * 4;

        bonemat[0] = texelFetchBuffer(data, idx);
        bonemat[1] = texelFetchBuffer(data, idx + 1);
        bonemat[2] = texelFetchBuffer(data, idx + 2);
        bonemat[3] = texelFetchBuffer(data, idx + 3);

        totalpos += bonemat * vec4(in_pos, 1.0) * in_weights[i];
        totalnrm += bonemat * vec4(in_normal, 0.0) * in_weights[i];
        totaltgt += bonemat * vec4(in_tex1, 0.0) * in_weights[i];
    }

    totalnrm.xyz = normalize(totalnrm.xyz);
    totaltgt.xyz = normalize(totaltgt.xyz);

	N = normalize(mat3(b_NormalMatrix) * totalnrm.xyz);	
	T = normalize(mat3(b_NormalMatrix) * totaltgt.xyz);
	B = normalize(cross(N, T));
				
	tex0 = in_tex0;
	
	vec4 pos = b_MVMatrix * totalpos;
		
	fogdist = abs(pos.z);
    eyepos = pos.xyz;

 	gl_Position = b_ProjectionMatrix * pos;
}
