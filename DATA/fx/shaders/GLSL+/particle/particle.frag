#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MaterialBlock
{
	vec4 Kd;
	vec4 Ka;
	vec4 Ks;
	vec4 Ke;
	float shininess;
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

	diffuse *= Kd;
	ambient *= Ka;
	
    diffuse.rgb *= color.rgb;

	out_color = map * (diffuse + ambient + Ke);
	out_color.a = map.a * color.a;
}
