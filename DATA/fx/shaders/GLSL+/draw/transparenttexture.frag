#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform sampler2D src1;

uniform MaterialBlock
{
	vec4 b_Kd;
	vec4 b_Ka;
	vec4 b_Ks;
	vec4 b_Ke;
	float b_shininess;
};

in vec3 eyepos;
in vec3 N;
in vec2 tex0;

out vec4 out_color;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuseSpecular(in vec3 normal,
                                    in vec3 V,
                                    in float shininess,
                                    out vec4 ambient,
                                    out vec4 diffuse,
                                    out vec4 specular);

const float alphatest = 0.32941176;

void main()
{
	vec4 base = texture2D(src1, tex0);
	
    // Alpha test
    if(base.a < alphatest)
        discard;

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

    vec4 light = diffuse * b_Kd + specular * b_Ks + ambient * b_Ka;
    vec4 c = base * light;

    out_color = fogThis(c);
}
