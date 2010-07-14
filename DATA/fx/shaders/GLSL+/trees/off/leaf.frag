#version 150

uniform sampler2D src1;

uniform vec4 globalambient;

uniform vec4 Ka;
uniform vec4 Kd;

in vec2 uv;
in vec3 N;
in vec3 vertexpos;
in float diffcoef;

out vec4 out_color;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3, 
                            out vec4, 
                            out vec4);

void main()
{
   vec4 base = texture2D(src1, uv);
      
   vec4 diffuse;
   vec4 ambient;
   
   // Interpolated values need to be normalized
   vec3 n = normalize(N);

   lightGetAmbientDiffuse(n, ambient, diffuse);

   ambient += globalambient;
   ambient *= Ka;
   diffuse *= (Kd * diffcoef);
    
   vec4 color = base * (diffuse + ambient);

   out_color = fogThis(color);
   out_color.a = base.a;
}
