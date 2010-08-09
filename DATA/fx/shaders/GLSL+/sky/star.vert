#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MatrixBlock
{
    mat4 MVMatrix;
    mat4 ProjectionMatrix;
    mat4 NormalMatrix;
};

in vec3 in_pos;

void main()
{
	gl_Position = ProjectionMatrix * MVMatrix * vec4(in_pos, 1.0);
}
