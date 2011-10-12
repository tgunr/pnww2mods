#version 120

uniform sampler2D src1;
uniform sampler2D src2;

varying vec3 N;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3 normal,
                            out vec4 ambient,
                            out vec4 diffuse);

void main()
{
    vec4 layer0 = texture2D(src1, gl_TexCoord[0].xy);
    vec4 layer1 = texture2D(src2, gl_TexCoord[0].zw);

    vec4 c = layer0 * layer1;
       
    vec4 diffuse;
    vec4 ambient;

    vec3 n = normalize(N);

    lightGetAmbientDiffuse(n, ambient, diffuse); 
	ambient += gl_LightModel.ambient;

    vec4 color = c * (diffuse * gl_FrontMaterial.diffuse + ambient * gl_FrontMaterial.ambient);

    gl_FragColor = fogThis(color);
}
