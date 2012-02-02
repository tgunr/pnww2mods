#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform sampler2D diffuse;
uniform sampler2D normalmap;
uniform sampler2D detailmap;

uniform float diffuseScale;

in vec3 T;
in vec3 B;
in vec3 N;
in vec2 tex0;
in vec4 tex1;

out vec4 out_color;

const vec4 defaultcolor = vec4(0);

vec4 fogThis(in vec4);
void sun_tad(in vec3 t,
             in vec3 b,
             in vec3 n,
             in vec3 normal,
             out vec4 ambient, 
             out vec4 diffuse);

void main()
{ 
    vec4 base = texture2D(diffuse, tex0);

    out_color = defaultcolor;

    vec4 normal = texture2D(normalmap, tex1.xy) * 2.0 - 1.0;
    vec4 detail = texture2D(detailmap, tex1.zw);

    base.rgb = mix(base.rgb, detail.rgb, detail.a);

    // Interpolated values need to be normalized
    vec3 t = normalize(T);
    vec3 b = normalize(B);
    vec3 n = normalize(N);
   
    vec4 dif;
    vec4 amb;
    
    sun_tad(t, b, n, normal, amb, dif);

    vec4 color = base * (dif * diffuseScale + amb);

    out_color = fogThis(color);
}
