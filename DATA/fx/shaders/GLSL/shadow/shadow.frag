#version 120

uniform sampler2DShadow src1;
uniform sampler2DShadow src2;

uniform vec3 ambient;

void main()
{
	vec3 c1 = gl_TexCoord[0].xyz / gl_TexCoord[0].w;
	vec3 c2 = gl_TexCoord[1].xyz / gl_TexCoord[1].w;

	float scale = 0.0009765625;//1.0 / 1024.0;
	
	vec4 s1 = shadow2D(src1, c1);
	vec4 s2 = shadow2D(src2, c2);

	s1 += shadow2D(src1, c1.xyz + vec3(scale, 0, 0));
	s1 += shadow2D(src1, c1.xyz + vec3(0, scale, 0));
	s1 += shadow2D(src1, c1.xyz + vec3(scale, scale, 0));
	s1 *= 0.25;

	s2 += shadow2D(src2, c2.xyz + vec3(scale, 0, 0));
	s2 += shadow2D(src2, c2.xyz + vec3(0, scale, 0));
	s2 += shadow2D(src2, c2.xyz + vec3(scale, scale, 0));
	s2 *= 0.25;

	s1 *= s2;
	
	vec4 color = gl_Color;

	color *= s1;
	color.rgb += ambient;
	
	gl_FragColor = color;
}
