#version 150

uniform sampler2D diffuse;

in vec2 tex0;
out vec4 out_color;

void main()
{
	out_color = texture2D(diffuse, tex0);
}
