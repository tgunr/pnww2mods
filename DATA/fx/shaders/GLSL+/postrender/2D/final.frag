#version 150

uniform sampler2D src1;
uniform sampler2D src2;
uniform sampler2D src3;

uniform vec4 color;
uniform float lum;

in vec2 tex0;
out vec4 out_color;

void main()
{	
	vec4 s1 = texture2D(src1, tex0);
	vec4 s2 = texture2D(src2, tex0);
	vec4 s3 = texture2D(src3, tex0);

	vec4 c = mix(s1, s3, 0.25);

	c += s2;
	c += lum;
	
	c = mix(c, color, min(color.a, 0.75));
	c.a = 1.0;

	out_color = c;
}
