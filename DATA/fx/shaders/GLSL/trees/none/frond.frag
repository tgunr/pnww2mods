#version 120

uniform sampler2D diffuse;

uniform float diffuseScale;
uniform float alphatest;

varying vec3 N;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3, out vec4, out vec4);

void main()
{
	vec4 base = texture2D(diffuse, gl_TexCoord[0].xy);

    if(base.a <= alphatest)
        discard;

	vec4 diffuseColor;
	vec4 ambientColor;
	
	// Normalize interpolated values
	vec3 n = normalize(N);
	
	lightGetAmbientDiffuse(n, ambientColor, diffuseColor);
	
	diffuseColor.rgb *= diffuseScale;
	
	ambientColor += gl_LightModel.ambient;
	ambientColor *= gl_FrontMaterial.ambient;
	
	vec4 color = base * (diffuseColor + ambientColor);

	gl_FragColor = fogThis(color);
	gl_FragColor.w = base.a;
}
