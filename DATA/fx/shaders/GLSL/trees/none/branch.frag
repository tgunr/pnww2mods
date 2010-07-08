#version 120

uniform sampler2D diffuse;
uniform sampler2D detailmap;

uniform float diffuseScale;

varying vec3 N;
varying vec3 vpos;

vec4 fogThis(in vec4);
void lightSetVertexPos(in vec3);
void lightGetAmbientDiffuse(in vec3, out vec4, out vec4);

void main()
{ 
	vec4 base = texture2D(diffuse, gl_TexCoord[0].xy);
	vec4 detail = texture2D(detailmap, gl_TexCoord[1].zw);
	
	// Interpolated values need to be normalized
	vec3 n = normalize(N);
	
	vec4 ambientColor;
	vec4 diffuseColor;
	
	lightSetVertexPos(vpos);
	lightGetAmbientDiffuse(n, ambientColor, diffuseColor);
	lightSetVertexPos(vec3(0, 0, 0));
	
	ambientColor += gl_LightModel.ambient;
	
	ambientColor *= gl_FrontMaterial.ambient;
	diffuseColor *= (diffuseScale * gl_FrontMaterial.diffuse);
	
	vec4 color = base * (diffuseColor + ambientColor);

	gl_FragColor = fogThis(color);
	gl_FragColor.a = 1.0;
}
