#version 150

uniform sampler2D src1;

uniform vec4 Ka;
uniform vec4 Kd;
uniform vec4 Ks;
uniform float shininess;

in vec3 V;
in vec3 N;
in vec2 tex0;
in float alphatest;

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
	
    // Alpha test
    if(base.a <= alphatest)
        discard;

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

	ambient *= Ka;
	diffuse *= Kd;
    specular *= Ks;

	vec4 c =  base * (diffuse + specular + ambient);

	out_color = fogThis(c);
	out_color.w = base.a;
}
