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

void lightGetAmbientDiffuse(out vec4 ambient, out vec4 diffuse)
{   
   ambient = vec4(0, 0, 0, 0);
   diffuse = vec4(0, 0, 0, 0);
   float a;
   float d;

   if(lightsource[0].enabled > 0.0)
   {   
      diffuse += lightsource[0].diffuse;   
      ambient += lightsource[0].ambient;
   }

   if(lightsource[1].enabled > 0.0)
   {   
      diffuse += lightsource[1].diffuse;   
      ambient += lightsource[1].ambient;
   }

   if(lightsource[2].enabled > 0.0)
   {
      d = distance(eyepos, lightsource[2].pos);   
      a = (lightsource[2].kc + d * (lightsource[2].kl + lightsource[2].kq * d));
      a = (a > 1.0) ? (1.0 / a) : 1.0;
      
      diffuse += a * lightsource[2].diffuse;   
      ambient += a * lightsource[2].ambient;
   }

   if(lightsource[3].enabled > 0.0)
   {
      d = distance(eyepos, lightsource[3].pos);   
      a = (lightsource[3].kc + d * (lightsource[3].kl + lightsource[3].kq * d));
      a = (a > 1.0) ? (1.0 / a) : 1.0;
      
      diffuse += a * lightsource[3].diffuse;   
      ambient += a * lightsource[3].ambient;
   }

   ambient += globalambient;
}
