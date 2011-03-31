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
in vec2 tex0;

out vec4 out_color;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3 normal,
                            out vec4 ambient,
                            out vec4 diffuse);

void main()
{
	vec4 base = texture2D(src1, tex0);
	
	vec4 diffuse;
	vec4 ambient;
	
	// These values are interpolated and need to be normalized
	vec3 n = normalize(N);

	lightGetAmbientDiffuse(n, ambient, diffuse); 

	vec4 c =  base * (diffuse * b_Kd + ambient * b_Ka);

	out_color = fogThis(c);
	out_color.w = base.a;
}
