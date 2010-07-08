#version 120

uniform sampler2D billboardMap;

vec4 fogThis(in vec4);
void lightSetVertexPos(in vec3);
void lightGetAmbientDiffuse(in vec3, out vec4, out vec4);

varying vec3 N;
varying vec3 vpos;

void main()
{
	vec4 base = texture2D(billboardMap, gl_TexCoord[0].xy);
	
	vec3 n = normalize(N);
	
	vec4 dif;
	vec4 amb;
	
	lightSetVertexPos(vpos);
	lightGetAmbientDiffuse(n, amb, dif);
	lightSetVertexPos(vec3(0, 0, 0));
	
	amb *= gl_TexCoord[0].w;
	
	vec4 color = base * (amb + dif);
	
	gl_FragColor = fogThis(color);
	gl_FragColor.a = base.a * gl_TexCoord[0].z;
}
