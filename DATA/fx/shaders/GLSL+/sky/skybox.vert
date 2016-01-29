#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MatrixBlock
{
    mat4 b_MVMatrix;  
    mat4 b_NormalMatrix;
    mat4 b_ProjectionMatrix;
};

uniform vec3 campos;

const vec2 uv[4] = vec2[4](vec2(0, 1), vec2(1, 1), vec2(1, 0), vec2(0, 0));

in vec4 in_pos;
in float in_tex0;

out float fogdist;
out vec3 tex0;

const float size = 800.0f;

void main()
{
    vec4 pos = in_pos * size;
    pos.w = 1.0f;
    pos.xyz += campos;

	pos = b_MVMatrix * pos;
    tex0.xy = uv[int(in_pos.w)];
    tex0.z = in_tex0;

    fogdist = abs(pos.z);

 	gl_Position = b_ProjectionMatrix * pos;
}
