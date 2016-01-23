#version 120

#extension GL_ARB_texture_rectangle: enable

uniform sampler2DRect src1;
uniform vec2 offsets[16];

void main()
{
	vec4 c = vec4(0, 0, 0, 0);
	
	for(int i = 0; i < 16; i++)
	{
		c += texture2DRect(src1, gl_TexCoord[0].xy + offsets[i]);
	}
	
	gl_FragColor = c * 0.0625; //1/16
}
