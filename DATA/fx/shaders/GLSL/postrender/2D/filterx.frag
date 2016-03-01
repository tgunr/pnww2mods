#version 120

uniform sampler2D src;

vec4 filter[7];

void main()
{
	vec2 texCoord = gl_TexCoord[0].xy;
	
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
		vec2 uv = vec2(texCoord.x + filter[i].x * scale, texCoord.y);	
		color += texture2D(src, uv) * filter[i].w;
	}
	
	color.a = 1.0;
	
	gl_FragColor = color;
}
