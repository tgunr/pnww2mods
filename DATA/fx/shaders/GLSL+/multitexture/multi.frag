#version 150

uniform sampler2D src1;
uniform sampler2D src2;
uniform sampler2D src3;

uniform vec4 globalambient;
uniform vec4 Ka;
uniform vec4 Kd;
uniform vec4 Ks;
uniform float shininess;

in vec3 V;
in vec3 N;
in vec2 tex0;
in vec2 tex1;
in vec2 tex2;

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
	vec4 col1 = texture2D(src2, tex1);
	vec4 col2 = texture2D(src3, tex2);

    vec4 m = base * col1 * col2;

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
	ambient *= Ka;
	diffuse *= Kd;
    specular *= Ks;

	vec4 color =  m * (diffuse + specular + ambient);
	 	
	out_color = fogThis(color);
	out_color.w = base.a;
}
