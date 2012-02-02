#version 120
#extension GL_EXT_texture_array : enable                             

uniform sampler2DArray src;
uniform sampler2D surf;
uniform sampler2D mask1;

uniform vec3 shadowambient;

varying vec3 N;

vec4 fogThis(in vec4);
void lightGetSunAmbientDiffuse(in vec3 normal, out vec4 ambient, out vec4 diffuse);

void main()
{
    vec4 layer0 = texture2DArray(src, vec3(gl_TexCoord[0].xy, 0));
    vec4 layer1 = texture2DArray(src, vec3(gl_TexCoord[0].zw, 1));
    vec4 layer2 = texture2DArray(src, vec3(gl_TexCoord[1].xy, 2));
    vec4 layer3 = texture2DArray(src, vec3(gl_TexCoord[1].zw, 3));

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
