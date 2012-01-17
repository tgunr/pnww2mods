#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MaterialBlock
{
	vec4 b_Kd;
	vec4 b_Ka;
	vec4 b_Ks;
	vec4 b_Ke;
	float b_shininess;
};

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

const float zoffset = 0.001954;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(out vec4 amb, out vec4 dif);

const vec4 defaultcolor = vec4(0, 0, 0, 0);

const vec3 e = vec3(0, 0, zoffset);

in vec3 tex0;
in vec2 tex2;
in vec4 tex3;
in vec4 tex4;
in vec4 tex5;

out vec4 out_color;

float GetShadowValue()
{
    float testZ = (1.0 - gl_FragCoord.z) * 2.0 - 1.0;
    
    float map0 = step(testZ, zShadow0);
    float map1 = step(zShadow0, testZ) * step(testZ, zShadow1);
    float map2 = step(zShadow1, testZ) * step(testZ, zShadow2);
    float map3 = step(zShadow2, testZ);

    vec3 uv = tex3.xyz / tex3.w;
    float s0 = texture(shadow0, uv + e);
    
    uv = tex4.xyz / tex4.w;
    float s1 = texture(shadow1, uv + e);
  
    uv = tex5.xyz / tex5.w;
    float s2 = texture(shadow2, uv + e);

    float term0 = s0 * map0;
    float term1 = s1 * map1;
    float term2 = s2 * map2;
    float term3 = map3;

    float v = clamp(term0 + term1 + term2 + term3 + shadowambient, 0.0, 1.0);
      
    return v;
}

void main()
{
	vec4 base = texture(src1, tex0.xy);
    vec4 tcolor = texture(splat, tex2);
     
    out_color = defaultcolor;

    if(base.a > alphatest)
    {
	    vec4 amb;
	    vec4 dif;
    	
	    lightGetAmbientDiffuse(amb, dif);
    	
        base = mix(base, tcolor, tcolor.a);

	    vec4 color = base * (amb * b_Ka + dif * b_Kd);

        color.rgb *= tex0.z;
	    color.rgb *= GetShadowValue();

        out_color = fogThis(color);
    }
}
