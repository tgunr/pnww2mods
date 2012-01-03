#version 120

uniform sampler2DShadow shadowTexture0;
uniform sampler2DShadow shadowTexture1;
uniform sampler2DShadow shadowTexture2;

uniform float ambientBias;

uniform float zShadow0;
uniform float zShadow1;
uniform float zShadow2;

const float texelsize = 0.001377 * 0.25;
const float zoffset = 0.001954;

const vec3 a = vec3(-texelsize, -texelsize, zoffset);
const vec3 b = vec3(texelsize, -texelsize, zoffset);
const vec3 c = vec3(texelsize, texelsize, zoffset);
const vec3 d = vec3(-texelsize, texelsize, zoffset);
const vec3 e = vec3(0, 0, zoffset);

void main(void)
{
    float testZ = (1.0 - gl_FragCoord.z) * 2.0 - 1.0;
    
    float map0 = step(testZ, zShadow0);
    float map1 = step(zShadow0, testZ) * step(testZ, zShadow1);
    float map2 = step(zShadow1, testZ) * step(testZ, zShadow2);
    float map3 = step(zShadow2, testZ);

#if WANT_PCF
    vec3 uv0 = gl_TexCoord[0].xyz / gl_TexCoord[0].w;
    vec3 uv1 = gl_TexCoord[1].xyz / gl_TexCoord[1].w;
    vec3 uv2 = gl_TexCoord[2].xyz / gl_TexCoord[2].w;

	float scale = 0.0004;//88;
    float shadow0 = 0.0;
    float shadow1 = 0.0;
    float shadow2 = 0.0;

	for(float y = -1.5 ; y <= 1.5 ; y += 1.0)
    {
		for(float x = -1.5 ; x <= 1.5 ; x += 1.0)
        {
            shadow0 += shadow2D(shadowTexture0, uv0.xyz + vec3(x * scale, y * scale, 0.0)).r;
            shadow1 += shadow2D(shadowTexture1, uv1.xyz + vec3(x * scale, y * scale, 0.0)).r;
            shadow2 += shadow2D(shadowTexture2, uv2.xyz + vec3(x * scale, y * scale, 0.0)).r;
        }
    }

	shadow0 *= 0.0625;
	shadow1 *= 0.0625;
	shadow2 *= 0.0625;
#else
    vec3 uv = gl_TexCoord[0].xyz / gl_TexCoord[0].w;
    float shadow0 = shadow2D(shadowTexture0, uv + e).r;
    shadow0 += shadow2D(shadowTexture0, uv + a).r;
    shadow0 += shadow2D(shadowTexture0, uv + b).r;
    shadow0 += shadow2D(shadowTexture0, uv + c).r;
    shadow0 += shadow2D(shadowTexture0, uv + d).r;
    shadow0 /= 5.0;
    
    uv = gl_TexCoord[1].xyz / gl_TexCoord[1].w;
    float shadow1 = shadow2D(shadowTexture1, uv + e).r;
    shadow1 += shadow2D(shadowTexture1, uv + a).r;
    shadow1 += shadow2D(shadowTexture1, uv + b).r;
    shadow1 += shadow2D(shadowTexture1, uv + c).r;
    shadow1 += shadow2D(shadowTexture1, uv + d).r;
    shadow1 /= 5.0;
  
    uv = gl_TexCoord[2].xyz / gl_TexCoord[2].w;

    float shadow2 = shadow2D(shadowTexture2, uv + e).r;
    shadow2 += shadow2D(shadowTexture2, uv + a).r;
    shadow2 += shadow2D(shadowTexture2, uv + b).r;
    shadow2 += shadow2D(shadowTexture2, uv + c).r;
    shadow2 += shadow2D(shadowTexture2, uv + d).r;
	shadow2 /= 5.0;
#endif

    float term0 = shadow0 * map0;
    float term1 = shadow1 * map1;
    float term2 = shadow2 * map2;
    float term3 = map3;

    float v = clamp(term0 + term1 + term2 + term3 + ambientBias, 0.0, 1.0);
      
    gl_FragColor.rgb = vec3(v);
    gl_FragColor.a = 1.0;
}
