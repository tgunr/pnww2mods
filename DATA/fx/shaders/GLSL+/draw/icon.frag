#version 150

uniform sampler2D src1;

in vec4 color;
in vec2 tex0;

out vec4 out_color;

void main()
{
    vec4 base = texture2D(src1, tex0);

	out_color = color;
    out_color.a = base.a;
}
