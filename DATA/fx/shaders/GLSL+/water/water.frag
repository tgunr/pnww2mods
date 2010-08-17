#version 150

uniform sampler2D src1;
uniform sampler2D src2;
uniform sampler2D refl;
uniform sampler2D surf;

uniform vec4 Ks;
uniform vec4 Ka;
uniform float shininess;

in vec3 V;
in vec3 T;
in vec3 B;
in vec3 N;
in vec2 tex0;
in vec4 tex1;
in vec4 tex2;

out vec4 out_color;

void lightGetAmbientDiffuseSpecular(in vec3,
                                    in vec3,
                                    in vec3,
                                    in vec3,
                                    in vec3,
                                    in float,
                                    out vec4, 
                                    out vec4,
                                    out vec4);
vec4 fogThis(in vec4);                                

void main()
{
	vec4 base = texture2D(src1, tex0);
	
	vec3 t0 = texture2D(src2, tex0).rgb;
	vec3 t1 = texture2D(src2, tex1.xy).rgb;
	vec3 t2 = texture2D(src2, tex1.zw).rgb;
	
	vec3 mapN = 2.0 * (t0 + t1 + t2) - 3.0;;
	mapN.z = sqrt(1.0 - mapN.x * mapN.x - mapN.y * mapN.y);

	vec3 m = normalize(mapN);
		
	vec4 coords = tex2;
	coords.xy += mapN.xy;

	// Reflect the environment
	vec4 t3 = textureProj(refl, coords);
	vec4 t4 = textureProj(surf, coords);

	vec4 diffuse;
	vec4 specular;
	vec4 ambient;
	
	// These values are interpolated and need to be normalized
	vec3 v = normalize(-V);
	vec3 t = normalize(T);
	vec3 b = normalize(B);
	vec3 n = normalize(N);

	lightGetAmbientDiffuseSpecular(t, 
	                               b, 
	                               n, 
	                               v, 
	                               m, 
                                   shininess,
	                               ambient, 
	                               diffuse, 
	                               specular);

	specular *= Ks;
	diffuse *= base;
	ambient *= Ka;

	float facing = max(dot(n, v), 0.0);

	// Reflect less if closer to water. 	
	vec4 color = mix(t3, base, facing);
	color.rgb += t4.rgb;

	color = color * (diffuse + ambient) + specular;

	// Fog factor
	out_color = fogThis(color);
	out_color.w = base.a;
}
