#version 120

uniform sampler2D billboardMap;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3, out vec4, out vec4);

varying vec3 N;

void main()
{
	vec4 base = texture2D(billboardMap, gl_TexCoord[0].xy);
	
	vec3 n = normalize(N);
	
	vec4 dif;
	vec4 amb;
	
	lightGetAmbientDiffuse(n, amb, dif);
	
	amb *= gl_TexCoord[0].w;
	
	vec4 color = base * (amb + dif);
	
	gl_FragColor = fogThis(color);
	gl_FragColor.a = base.a * gl_TexCoord[0].z;
}
