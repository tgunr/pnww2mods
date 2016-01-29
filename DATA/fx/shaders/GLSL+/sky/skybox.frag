#version 150

uniform sampler2DArray src1;

in vec3 tex0;

out vec4 out_color;

vec4 fogThis(in vec4);

void main()
{
    vec4 base = texture(src1, tex0);

	out_color = fogThis(base);
}
