#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform sampler2D src1;
uniform sampler2D src2;

uniform MaterialBlock
{
	vec4 b_Kd;
	vec4 b_Ka;
	vec4 b_Ks;
	vec4 b_Ke;
	float b_shininess;
};

in vec3 N;
in vec3 eyepos;
in vec2 tex0;
in float alphatest;

out vec4 out_color;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuseSpecular(in vec3 normal,
						            in vec3 V,
                                    in float shininess,
                                    out vec4 ambient,
                                    out vec4 diffuse,
                                    out vec4 specular);
void main()
{
	vec4 base = texture2D(src1, tex0);

    // Alpha test
    if(base.a < alphatest)
        discard;

    float Ks = texture2D(src2, tex0).r;
    float occ = texture2D(src2, tex0).g;
	
    vec4 diffuse;
    vec4 specular;
    vec4 ambient;
	
    // These values are interpolated and need to be normalized
    vec3 v = normalize(-eyepos);
    vec3 n = normalize(N);
	
    lightGetAmbientDiffuseSpecular(n, 
                                   v, 
                                   b_shininess,
                                   ambient, 
                                   diffuse, 
                                   specular);

    vec4 color = base * (diffuse * b_Kd + ambient * b_Ka * occ + specular * Ks);
	
    out_color = fogThis(color);
    out_color.w = base.a;
}
