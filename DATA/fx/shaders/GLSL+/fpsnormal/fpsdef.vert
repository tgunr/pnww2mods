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
in vec4 in_weights;
in vec4 in_indices;

out vec3 N;
out float fogdist;
out vec3 eyepos;
out vec2 tex0;

const vec4 zero = vec4(0, 0, 0, 0);

void main()
{
    mat4 bonemat;
    vec4 totalpos = zero;
    vec4 totalnrm = zero;

    int idx;

    vec4 p = vec4(in_pos, 1.0);
    vec4 n = vec4(in_normal, 0.0);

    for(int i = 0; i < 4; ++i)
    {
        idx = int(in_indices[i]) * 4;

        bonemat[0] = texelFetchBuffer(data, idx);
        bonemat[1] = texelFetchBuffer(data, idx + 1);
        bonemat[2] = texelFetchBuffer(data, idx + 2);
        bonemat[3] = texelFetchBuffer(data, idx + 3);

        totalpos += bonemat * p * in_weights[i];
        totalnrm += bonemat * n * in_weights[i];
    }

    totalnrm.xyz = normalize(totalnrm.xyz);
    N = mat3(b_NormalMatrix) * totalnrm.xyz;
			
	tex0 = in_tex0;

	vec4 pos = b_MVMatrix * totalpos;
    
	fogdist = abs((b_MVMatrix * vec4(in_pos, 1.0)).z);

    eyepos = pos.xyz;

 	gl_Position = b_ProjectionMatrix * pos;
}
