#version 150
#extension GL_ARB_texture_rectangle: enable

uniform sampler2DRect src;

vec4 filter[7];

in vec2 tex0;
out vec4 out_color;

void main()
{
	float scale = 1.0 / 389.119995;
  	
    float w1 = 0.16131 * 0.58;
    float w2 = 0.21297 * 0.58;
    float w3 = 0.25159 * 0.58;

	filter[0] = vec4(-3.0, 0, 0, w1);
	filter[1] = vec4(-2.0, 0, 0, w2);
	filter[2] = vec4(-1.0, 0, 0, w3);
	filter[3] = vec4( 0.0, 0, 0, 0.26596 * 0.58);
	filter[4] = vec4( 1.0, 0, 0, w3);
	filter[5] = vec4( 2.0, 0, 0, w2);
	filter[6] = vec4( 3.0, 0, 0, w1);
	
	vec4 color = vec4(0, 0, 0, 0);
	
	for(int i = 0; i < 7; i++)
	{
		vec2 uv = vec2(tex0.x + filter[i].x * scale, tex0.y);	
		color += texture2DRect(src, uv) * filter[i].w;
	}
	
	color.a = 1.0;
	
	out_color = color;
}
