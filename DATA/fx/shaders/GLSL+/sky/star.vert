#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MatrixBlock
{
    mat4 MVMatrix;  
    mat4 NormalMatrix;
    mat4 ProjectionMatrix;
};

in vec4 in_pos;
out float alpha;

void main()
{
    alpha = in_pos.w;
	gl_Position = ProjectionMatrix * MVMatrix * vec4(in_pos.xyz, 1.0);
}
