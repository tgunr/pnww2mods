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

void main()
{
    int idx = gl_InstanceID * 2;

    vec4 rot = texelFetchBuffer(data, idx + 0);
    vec4 pos = texelFetchBuffer(data, idx + 1);

    rot.w = 0.0f;
	vec4 position = vec4(in_pos, 1.0);

	position.xy = vec2(dot(rot.yxw, position.xyz), dot(rot.zyw, position.xyz));
	
	position.xyz += pos.xyz;
	position.w = 1.0;

	gl_Position = b_ProjectionMatrix * (b_MVMatrix * position);
}
