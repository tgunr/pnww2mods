#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MatrixBlock
{
    mat4 b_MVMatrix;  
    mat4 b_NormalMatrix;
    mat4 b_ProjectionMatrix;
};

in vec4 in_pos;
out float alpha;

void main()
{
    alpha = in_pos.w;
	gl_Position = b_ProjectionMatrix * b_MVMatrix * vec4(in_pos.xyz, 1.0);
}
