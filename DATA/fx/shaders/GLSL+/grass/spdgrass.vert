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

uniform vec2 uv[64];

uniform vec3 origin;

in vec4 in_pos;

out float fogdist;
out vec3 eyepos;
out vec2 tex0;

void main()
{   
    int idx = gl_InstanceID * 2;

    vec4 posdata = texelFetchBuffer(data, idx);
    vec4 params = texelFetchBuffer(data, idx + 1);

    vec4 p1;

    vec4 rot;

    rot.x = sin(params.y);
    rot.y = cos(params.y);
    rot.z = -rot.x;
    rot.w = 0.0f;

    p1.xy = vec2(dot(rot.yxw, in_pos.xyz), dot(rot.zyw, in_pos.xyz));
    p1.z = in_pos.z;

    p1.xyz = posdata.xyz - origin + p1.xyz * params.xxx;
    p1.w = 1.0;

    vec4 pos = b_MVMatrix * p1;
   
    eyepos = pos.xyz;

    tex0 = uv[int(in_pos.w + params.w)];
    fogdist = abs(eyepos.z);

    gl_Position = b_ProjectionMatrix * pos;
}
