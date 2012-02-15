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
in vec4 in_tex1;

out vec3 N;
out vec3 eyepos;
out vec2 tex0;
out vec4 tex1;
out float fogdist;
out float alphatest;

void main() 
{   
    vec4 inpos = vec4(in_pos, 1.0);

    int idx = gl_InstanceID * 2;

    vec4 rot = texelFetchBuffer(data, idx + 0);
    vec4 pos = texelFetchBuffer(data, idx + 1);

    rot.w = 0.0f;

    alphatest = pos.w;
    pos.w = 1.0;

    /* Rotate Tree */
    inpos.xy = vec2(dot(rot.yxw, inpos.xyz), dot(rot.zyw, inpos.xyz));
   
    /* Rotate Normal */
    vec3 normal;
    normal.xy = vec2(dot(rot.yxw, in_normal), dot(rot.zyw, in_normal));
    normal.z = in_normal.z;

    N = normalize(mat3(b_NormalMatrix) * normal);

    /* Set tree to world position */
    inpos.xyz += pos.xyz;
    inpos.w = 1.0;

    inpos = b_MVMatrix * inpos;

    fogdist = abs(inpos.z);
      
    tex0 = in_tex0;
    tex1 = in_tex1;

    eyepos = inpos.xyz;

    gl_Position = b_ProjectionMatrix * inpos;
}
