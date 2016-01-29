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

in vec2 tex0;

out vec4 out_color;

void lightGetAmbientDiffuse(out vec4 ambient,
                            out vec4 diffuse);

void main()
{
	vec4 base = texture2D(src1, tex0);

	vec4 diffuse;
	vec4 ambient;
	
	lightGetAmbientDiffuse(ambient, diffuse);

	vec4 c =  base * (diffuse * b_Kd + ambient * b_Ka);

	out_color = c;
}
