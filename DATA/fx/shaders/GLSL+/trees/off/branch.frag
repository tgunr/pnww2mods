#version 150

uniform sampler2D src1;
uniform sampler2D src3;

uniform float diffuseScale;

uniform vec4 Ka;
uniform vec4 Kd;

in vec3 N;
in vec3 vpos;
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
   vec4 detail = texture2D(src3, tex1.zw);
  
   base.rgb = mix(base.rgb, detail.rgb, detail.a);
   
   // Interpolated values need to be normalized
   vec3 n = normalize(N);
      
   vec4 diffuse;
   vec4 ambient;
   
   lightGetAmbientDiffuse(n, ambient, diffuse);
     
   ambient *= Ka;
   diffuse *= (diffuseScale * Kd);
   
   vec4 color = base * (diffuse + ambient);

   out_color = fogThis(color);
   out_color.a = 1.0;
}
