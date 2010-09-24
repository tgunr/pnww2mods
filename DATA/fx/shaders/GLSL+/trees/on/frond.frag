#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MaterialBlock
{
	vec4 Kd;
	vec4 Ka;
	vec4 Ks;
	vec4 Ke;
	float shininess;
};

uniform sampler2D src1;

uniform float diffuseScale;

in vec3 N;
in vec2 tex0;
in float alphatest;

out vec4 out_color;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3, out vec4, out vec4);

void main()
{
    vec4 base = texture2D(src1, tex0);

    if(base.a <= alphatest)
        discard;

    vec4 diffuse;
    vec4 ambient;

    // Normalize interpolated values
    vec3 n = normalize(N);

    lightGetAmbientDiffuse(n, ambient, diffuse);

    diffuse *= diffuseScale;

    ambient *= Ka;

    vec4 color = base * (diffuse + ambient);

    out_color = fogThis(color);
    out_color.w = base.a;
}
