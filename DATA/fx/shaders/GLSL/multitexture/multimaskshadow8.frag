#version 120

uniform sampler2DArray src;
uniform sampler2D surf;
uniform sampler2D mask1;
uniform sampler2D mask2;
uniform sampler2DShadow shad;

uniform vec3 shadowambient;

varying vec3 N;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3 normal,
                            out vec4 ambient,
                            out vec4 diffuse);

float GetShadowValue()
{
    vec3 c1 = gl_TexCoord[4].xyz / gl_TexCoord[4].w;
    c1.z -= 0.0005;
    c1.z = clamp(c1.z, 0.0, 1.0);

	float scale = 0.000488;
    float shadow = 0.0;

	for(float y = -1.5 ; y <= 1.5 ; y += 1.0)
    {
		for(float x = -1.5 ; x <= 1.5 ; x += 1.0)
        {
            shadow += shadow2D(shad, c1.xyz + vec3(x * scale, y * scale, 0.0)).r;
        }
    }

	shadow *= 0.0625;
    shadow = clamp(shadow + shadowambient.r, 0.0, 1.0);

    return shadow;
}

void main()
{
    vec4 c1 = texture2DArray(src, vec3(gl_TexCoord[0].xy, 0));
    vec4 c2 = texture2DArray(src, vec3(gl_TexCoord[0].zw, 1));
    vec4 c3 = texture2DArray(src, vec3(gl_TexCoord[1].xy, 2));
    vec4 c4 = texture2DArray(src, vec3(gl_TexCoord[1].zw, 3));
    vec4 c5 = texture2DArray(src, vec3(gl_TexCoord[2].xy, 4));
    vec4 c6 = texture2DArray(src, vec3(gl_TexCoord[2].zw, 5));
    vec4 c7 = texture2DArray(src, vec3(gl_TexCoord[3].xy, 6));
    vec4 c8 = texture2DArray(src, vec3(gl_TexCoord[3].zw, 7));

    vec4 m1 = texture2D(mask1, gl_TexCoord[6].xy);
    vec4 m2 = texture2D(mask2, gl_TexCoord[6].xy);

    vec4 c;
    
    c = (1.0 - m1.r) * c1 + m1.r * c2;
    c = (1.0 - m1.g) * c + m1.g * c3;
    c = (1.0 - m1.b) * c + m1.b * c4;
    c = (1.0 - m1.a) * c + m1.a * c5;
    c = (1.0 - m2.r) * c + m1.r * c6;
    c = (1.0 - m2.g) * c + m1.g * c7;
    c = (1.0 - m2.b) * c + m1.b * c8;

    c = (1.0 - m2.a) * c + m2.a * vec4(0.0, 0.0, 0.0, 0.9);
 
    vec4 c9 = texture2DProj(surf, gl_TexCoord[5]);
    c9.rgb = 1.0 - c9.rgb * 2.0;

    c *= c9;

    vec4 diffuse;
    vec4 ambient;

    vec3 n = normalize(N);

    lightGetAmbientDiffuse(n, ambient, diffuse); 

	ambient += gl_LightModel.ambient;

    ambient *= gl_FrontMaterial.ambient;
    diffuse *= gl_FrontMaterial.diffuse;
  
    c.rgb *= GetShadowValue();

    vec4 color =  c * (diffuse + ambient);
    gl_FragColor = fogThis(color);
}
