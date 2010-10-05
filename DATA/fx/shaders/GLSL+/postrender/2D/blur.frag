#version 150

uniform sampler2D src1;
uniform vec2 offsets[16];

in vec2 tex0;
out vec4 out_color;

void main()
{
	vec4 c = vec4(0, 0, 0, 0);
	
	for(int i = 0; i < 16; i++)
	{
		c += texture2D(src1, tex0 + offsets[i]);
	}
	
	out_color = c * 0.0625; //1/16
}
