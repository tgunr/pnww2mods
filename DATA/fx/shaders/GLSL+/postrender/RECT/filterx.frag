#version 150
#extension GL_ARB_texture_rectangle: enable

uniform sampler2DRect src;
uniform vec2 offsets[16];

in vec2 tex0;
out vec4 out_color;

void main()
{
	vec4 c = vec4(0, 0, 0, 0);
	vec2 uv;

	for(int i = 0; i < 16; i++)
	{
        uv = vec2(tex0.x + offsets[i].x, tex0.y);
		c += texture2DRect(src, uv);
	}
	
	out_color = c * 0.0625; //1/16
}
