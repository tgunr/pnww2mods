#version 120

uniform sampler2D billboardMap;
uniform sampler2D billboardNormal;
uniform float lightadjust;

varying vec3 T;
varying vec3 B;
varying vec3 N;
varying vec3 vertexpos;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3,
                            in vec3,
                            in vec3,
                            in vec3,
                            out vec4, 
                            out vec4);

void main()
{
	vec4 base = texture2D(billboardMap, gl_TexCoord[0].xy);
	vec4 normal = texture2D(billboardNormal, gl_TexCoord[2].xy) * 2.0 - 1.0;
	
	vec4 diffuse;
	vec4 ambient;

	vec3 t = normalize(T);
	vec3 b = normalize(B);
	vec3 n = normalize(N);

	lightGetAmbientDiffuse(t, b, n, normal.xyz, ambient, diffuse);

	float adjust = mix(gl_TexCoord[1].x, gl_TexCoord[1].y, lightadjust);
	diffuse *= adjust;
	
	ambient += gl_LightModel.ambient * gl_TexCoord[1].z;
	ambient *= gl_TexCoord[1].z;

	vec4 color = base * (diffuse + ambient);

	gl_FragColor = fogThis(color);
	gl_FragColor.a = base.a * gl_TexCoord[1].w;
}
