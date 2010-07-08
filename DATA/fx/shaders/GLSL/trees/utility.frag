#define EXP_FOG

uniform vec4 fogColor;

vec4 fogThis(float fog, vec4 color)
{
#ifdef LINEAR_FOG
	return mix(color, fogColor, fog);
#else
	float factor = exp(fog);
	return mix(fogColor, color, factor);
#endif
}
