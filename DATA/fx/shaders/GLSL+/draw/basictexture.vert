#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MatrixBlock
{
    mat4 MVMatrix;  
    mat4 NormalMatrix;
    mat4 ProjectionMatrix;
};

in vec3 in_pos;
in vec4 in_color;
in vec2 in_tex0;

out vec4 color;
out vec2 tex0;

void main()
{
    color = in_color / 255.0;
    tex0 = in_tex0;

 	gl_Position = ProjectionMatrix * MVMatrix * vec4(in_pos, 1.0);
}
