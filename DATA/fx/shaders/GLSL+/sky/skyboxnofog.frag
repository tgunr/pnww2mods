#version 150

uniform sampler2DArray src1;

in vec3 tex0;

out vec4 out_color;

void main()
{
	out_color = texture(src1, tex0);
}
