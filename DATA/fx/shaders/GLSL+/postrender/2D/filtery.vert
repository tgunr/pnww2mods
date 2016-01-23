#version 150

in vec3 in_pos;
in vec2 in_tex0;

out vec2 tex0;

void main()
{
	gl_Position = vec4(in_pos, 1.0);
	tex0 = in_tex0;
}
