#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform InstanceBlock
{
    vec4 rotation[1000];
	vec4 position[1000];
};

uniform MatrixBlock
{
    mat4 MVMatrix;  
    mat4 NormalMatrix;
    mat4 ProjectionMatrix;
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
    vec4 inpos = vec4(in_pos, 1.0);
      
    vec4 rot = rotation[gl_InstanceID];
    vec3 pos = position[gl_InstanceID].xyz;
    alphatest = position[gl_InstanceID].w;

    vec3 normal;
          
    inpos.xy = vec2(dot(rot.yxw, inpos.xyz), dot(rot.zyw, inpos.xyz));
    normal.xy = vec2(dot(rot.yxw, in_normal), dot(rot.zyw, in_normal));
    normal.z = in_normal.z;

    N = normalize(mat3(NormalMatrix) * normal);

    inpos.xyz += pos;
    inpos.w = 1.0;

    inpos = MVMatrix * inpos;
    fogdist = abs(inpos.z);

    tex0 = in_tex0;  
    eyepos = inpos.xyz;

    gl_Position = ProjectionMatrix * inpos;
}
