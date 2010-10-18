#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform LightBlock
{
   float enabled;
   float kc;
   float kl;
   float kq;
   vec3 dir;
   vec3 pos;
   vec4 diffuse;
   vec4 ambient;
   vec4 specular;
} lightsource[4];

uniform AmbientBlock
{
    vec4 globalambient;
};

in vec3 eyepos;

void lightGetAmbientDiffuseSpecular(in vec3 normal,
                                    in vec3 V,
                                    in float shininess,
                                    out vec4 ambient,
                                    out vec4 diffuse,
                                    out vec4 specular)
{
   vec3 L;
   vec3 H;
   float d;
   float s;

   ambient = vec4(0, 0, 0, 0);
   diffuse = vec4(0, 0, 0, 0);
   specular = vec4(0, 0, 0, 0);
   float a;
   
   if(lightsource[0].enabled > 0.0)
   {
      L = lightsource[0].dir;   
         
      d = max(dot(normal, L), 0.0);
   
      if(d > 0.0)
      {
         diffuse += d * lightsource[0].diffuse;
      
         H = normalize(L + V);
         s = max(dot(normal, H), 0.0);
         s = pow(s, shininess);
      
         specular += s * lightsource[0].specular;
      }
   
      ambient += lightsource[0].ambient;
   }

   if(lightsource[1].enabled > 0.0)
   {
      L = lightsource[1].dir;   
         
      d = max(dot(normal, L), 0.0);
   
      if(d > 0.0)
      {
         diffuse += d * lightsource[1].diffuse;
      
         H = normalize(L + V);
         s = max(dot(normal, H), 0.0);
         s = pow(s, shininess);
      
         specular += s * lightsource[1].specular;
      }
   
      ambient += lightsource[1].ambient;
   }

   if(lightsource[2].enabled > 0.0)
   {
      d = distance(eyepos, lightsource[2].pos);   
      a = (lightsource[2].kc + d * (lightsource[2].kl + lightsource[2].kq * d));
      a = (a > 1.0) ? (1.0 / a) : 1.0;

      L = lightsource[2].dir;   
         
      d = max(dot(normal, L), 0.0);
   
      if(d > 0.0)
      {
         diffuse += a * d * lightsource[2].diffuse;
      
         H = normalize(L + V);
         s = max(dot(normal, H), 0.0);
         s = pow(s, shininess);
      
         specular += a * s * lightsource[2].specular;
      }
   
      ambient += a * lightsource[2].ambient;
   }

   if(lightsource[3].enabled > 0.0)
   {
      d = distance(eyepos, lightsource[3].pos);   
      a = (lightsource[3].kc + d * (lightsource[3].kl + lightsource[3].kq * d));
      a = (a > 1.0) ? (1.0 / a) : 1.0;

      L = lightsource[3].dir;   
         
      d = max(dot(normal, L), 0.0);
   
      if(d > 0.0)
      {
         diffuse += a * d * lightsource[3].diffuse;
      
         H = normalize(L + V);
         s = max(dot(normal, H), 0.0);
         s = pow(s, shininess);
      
         specular += a * s * lightsource[3].specular;
      }
   
      ambient += a * lightsource[3].ambient;
   }

   ambient += globalambient;
}
