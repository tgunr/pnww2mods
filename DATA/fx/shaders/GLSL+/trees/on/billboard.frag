#version 150

uniform sampler2D src1;
uniform sampler2D src2;

uniform float lightadjust;

in vec3 T;
in vec3 B;
in vec3 N;
in vec2 tex0;
in vec4 tex1;

out vec4 out_color;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3,
                            in vec3,
                            in vec3,
                            in vec3,
                            out vec4, 
                            out vec4);

const float alphatest = 0.32941176;

void main()
{
   vec4 base = texture2D(src1, tex0);

   if(base.a < alphatest)
       discard;

   vec4 normal = texture2D(src2, tex0) * 2.0 - 1.0;
   
   vec4 diffuse;
   vec4 ambient;

   vec3 t = normalize(T);
   vec3 b = normalize(B);
   vec3 n = normalize(N);

   lightGetAmbientDiffuse(t, b, n, normal.xyz, ambient, diffuse);

   float adjust = mix(tex1.x, tex1.y, lightadjust);

   vec4 color = base * (diffuse * adjust + ambient * tex1.z);
    
   out_color = fogThis(color);
   out_color.a = base.a * tex1.w;
}
