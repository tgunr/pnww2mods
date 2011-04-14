#version 120

uniform sampler2D src1;
uniform sampler2DShadow src2;
uniform sampler2DShadow src3;

uniform float alphatest;
uniform vec3 shadowambient;
uniform float scale;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(out vec4 amb, out vec4 dif);
void lightSetVertexPos(in vec3 p);

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

	vec3 c1 = gl_TexCoord[1].xyz / gl_TexCoord[1].w;

	vec4 s1 = shadow2D(src2, c1);

    c1 = gl_TexCoord[2].xyz / gl_TexCoord[2].w;

	vec4 s2 = shadow2D(src3, c1);

    s1 *= s2;

    s1.rgb = clamp(s1.rgb + shadowambient, 0.0, 1.0);

	color.rgb *= s1.rgb;

    gl_FragColor = color;
}
