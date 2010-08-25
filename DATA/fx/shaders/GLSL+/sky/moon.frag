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

	ambient *= Ka;
	diffuse *= Kd;

	vec4 c =  base * (diffuse + ambient);

	out_color = c;
}
