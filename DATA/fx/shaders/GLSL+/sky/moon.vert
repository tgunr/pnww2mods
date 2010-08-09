#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MatrixBlock
{
    mat4 MVMatrix;
    mat4 ProjectionMatrix;
    mat4 NormalMatrix;
};

in vec3 in_pos;
in vec3 in_normal;
in vec2 in_tex0;

out vec3 N;
out vec3 vertexpos;
out vec2 tex0;

void main()
{
	tex0 = in_tex0;
	vec4 pos = vec4(in_pos, 1.0);

	pos = MVMatrix * pos;
    vertexpos = pos.xyz;
    
 	gl_Position = ProjectionMatrix * pos;
}
