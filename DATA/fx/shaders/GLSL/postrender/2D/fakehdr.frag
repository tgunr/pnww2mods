#version 120

uniform sampler2D src1;

void main()
{
	vec4 color = texture2D(src1, gl_TexCoord[0].xy);
	color = color * color * color * color * color * color;
	
	gl_FragColor.rgb = color.rgb;
	gl_FragColor.a = 1.0; 
}
