#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MaterialBlock
{
	vec4 b_Kd;
	vec4 b_Ka;
	vec4 b_Ks;
	vec4 b_Ke;
	float b_shininess;
};

in vec3 eyepos;
in vec3 N;

out vec4 out_color;

void lightGetAmbientDiffuseSpecular(in vec3 normal,
                                    in vec3 V,
                                    in float shininess,
                                    out vec4 ambient,
                                    out vec4 diffuse,
                                    out vec4 specular);

void main()
{
	vec4 diffuse;
	vec4 specular;
	vec4 ambient;
	
	// These values are interpolated and need to be normalized
	vec3 v = normalize(-eyepos);
	vec3 n = normalize(N);

	lightGetAmbientDiffuseSpecular(n, 
	                               v, 
	                               b_shininess, 
	                               ambient, 
	                               diffuse, 
	                               specular);

	out_color = diffuse * b_Kd + specular * b_Ks + ambient * b_Ka;
}
