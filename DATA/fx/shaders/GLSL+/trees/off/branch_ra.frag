#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform sampler2D diffuse;
uniform sampler2D detailmap;

uniform float diffuseScale;

in vec2 tex0;
in vec4 tex1;
in float alphatest;
in vec3 N;

out vec4 out_color;

vec4 fogThis(in vec4);
void sun_ad(in vec3, out vec4, out vec4);

void main()
{ 
    vec4 base = texture2D(diffuse, tex0);

    if(base.a < alphatest)
        discard;

    vec3 n = normalize(N);

    vec4 detail = texture2D(detailmap, tex1.zw);

    base.rgb = mix(base.rgb, detail.rgb, detail.a);
  
    vec4 diffuse;
    vec4 ambient;

    sun_ad(n, ambient, diffuse);
     
    vec4 color = base * (diffuse * diffuseScale + ambient);

    out_color = fogThis(color);
}
