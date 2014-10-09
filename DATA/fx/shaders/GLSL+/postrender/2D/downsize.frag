#version 150

uniform sampler2D src1;

in vec2 tex0;
out vec4 out_color;

void main()
{
	out_color = texture2D(src1, tex0);
}
