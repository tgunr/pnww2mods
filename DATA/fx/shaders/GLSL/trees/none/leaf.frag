#version 120

uniform sampler2D diffuse;
uniform float diffuseScale;

varying vec3 N;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3, out vec4, out vec4);

void main()
{
	vec4 base = texture2D(diffuse, gl_TexCoord[0].xy);
	
	vec3 n = normalize(N);
	
	vec4 ambientColor, diffuseColor;
	
	lightGetAmbientDiffuse(n, ambientColor, diffuseColor);
	
	ambientColor += gl_LightModel.ambient;
	ambientColor *= gl_FrontMaterial.ambient;
	diffuseColor *= (gl_FrontMaterial.diffuse * gl_TexCoord[0].z);
    diffuseColor *= diffuseScale;

	vec4 color = base * (diffuseColor + ambientColor);
	color.rgb *= gl_TexCoord[0].w;

	gl_FragColor = fogThis(color);
	gl_FragColor.a = base.a;
}
