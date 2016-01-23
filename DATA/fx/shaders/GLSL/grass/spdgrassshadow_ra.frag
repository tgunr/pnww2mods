#version 120

uniform sampler2D src1;
uniform sampler2DShadow shadow0;
uniform sampler2DShadow shadow1;
uniform sampler2DShadow shadow2;
uniform sampler2D splat;

uniform float alphatest;
uniform float shadowambient;

uniform float zShadow0;
uniform float zShadow1;
uniform float zShadow2;

vec4 fogThis(in vec4);
void lightGetSunAmbientDiffuse(out vec4 amb, out vec4 dif);

float GetShadowValue()
{
    float testZ = (1.0 - gl_FragCoord.z) * 2.0 - 1.0;
    
    float map0 = step(testZ, zShadow0);
    float map1 = step(zShadow0, testZ) * step(testZ, zShadow1);
    float map2 = step(zShadow1, testZ) * step(testZ, zShadow2);
    float map3 = step(zShadow2, testZ);

    vec3 uv = gl_TexCoord[2].xyz / gl_TexCoord[2].w;
    float s0 = shadow2D(shadow0, uv).r;
    
    uv = gl_TexCoord[3].xyz / gl_TexCoord[3].w;
    float s1 = shadow2D(shadow1, uv).r;
  
    uv = gl_TexCoord[4].xyz / gl_TexCoord[4].w;
    float s2 = shadow2D(shadow2, uv).r;

    float term0 = s0 * map0;
    float term1 = s1 * map1;
    float term2 = s2 * map2;
    float term3 = map3;

    float v = clamp(term0 + term1 + term2 + term3 + shadowambient, 0.0, 1.0);
      
    return v;
}

void main()
{
    vec4 base = texture2D(src1, gl_TexCoord[0].xy);
    vec4 tcolor = texture2D(splat, gl_TexCoord[1].xy);
    
    if(base.a < alphatest)
        discard;
   
    vec4 amb;
    vec4 dif;
    	
    lightGetSunAmbientDiffuse(amb, dif);
    	
    amb += gl_LightModel.ambient;

    base = mix(base, tcolor, tcolor.a);

    vec4 color = base * (amb * gl_FrontMaterial.ambient + dif * gl_FrontMaterial.diffuse);

    color.rgb *= gl_TexCoord[0].z;
    color.rgb *= GetShadowValue();
        
    gl_FragColor = fogThis(color);
}
