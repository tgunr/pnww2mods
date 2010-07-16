#version 150
#extension GL_ARB_uniform_buffer_object : enable

#define LINEAR_FOG

uniform struct
{
   float end;
   float scale; // 1 / (end - start)
   vec4 color;
} fogparams;


// 1.442695 = 1 / ln(2)
const float LOG2E = 1.442695;

in float fogdist;

vec4 fogThis(in vec4 color)
{
#ifdef LINEAR_FOG
   float f = (fogparams.end - fogdist) * fogparams.scale;
   f = clamp(f, 0.0, 1.0);
   return mix(fogparams.color, color, f);
#else
   // exp(x) = exp2(x / ln(2));
   //float fog = exp2(-gl_Fog.density * gl_FogFragCoord * LOG2E);
   //fog = clamp(fog, 0.0, 1.0);
   
   //return mix(gl_Fog.color, color, fog);
#endif
}
