#version 120

uniform sampler2DShadow shadowTexture0;
uniform sampler2DShadow shadowTexture1;
uniform sampler2DShadow shadowTexture2;

uniform float ambientBias;

uniform float zShadow0;
uniform float zShadow1;
uniform float zShadow2;

const float texelsize = 0.00048828125;
const float zoffset = 0.0;

const vec3 a = vec3(-texelsize, -texelsize, zoffset);
const vec3 b = vec3(texelsize, -texelsize, zoffset);
const vec3 c = vec3(texelsize, texelsize, zoffset);
const vec3 d = vec3(-texelsize, texelsize, zoffset);

varying float t;

void main(void)
{
    float testZ = (1.0 - gl_FragCoord.z) * 2.0 - 1.0;
    
    float map0 = step(testZ, zShadow0);
    float map1 = step(zShadow0, testZ) * step(testZ, zShadow1);
    float map2 = step(zShadow1, testZ) * step(testZ, zShadow2);
    float map3 = step(zShadow2, testZ);

    vec3 uv = gl_TexCoord[0].xyz / gl_TexCoord[0].w;
    float shadow0 = shadow2D(shadowTexture0, uv).r;
    shadow0 += shadow2D(shadowTexture0, uv + a).r;
    shadow0 += shadow2D(shadowTexture0, uv + b).r;
    shadow0 += shadow2D(shadowTexture0, uv + c).r;
    shadow0 += shadow2D(shadowTexture0, uv + d).r;
    shadow0 *= 0.2;
    
    uv = gl_TexCoord[1].xyz / gl_TexCoord[1].w;
    float shadow1 = shadow2D(shadowTexture1, uv).r;
    shadow1 += shadow2D(shadowTexture1, uv + a).r;
    shadow1 += shadow2D(shadowTexture1, uv + b).r;
    shadow1 += shadow2D(shadowTexture1, uv + c).r;
    shadow1 += shadow2D(shadowTexture1, uv + d).r;
    shadow1 *= 0.2;
  
    uv = gl_TexCoord[2].xyz / gl_TexCoord[2].w;
    float shadow2 = shadow2D(shadowTexture2, uv).r;
    shadow2 += shadow2D(shadowTexture2, uv + a).r;
    shadow2 += shadow2D(shadowTexture2, uv + b).r;
    shadow2 += shadow2D(shadowTexture2, uv + c).r;
    shadow2 += shadow2D(shadowTexture2, uv + d).r;
    shadow2 *= 0.2;

    float term0 = shadow0 * map0;
    float term1 = shadow1 * map1;
    float term2 = shadow2 * map2;
    float term3 = map3;

    float v = clamp(term0 + term1 + term2 + term3 + ambientBias, 0.0, 1.0);
      
    gl_FragColor.rgb = vec3(v + t);
    gl_FragColor.a = 1.0;
}
