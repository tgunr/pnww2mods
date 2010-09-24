#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform InstanceParamsBlock
{
	vec4 data[1024];
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
out vec3 vertexpos;
out vec2 tex0;
out float fogdist;
out float alphatest;

void main()
{
    int idx = gl_InstanceID * 2;

    vec4 position = vec4(in_pos, 1.0);
      
    vec4 rot = data[idx + 1];
    vec3 pos = data[idx + 0].xyz;
    alphatest = data[idx + 0].w;

    vec3 normal;
          
    position.xy = vec2(dot(rot.yxw, position.xyz), dot(rot.zyw, position.xyz));
    normal.xy = vec2(dot(rot.yxw, in_normal), dot(rot.zyw, in_normal));
    normal.z = in_normal.z;

    N = normalize(mat3(NormalMatrix) * normal);

    position.xyz += pos;
    position.w = 1.0;

    position = MVMatrix * position;
    fogdist = abs(position.z);

    tex0 = in_tex0;  
    vertexpos = position.xyz;

    gl_Position = ProjectionMatrix * position;
}
