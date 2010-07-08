#version 120

uniform sampler2DRect src;

vec4 filter[7];

void main()
{
	vec2 texCoord = gl_TexCoord[0].xy;
	
	float scale = 1.0 / 4096.0;
	
	filter[0] = vec4(-3.0, 0, 0,  1.0 / 64.0);
	filter[1] = vec4(-2.0, 0, 0,  6.0 / 64.0);
	filter[2] = vec4(-1.0, 0, 0, 15.0 / 64.0);
	filter[3] = vec4( 0.0, 0, 0, 20.0 / 64.0);
	filter[4] = vec4( 1.0, 0, 0, 15.0 / 64.0);
	filter[5] = vec4( 2.0, 0, 0,  6.0 / 64.0);
	filter[6] = vec4( 3.0, 0, 0,  1.0 / 64.0);
	
	vec4 color = vec4(0, 0, 0, 0);
	
	for(int i = 0; i < 7; i++)
	{
		vec2 uv = vec2(texCoord.x + filter[i].x * scale, texCoord.y);
		color += texture2DRect(src, uv) * filter[i].w;
	}
	
	color.a = 1.0;
	
	gl_FragColor = color;
}
