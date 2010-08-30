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

out vec4 color;

void main()
{
    color = in_color / 255.0;
 	gl_Position = ProjectionMatrix * MVMatrix * vec4(in_pos, 1.0);
}
