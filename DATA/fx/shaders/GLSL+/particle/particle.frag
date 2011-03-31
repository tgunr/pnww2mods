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

uniform sampler2D src1;

in vec4 color;
in vec2 tex0;

out vec4 out_color;

void lightGetAmbientDiffuse(out vec4 amb, out vec4 dif);

void main()
{
	vec4 map = texture2D(src1, tex0);
	
	vec4 ambient;
	vec4 diffuse;
	
	lightGetAmbientDiffuse(ambient, diffuse);

    diffuse.rgb *= color.rgb;

	out_color = map * (diffuse * b_Kd + ambient * b_Ka + b_Ke);
	out_color.a = map.a * color.a;
}
