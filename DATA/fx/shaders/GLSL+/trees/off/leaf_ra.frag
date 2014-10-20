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

uniform sampler2D diffuse;

in vec3 N;
in vec2 tex0;
in vec3 vertexpos;
in float diffcoef;
in float alphatest;

out vec4 out_color;

vec4 fogThis(in vec4);
void sun_ad(in vec3, out vec4, out vec4);

void main()
{
    vec4 base = texture2D(diffuse, tex0);

    if(base.a < alphatest)
        discard;

    vec4 dif;
    vec4 amb;

    // Interpolated values need to be normalized
    vec3 n = normalize(N);

    sun_ad(n, amb, dif);

    vec4 color = base * (dif * b_Kd * diffcoef + amb * b_Ka);
   
    out_color = fogThis(color);
    out_color.a = base.a;
}
