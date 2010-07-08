#version 120

#extension GL_ARB_texture_rectangle: enable

uniform sampler2DRect src1;

void main()
{
	vec4 color = texture2DRect(src1, gl_TexCoord[0].xy);
	color = color * color * color * color * color * color;
	
	gl_FragColor.rgb = color.rgb;
	gl_FragColor.a = 1.0; 
}
