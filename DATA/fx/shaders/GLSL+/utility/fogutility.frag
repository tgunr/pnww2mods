#version 150
#extension GL_ARB_uniform_buffer_object : enable

#define LINEAR_FOG

uniform FogBlock
{
   float b_end;
   float b_scale; // 1 / (end - start)
   vec4 b_fogcolor;
};

// 1.442695 = 1 / ln(2)
const float LOG2E = 1.442695;

in float fogdist;

vec4 fogThis(in vec4 c)
{
#ifdef LINEAR_FOG
    float f = (b_end - fogdist) * b_scale;
    f = clamp(f, 0.0, 1.0);
    return mix(b_fogcolor, c, f);
#else
   // exp(x) = exp2(x / ln(2));
   //float fog = exp2(-gl_Fog.density * gl_FogFragCoord * LOG2E);
   //fog = clamp(fog, 0.0, 1.0);
   
   //return mix(gl_Fog.color, color, fog);
#endif
}
