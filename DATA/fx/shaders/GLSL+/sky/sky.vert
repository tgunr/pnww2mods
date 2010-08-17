#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MatrixBlock
{
    mat4 MVMatrix;
    mat4 NormalMatrix;
};

uniform ProjectionMatrixBlock
{
    mat4 ProjectionMatrix;
};

in vec3 in_pos;
in vec4 in_color;

out float fogdist;
out vec4 color;

void main()
{
	vec4 pos = vec4(in_pos, 1.0);

	pos = MVMatrix * pos;

    fogdist = abs(pos.z);
    color = in_color / 255.0;

 	gl_Position = ProjectionMatrix * pos;
}
