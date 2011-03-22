#version 120

uniform sampler2D src1;
uniform sampler2D src2;
uniform sampler2D src3;

varying vec3 N;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3 normal,
                            out vec4 ambient,
                            out vec4 diffuse);

void main()
{
    vec4 c1 = texture2D(src1, gl_TexCoord[0].xy);
    vec4 c2 = texture2D(src2, gl_TexCoord[0].zw);
    vec4 c3 = texture2D(src3, gl_TexCoord[1].xy);

    vec4 c = c1 * c2 * c3;

    vec4 diffuse;
    vec4 ambient;

    vec3 n = normalize(N);

    lightGetAmbientDiffuse(n, ambient, diffuse); 
	ambient += gl_LightModel.ambient;

    vec4 color =  c * (diffuse * gl_FrontMaterial.diffuse + ambient * gl_FrontMaterial.ambient);
    color.a = 1.0;

    gl_FragColor = fogThis(color);
}
