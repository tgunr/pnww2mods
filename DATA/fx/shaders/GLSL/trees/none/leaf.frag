#version 120

uniform sampler2D diffuse;
uniform float diffuseScale;

varying vec3 N;
varying vec3 vpos;

vec4 fogThis(in vec4);
void lightSetVertexPos(in vec3);
void lightGetAmbientDiffuse(in vec3, out vec4, out vec4);

void main()
{
	vec4 base = texture2D(diffuse, gl_TexCoord[0].xy);
	
	vec3 n = normalize(N);
	
	vec4 ambientColor, diffuseColor;
	
	lightSetVertexPos(vpos);
	lightGetAmbientDiffuse(n, ambientColor, diffuseColor);
	lightSetVertexPos(vec3(0, 0, 0));
	
	ambientColor += gl_LightModel.ambient;
	ambientColor *= gl_FrontMaterial.ambient;
	diffuseColor *= (gl_FrontMaterial.diffuse * gl_TexCoord[1].x);
    diffuseColor *= diffuseScale;

	vec4 color = base * (diffuseColor + ambientColor);
	
	gl_FragColor = fogThis(color);
	gl_FragColor.a = base.a;
}
