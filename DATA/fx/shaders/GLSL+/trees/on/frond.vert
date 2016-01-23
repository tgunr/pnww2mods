#version 150
#extension GL_ARB_uniform_buffer_object : enable
#extension GL_EXT_gpu_shader4 : enable                             

uniform MatrixBlock
{
    mat4 b_MVMatrix;  
    mat4 b_NormalMatrix;
    mat4 b_ProjectionMatrix;
};

uniform TreeInstanceBlock
{
    vec4 b_rotation[250];
    vec4 b_position[250];
};

in vec3 in_pos;
in vec3 in_normal;
in vec2 in_tex0;

out vec3 N;
out vec3 eyepos;
out vec2 tex0;
out float fogdist;
out float alphatest;

void main()
{
    vec4 rot = b_rotation[gl_InstanceID];
    vec4 pos = b_position[gl_InstanceID];

    rot.w = 0.0;
    vec4 inpos = vec4(in_pos, 1.0);
      
    alphatest = pos.w;
    pos.w = 1.0;

    vec3 normal;
          
    inpos.xy = vec2(dot(rot.yxw, inpos.xyz), dot(rot.zyw, inpos.xyz));
    normal.xy = vec2(dot(rot.yxw, in_normal), dot(rot.zyw, in_normal));
    normal.z = in_normal.z;

    N = normalize(mat3(b_NormalMatrix) * normal);

    inpos.xyz += pos.xyz;
    inpos.w = 1.0;

    inpos = b_MVMatrix * inpos;
    fogdist = abs(inpos.z);

    tex0 = in_tex0;  
    eyepos = inpos.xyz;

    gl_Position = b_ProjectionMatrix * inpos;
}
