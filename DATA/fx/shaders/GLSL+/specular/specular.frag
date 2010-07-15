#version 150

uniform sampler2D src1;
uniform sampler2D src2;

uniform vec4 Ka;
uniform vec4 globalambient;
uniform float shininess;

in vec3 N;
in vec3 V;
in vec2 tex0;

out vec4 out_color;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuseSpecular(in vec3 normal,
						            in vec3 V,
                                    in float shininess,
                                    out vec4 ambient,
                                    out vec4 diffuse,
                                    out vec4 specular);
void main()
{
	vec4 base = texture2D(src1, tex0);
	float Ks = texture2D(src2, tex0).r;
	float occ = texture2D(src2, tex0).g;
	
	vec4 diffuse;
	vec4 specular;
	vec4 ambient;
	
	// These values are interpolated and need to be normalized
	vec3 v = normalize(-V);
	vec3 n = normalize(N);
	
	lightGetAmbientDiffuseSpecular(n, 
	                               v, 
                                   shininess,
	                               ambient, 
	                               diffuse, 
	                               specular);

	ambient += globalambient;
	
	specular *= Ks;
	ambient *= Ka;
	ambient *= occ;
	
	vec4 color = base * (diffuse + ambient + specular);
	
	out_color = fogThis(color);
	out_color.w = base.a;
}
