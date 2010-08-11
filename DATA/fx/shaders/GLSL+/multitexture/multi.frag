#version 150

uniform sampler2D src1;
uniform sampler2D src2;
uniform sampler2D src3;

uniform vec4 Ka;
uniform vec4 Kd;

in vec3 N;
in vec2 tex0;
in vec2 tex1;
in vec2 tex2;

out vec4 out_color;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3 normal,
                            out vec4 ambient,
                            out vec4 diffuse);

void main()
{
    vec4 c1 = texture2D(src1, tex0);
    vec4 c2 = texture2D(src2, tex1);
    vec4 c3 = texture2D(src3, tex2);

    vec4 c = c1 * c2 * c3;

    vec4 diffuse;
    vec4 ambient;

    vec3 n = normalize(N);

    lightGetAmbientDiffuse(n, ambient, diffuse); 

    ambient *= Ka;
    diffuse *= Kd;

    vec4 color =  c * (diffuse + ambient);
    out_color = fogThis(color);
}
