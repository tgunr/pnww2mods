#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform sampler2D src1;

uniform MaterialBlock
{
	vec4 b_Kd;
	vec4 b_Ka;
	vec4 b_Ks;
	vec4 b_Ke;
	float b_shininess;
};

in vec3 N;
in vec3 eyepos;
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

	vec3 n = normalize(N);
	vec3 v = normalize(-eyepos);
	
	vec4 amb;
	vec4 dif;
	vec4 spec;
	
	lightGetAmbientDiffuseSpecular(n, v, b_shininess, amb, dif, spec);
	
	vec4 color = base * (dif + amb * b_Ka + spec * b_Ks);

    out_color = fogThis(color);
}
