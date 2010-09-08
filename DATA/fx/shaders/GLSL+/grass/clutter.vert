#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MatrixBlock
{
    mat4 MVMatrix;  
    mat4 NormalMatrix;
    mat4 ProjectionMatrix;
};

uniform vec2 trans;

in vec3 in_pos;
in vec2 in_tex0;

out float fogdist;
out vec3 vertexpos;
out vec2 tex0;

void main()
{
    vec4 pos = vec4(in_pos, 1.0);
    pos.xy += trans;

    pos = MVMatrix * pos;

    vertexpos = pos.xyz;
    tex0 = in_tex0;

    fogdist = abs(vertexpos.z);

	gl_Position = ProjectionMatrix * pos;
}
