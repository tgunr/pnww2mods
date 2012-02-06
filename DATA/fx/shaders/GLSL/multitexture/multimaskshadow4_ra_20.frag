#version 120

uniform sampler2D l0;
uniform sampler2D l1;
uniform sampler2D l2;
uniform sampler2D l3;
uniform sampler2D surf;
uniform sampler2D mask1;

uniform vec3 shadowambient;

varying vec3 N;

vec4 fogThis(in vec4);
void lightGetSunAmbientDiffuse(in vec3 normal, out vec4 ambient, out vec4 diffuse);

void main()
{
    vec4 layer0 = texture2D(l0, gl_TexCoord[0].xy);
    vec4 layer1 = texture2D(l1, gl_TexCoord[0].zw);
    vec4 layer2 = texture2D(l2, gl_TexCoord[1].xy);
    vec4 layer3 = texture2D(l3, gl_TexCoord[1].zw);

    vec4 mask = texture2D(mask1, gl_TexCoord[2].xy);

    vec4 c;
    
    c = (1.0 - mask.r) * layer0 + mask.r * layer1;
    c = (1.0 - mask.g) * c + mask.g * layer2;
    c = (1.0 - mask.b) * c + mask.b * layer3;
    c = (1.0 - mask.a) * c + mask.a * vec4(0.0, 0.0, 0.0, 0.9);
 
    vec4 c5 = texture2DProj(surf, gl_TexCoord[3]);
    c5.rgb = 1.0 - c5.rgb * 2.0;

    c *= c5;
    
    vec4 diffuse;
    vec4 ambient;

    vec3 n = normalize(N);

    lightGetSunAmbientDiffuse(n, ambient, diffuse); 

	ambient += gl_LightModel.ambient;

    ambient *= gl_FrontMaterial.ambient;
    diffuse *= gl_FrontMaterial.diffuse;
  
    vec4 color =  c * (diffuse + ambient);
    gl_FragColor = fogThis(color);
}
