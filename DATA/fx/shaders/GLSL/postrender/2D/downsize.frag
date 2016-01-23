#version 120

uniform sampler2D src1;

void main()
{
	gl_FragColor = texture2D(src1, gl_TexCoord[0].xy);
}
