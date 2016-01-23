#version 150
#extension GL_ARB_texture_rectangle: enable

uniform sampler2DRect src1;

in vec2 tex0;
out vec4 out_color;

void main()
{
	out_color = texture2DRect(src1, tex0);
}
