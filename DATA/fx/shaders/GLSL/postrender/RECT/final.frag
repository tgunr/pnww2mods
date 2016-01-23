#version 120

#extension GL_ARB_texture_rectangle: enable

uniform sampler2DRect src1;
uniform sampler2DRect src2;
uniform sampler2DRect src3;

uniform vec4 color;
uniform float lum;

void main()
{	
	vec4 s1 = texture2DRect(src1, gl_TexCoord[0].xy);
	vec4 s2 = texture2DRect(src2, gl_TexCoord[1].xy);
	vec4 s3 = texture2DRect(src3, gl_TexCoord[2].xy);
	
	vec4 c = mix(s1, s3, 0.25);
	
	c += s2;

	c += lum;
	
	c = mix(c, color, min(color.a, 0.75));
	c.a = 1.0;

	gl_FragColor = c;
}
