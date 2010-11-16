#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform sampler2D src1;

uniform MaterialBlock
{
	vec4 Kd;
	vec4 Ka;
	vec4 Ks;
	vec4 Ke;
	float shininess;
};

in vec3 eyepos;
in vec3 N;
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
	
    // Alpha test
    if(base.a <= 0.32941176)
        discard;

	vec4 diffuse;
	vec4 specular;
	vec4 ambient;
	
	// These values are interpolated and need to be normalized
	vec3 v = normalize(-eyepos);
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

    vec4 light = diffuse + specular + ambient;
    light.a = clamp(light.a, 0.0, 1.0);

	vec4 c = base * light;

	out_color = fogThis(c);
}
