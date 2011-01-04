#version 150
#extension GL_ARB_uniform_buffer_object : enable
#extension GL_EXT_gpu_shader4 : enable                             

uniform MatrixBlock
{
    mat4 MVMatrix;  
    mat4 NormalMatrix;
    mat4 ProjectionMatrix;
};

uniform samplerBuffer data;

uniform vec2 uv[64];

uniform vec3 origin;
uniform float time;

in vec4 in_pos;

out float fogdist;
out float alphatest;
out vec3 eyepos;
out vec2 tex0;

void main()
{   
    int idx = gl_InstanceID * 2;

    vec4 posdata;
    vec4 params;

    posdata = texelFetchBuffer(data, idx);
    params = texelFetchBuffer(data, idx + 1);

    vec4 p1;

    p1.xyz = posdata.xyz - origin;
    p1.xyz += in_pos.xyz * params.xxx;
    p1.w = 1.0;

    float t = (time - params.z) * 0.001f * posdata.w;
    
    if(t > 1.0)
        t = 1.0f;

    alphatest = 1.0f - t * 0.670588235;

    int c = int(in_pos.w);

    vec4 pos = MVMatrix * p1;
   
    eyepos = pos.xyz;
    int type = int(params.w) * 4;

    tex0 = uv[c + type];

    fogdist = abs(eyepos.z);

	gl_Position = ProjectionMatrix * pos;
}
