#version 120

#define EXP_FOG

uniform vec4 fogParams;
uniform vec4 fogColor;

float fogValue(float dist)
{
#ifdef LINEAR_FOG
	float fogstart = fogParams.x;
	float fogend = fogParams.y;
	
	return clamp(fogend - dist / (fogend - fogstart), 0.0, 1.0);
#endif

#ifdef EXP_FOG
	float density = fogParams.z;
	
	return -density * dist;
#endif

#ifdef EXP_FOG2
	float density = fogParams.z;
	float exp2fog = density * dist;
	float exp2fog *= exp2fog;
	
	return -exp2fog;
#endif
}
