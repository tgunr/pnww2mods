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

uniform LightBlock0
{
    float b_enabled0;
    float b_kc0;
    float b_kl0;
    float b_kq0;
    vec3 b_dir0;
    vec3 b_pos0;
    vec4 b_diffuse0;
    vec4 b_ambient0;
    vec4 b_specular0;
};

uniform AmbientBlock
{
    vec4 b_globalambient;
};

uniform sampler2D src1;
uniform sampler2D splat;
uniform float alphatest;

vec4 fogThis(in vec4);

const vec4 Ka = vec4(0.50, 0.50, 0.43, 1.0);
const vec4 Kd = vec4(0.4, 0.45, 0.39, 1.0);

in vec3 tex0;
in vec2 tex1;

out vec4 out_color;

void main()
{
	vec4 base = texture2D(src1, tex0.xy);
    vec4 tcolor = texture2D(splat, tex1);

    if(base.a < alphatest)
        discard;

	vec4 amb = b_ambient0 + b_globalambient;
	vec4 dif = b_diffuse0;
    	
    base = mix(base, tcolor, tcolor.a);

    vec4 color = base * (amb * b_Ka + dif * b_Kd);
    color.rgb *= tex0.z;

    out_color = fogThis(color);
}
