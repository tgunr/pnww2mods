#version 120

#define LINEAR_FOG

// 1.442695 = 1 / ln(2)
const float LOG2E = 1.442695;

vec4 fogThis(in vec4 color)
{
#ifdef LINEAR_FOG
	float fog = (gl_Fog.end - gl_FogFragCoord) * gl_Fog.scale;
	fog = clamp(fog, 0.0, 1.0);
	return mix(gl_Fog.color, color, fog);
#else
	// exp(x) = exp2(x / ln(2));
	float fog = exp2(-gl_Fog.density * gl_FogFragCoord * LOG2E);
	fog = clamp(fog, 0.0, 1.0);
	
	return mix(gl_Fog.color, color, fog);
#endif
}
