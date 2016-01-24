#version 150

uniform sampler2D src;

in vec2 tex0;
in vec4 color;
out vec4 out_color;

void main()
{
	out_color = texture2D(src, tex0) * color;
}
