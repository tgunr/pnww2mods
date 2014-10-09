#version 150

uniform sampler2D map_ka;
uniform sampler2D map_kd;
uniform sampler2D map_ks;
uniform sampler2D map_bump;

in vec3 T;
in vec3 B;
in vec3 N;
in vec3 eyepos;
in vec2 tex0;
in float alphatest;

out vec4 out_color;

vec4 fogThis(in vec4);
void sun_tads(in vec3 t,
              in vec3 b,
              in vec3 n,
              in vec3 V,
              in vec3 normal,
              out vec4 ambient, 
              out vec4 diffuse,
              out vec4 specular);

void main()
{
	vec4 kd = texture(map_kd, tex0);

    if(kd.a < alphatest)
        discard;
    
    vec4 ka = texture(map_ka, tex0);
    vec4 ks = texture(map_ks, tex0);

    vec3 bump = texture(map_bump, tex0).rgb * 2.0 - 1.0;
	
    vec4 diffuse;
    vec4 specular;
    vec4 ambient;
	
    // These values are interpolated and need to be normalized
    vec3 v = normalize(-eyepos);
    vec3 t = normalize(T);
    vec3 b = normalize(B);
    vec3 n = normalize(N);

    sun_tads(t, b, n, v, bump, ambient, diffuse, specular);

    vec4 color = kd * (diffuse + specular * ks + ambient * ka);

    out_color = fogThis(color);
}
