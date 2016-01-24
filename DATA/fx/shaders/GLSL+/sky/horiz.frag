#version 150

uniform sampler2D src1;

in vec4 color;
in vec2 tex0;

out vec4 out_color;

vec4 fogThis(in vec4);

void main()
{
	vec4 base = texture2D(src1, tex0);
	
	vec4 c =  base * color;
	
	out_color = fogThis(c);
}
