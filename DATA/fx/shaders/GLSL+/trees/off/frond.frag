#version 150

uniform sampler2D src1;

uniform float diffuseScale;
uniform vec4 globalambient;

uniform vec4 Ka;

in vec3 N;
in vec2 tex0;

out vec4 out_color;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3, out vec4, out vec4);

void main()
{
   vec4 base = texture2D(src1, tex0);

   vec4 diffuse;
   vec4 ambient;
   
   // Normalize interpolated values
   vec3 n = normalize(N);
   
   lightGetAmbientDiffuse(n, ambient, diffuse);
  
   diffuse *= diffuseScale;
   
   ambient += globalambient;
   ambient *= Ka;
   
   vec4 color = base * (diffuse + ambient);

   out_color = fogThis(color);
   out_color.w = base.a;
}
