#version 150
#extension GL_ARB_texture_rectangle: enable

uniform sampler2DRect src1;
uniform sampler2DRect src2;
uniform sampler2DRect src3;

uniform vec4 color;
uniform float lum;

in vec2 tex0;
in vec2 tex1;
in vec2 tex2;

out vec4 out_color;

void main()
{	
	vec4 s1 = texture2DRect(src1, tex0);
	vec4 s2 = texture2DRect(src2, tex1);
	vec4 s3 = texture2DRect(src3, tex2);

	vec4 c = mix(s1, s3, 0.25);

	c += s2;
	c += lum;
	
	c = mix(c, color, min(color.a, 0.75));
	c.a = 1.0;

	out_color = c;
}
