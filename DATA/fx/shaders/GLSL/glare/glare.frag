/*---------------------------------------------------
Glare frag
----------------------------------------------------*/
#version 120

uniform sampler2D src;

varying vec2 texcoord;

void main()
{
	vec4 suncolor = texture2D(src, texcoord);

	gl_FragColor.rgb = suncolor.rgb;
	gl_FragColor.a = suncolor.r;
}
