#version 120

uniform sampler2D src1;
uniform float alphatest;

varying vec3 eyepos;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(out vec4 amb, out vec4 dif);

void main()
{
	vec4 base = texture2D(src1, gl_TexCoord[0].xy);

    if(base.a <= alphatest)
        discard;

	vec4 amb;
	vec4 dif;
	
	lightGetAmbientDiffuse(amb, dif);
	
    amb += gl_LightModel.ambient;

	vec4 color = base * (amb * gl_FrontMaterial.ambient + dif * gl_FrontMaterial.diffuse);

	gl_FragColor = fogThis(color);
}
