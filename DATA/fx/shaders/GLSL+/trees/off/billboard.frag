#version 150

uniform sampler2D src1;

uniform float lightadjust;

in vec3 N;
in vec2 tex0;
in vec4 tex1;

out vec4 out_color;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3,
                            out vec4, 
                            out vec4);

void main()
{
   vec4 base = texture2D(src1, tex0);
   
   vec4 diffuse;
   vec4 ambient;

   vec3 n = normalize(N);

   lightGetAmbientDiffuse(n, ambient, diffuse);

   float adjust = mix(tex1.x, tex1.y, lightadjust);
   diffuse *= adjust;
   
   ambient *= tex1.z;

   vec4 color = base * (diffuse + ambient);

   out_color = fogThis(color);
   out_color.a = base.a * tex1.w;
}
