#version 150

uniform sampler2D src;
uniform vec2 offsets[16];

in vec2 tex0;
out vec4 out_color;

void main()
{
	vec4 c = vec4(0, 0, 0, 0);
	vec2 uv;

	for(int i = 0; i < 16; i++)
	{
        uv = vec2(tex0.x, tex0.y + offsets[i].y);
		c += texture2D(src, uv);
	}
	
	out_color = c * 0.0625; //1/16
}
