#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform sampler2D src1;
uniform sampler2D src2;

in vec2 tex0;
in vec3 N;
in vec3 T;
in vec3 B;
in float diffcoef;
in float alphatest;

out vec4 out_color;

vec4 fogThis(in vec4);
void sun_tad(in vec3 t,
             in vec3 b,
             in vec3 n,
             in vec3 normal,
             out vec4 ambient, 
             out vec4 diffuse);

void main()
{
    vec4 base = texture2D(src1, tex0);

    if(base.a < alphatest)
        discard;

    vec4 normal = texture2D(src2, tex0) * 2.0 - 1.0;
      
    vec4 dif;
    vec4 amb;

    // Interpolated values need to be normalized
    vec3 t = normalize(T);
    vec3 b = normalize(B);
    vec3 n = normalize(N);

    sun_tad(t, b, n, normal.xyz, amb, dif);

    vec4 color = base * (dif * diffcoef + amb);
   
    out_color = fogThis(color);
    out_color.a = base.a;
}
