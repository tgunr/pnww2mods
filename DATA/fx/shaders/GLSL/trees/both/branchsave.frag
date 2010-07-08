#define USE_NORMAL_MAP
//#undef USE_NORMAL_MAP

#define USE_SHADOW_MAP
//#undef USE_SHADOW_MAP

uniform sampler2D diffuse;

#ifdef USE_NORMAL_MAP
uniform sampler2D normalmap;
#endif // USE_NORMAL_MAP

#ifdef USE_SHADOW_MAP
uniform sampler2D shadowmap;
#endif // USE_SHADOW_MAP

uniform float diffuseScale;

varying float fog;
varying vec4 globalambient;
varying vec3 Ltan;

vec4 getLightDiffuse();
vec4 fogThis(float, vec4);

void main()
{ 
	vec4 diffuseColor = texture2D(diffuse, gl_TexCoord[0].xy);
	
#ifdef USE_NORMAL_MAP
	vec4 normalColor = texture2D(normalmap, gl_TexCoord[1].xy) * 2.0 - 1.0;
#endif

#ifdef USE_SHADOW_MAP
	vec4 shadowColor = texture2D(shadowmap, gl_TexCoord[2].xy);
#endif

#ifdef USE_NORMAL_MAP
	/* Saturate */
	float sunlight = clamp(dot(normalColor.rgb, Ltan.xyz), 0.0, 1.0);
	/* Lightscale unique per branch */
	sunlight *= diffuseScale;
#endif

	vec4 ambient = globalambient * diffuseColor;
	
	/* Get total color for this fragment */
	vec4 outcolor;
	outcolor.a = 1.0;
	
#ifdef USE_NORMAL_MAP
	outcolor.rgb = diffuseColor.rgb * sunlight * getLightDiffuse().rgb + ambient.rgb;
#else
	outcolor.rgb = gl_TexCoord[4].rgb * diffuseColor.rgb * diffuseScale + ambient.rgb;
#endif

#ifdef USE_SHADOW_MAP
	outcolor.rgb *= shadowColor.rgb;
#endif

	gl_FragColor = fogThis(fog, outcolor);
	gl_FragColor.a = diffuseColor.a;
}
