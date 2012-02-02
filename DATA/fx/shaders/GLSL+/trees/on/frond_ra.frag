#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform sampler2D src1;

uniform float diffuseScale;

in vec3 N;
in vec2 tex0;
in float alphatest;

out vec4 out_color;

const vec4 defaultcolor = vec4(0, 0, 0, 0);

vec4 fogThis(in vec4);
void sun_ad(in vec3 normal, out vec4 ambient, out vec4 diffuse);

void main()
{
    vec4 base = texture2D(src1, tex0);

    out_color = defaultcolor;

    if(base.a < alphatest)
        discard;

    vec4 dif;
    vec4 amb;

    vec3 n = normalize(N);

    sun_ad(n, dif, amb);

    vec4 color = base * (dif * diffuseScale + amb);

    out_color = fogThis(color);
}
