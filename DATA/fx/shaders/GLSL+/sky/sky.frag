#version 150

in vec4 color;

out vec4 out_color;

vec4 fogThis(in vec4);

void main()
{
	out_color = fogThis(color);
}
