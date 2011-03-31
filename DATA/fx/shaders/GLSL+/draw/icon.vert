#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MatrixBlock
{
    mat4 b_MVMatrix;  
    mat4 b_NormalMatrix;
    mat4 b_ProjectionMatrix;
};

in vec3 in_pos;
in vec4 in_color;
in vec2 in_tex0;

out vec4 color;
out vec2 tex0;

void main()
{
	vec4 pos = b_MVMatrix * vec4(in_pos, 1.0);

    color = in_color / 255.0;
    tex0 = in_tex0;

 	gl_Position = b_ProjectionMatrix * pos;
}
