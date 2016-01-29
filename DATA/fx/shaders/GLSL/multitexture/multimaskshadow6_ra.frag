#version 120
#extension GL_EXT_texture_array : enable                             

uniform sampler2DArray src;
uniform sampler2D surf;
uniform sampler2D mask1;
uniform sampler2D mask2;

varying vec3 N;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3 normal,
                            out vec4 ambient,
                            out vec4 diffuse);

void main()
{
    vec4 layer0 = texture2DArray(src, vec3(gl_TexCoord[0].xy, 0));
    vec4 layer1 = texture2DArray(src, vec3(gl_TexCoord[0].zw, 1));
    vec4 layer2 = texture2DArray(src, vec3(gl_TexCoord[1].xy, 2));
    vec4 layer3 = texture2DArray(src, vec3(gl_TexCoord[1].zw, 3));
    vec4 layer4 = texture2DArray(src, vec3(gl_TexCoord[2].xy, 4));
    vec4 layer5 = texture2DArray(src, vec3(gl_TexCoord[2].zw, 5));

    vec4 m1 = texture2D(mask1, gl_TexCoord[6].xy);
    vec4 m2 = texture2D(mask2, gl_TexCoord[6].xy);

    vec4 c;
    
    c = (1.0 - m1.r) * layer0 + m1.r * layer1;
    c = (1.0 - m1.g) * c + m1.g * layer2;
    c = (1.0 - m1.b) * c + m1.b * layer3;
    c = (1.0 - m1.a) * c + m1.a * layer4;
    c = (1.0 - m2.r) * c + m2.r * layer5;

    c = (1.0 - m2.a) * c + m2.a * vec4(0.0, 0.0, 0.0, 0.9);
 
    vec4 c7 = texture2DProj(surf, gl_TexCoord[4]);
    c7.rgb = 1.0 - c7.rgb * 2.0;

    c *= c7;

    vec4 diffuse;
    vec4 ambient;

    vec3 n = normalize(N);

    lightGetAmbientDiffuse(n, ambient, diffuse); 

	ambient += gl_LightModel.ambient;

    ambient *= gl_FrontMaterial.ambient;
    diffuse *= gl_FrontMaterial.diffuse;
  
    vec4 color =  c * (diffuse + ambient);
    gl_FragColor = fogThis(color);
}
