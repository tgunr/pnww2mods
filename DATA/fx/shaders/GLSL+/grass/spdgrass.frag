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

const float alphatest = 0.329411764;

in vec2 tex0;

out vec4 out_color;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(out vec4 amb, out vec4 dif);

const vec4 zerovec = vec4(0, 0, 0, 0);

void main()
{
	vec4 base = texture2D(src1, tex0);

    if(base.a < alphatest)
        discard;

    vec4 amb;
    vec4 dif;
	
    lightGetAmbientDiffuse(amb, dif);

    vec4 color = base * (amb * b_Ka + dif * b_Kd);

    out_color = fogThis(color);
}
