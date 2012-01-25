#version 120

uniform sampler2D src1;
uniform sampler2D splat;
uniform float alphatest;

varying vec3 eyepos;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(out vec4 amb, out vec4 dif);

void main()
{
	vec4 base = texture2D(src1, gl_TexCoord[0].xy);
    vec4 tcolor = texture2D(splat, gl_TexCoord[1].xy);

    if(base.a < alphatest)
        discard;

	vec4 amb;
	vec4 dif;
    	
	lightGetAmbientDiffuse(amb, dif);
    	
    amb += gl_LightModel.ambient;

    base = mix(base, tcolor, tcolor.a);

    vec4 color = base * (amb * gl_FrontMaterial.ambient + dif * gl_FrontMaterial.diffuse);
    color.rgb *= gl_TexCoord[0].z;

	gl_FragColor = fogThis(color);
}
