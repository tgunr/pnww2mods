#version 120

#extension GL_ARB_texture_rectangle: enable

uniform sampler2DRect src1;

void main()
{
	gl_FragColor = texture2DRect(src1, gl_TexCoord[0].xy);
}
