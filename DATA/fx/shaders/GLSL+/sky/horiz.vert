#version 150

uniform MatrixBlock
{
    mat4 MVMatrix;
    mat4 ProjectionMatrix;
    mat4 NormalMatrix;
};

in vec3 in_pos;
in vec2 in_tex0;
in vec4 in_color;

out float fogdist;
out vec2 tex0;
out vec4 color;

void main()
{
	tex0 = in_tex0;
	vec4 pos = vec4(in_pos, 1.0);

	pos = MVMatrix * pos;

    fogdist = abs(pos.z);
    color = in_color / 255.0;

 	gl_Position = ProjectionMatrix * pos;
}
