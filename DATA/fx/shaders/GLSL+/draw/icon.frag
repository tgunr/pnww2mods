#version 150

uniform sampler2D src1;

in vec4 color;
in vec2 tex0;

out vec4 out_color;

void main()
{
    vec4 c = color;
    c.a = texture2D(src1, tex0).a;

	out_color = c;
}
