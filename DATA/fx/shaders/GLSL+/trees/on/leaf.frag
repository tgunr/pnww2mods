#version 150

uniform vec4 Ka;
uniform vec4 Kd;

uniform sampler2D src1;
uniform sampler2D src2;

in vec2 uv;
in vec3 N;
in vec3 T;
in vec3 B;
in vec3 vertexpos;
in float diffcoef;

out vec4 out_color;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3, 
                            in vec3, 
                            in vec3, 
                            in vec3, 
                            out vec4, 
                            out vec4);

void main()
{
   vec4 base = texture2D(src1, uv);
   vec4 normal = texture2D(src2, uv) * 2.0 - 1.0;
      
   vec4 diffuse;
   vec4 ambient;
   
   // Interpolated values need to be normalized
   vec3 t = normalize(T);
   vec3 b = normalize(B);
   vec3 n = normalize(N);

   lightGetAmbientDiffuse(t, b, n, normal.xyz, ambient, diffuse);

   ambient *= Ka;
   diffuse *= (Kd * diffcoef);
    
   vec4 color = base * (diffuse + ambient);

   out_color = fogThis(color);
   out_color.a = base.a;
}
