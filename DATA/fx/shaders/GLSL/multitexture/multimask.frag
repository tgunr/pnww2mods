#version 120

uniform sampler2D src1;
uniform sampler2D src2;
uniform sampler2D src3;
uniform sampler2D src4;
uniform sampler2D src5;

varying vec3 N;
varying vec3 eyepos;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3 normal,
                            out vec4 ambient,
                            out vec4 diffuse);
void lightSetVertexPos(in vec3 p);

void main()
{
    vec4 c1 = texture2D(src1, gl_TexCoord[0].xy);
    vec4 c2 = texture2D(src2, gl_TexCoord[0].zw);
    vec4 c3 = texture2D(src3, gl_TexCoord[1].xy);
    vec4 c4 = texture2D(src4, gl_TexCoord[1].zw);

    vec4 mask = texture2D(src5, gl_TexCoord[2].xy);

    vec4 c;
    
    c = (1.0 - mask.r) * c1 + mask.r * c2;
    c = (1.0 - mask.g) * c + mask.g * c3;
    c = (1.0 - mask.b) * c + mask.b * c4;
    c = (1.0 - mask.a) * c + mask.a * vec4(0.25, 0.25, 0.25, 1.0);

    vec4 diffuse;
    vec4 ambient;

    vec3 n = normalize(N);

	lightSetVertexPos(eyepos);
    lightGetAmbientDiffuse(n, ambient, diffuse); 
	lightSetVertexPos(vec3(0, 0, 0));

	ambient += gl_LightModel.ambient;

    ambient *= gl_FrontMaterial.ambient;
    diffuse *= gl_FrontMaterial.diffuse;

    vec4 color =  c * (diffuse + ambient);
    gl_FragColor = fogThis(color);
}
