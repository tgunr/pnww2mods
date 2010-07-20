#version 150

uniform sampler2D src1;

uniform vec4 globalambient;
uniform vec4 Ka;
uniform vec4 Kd;

in vec2 tex0;

out vec4 out_color;

void lightGetAmbientDiffuse(out vec4 ambient,
                            out vec4 diffuse);

void main()
{
	vec4 base = texture2D(src1, tex0);
	base *= base * base;

	vec4 diffuse;
	vec4 ambient;
	
	lightGetAmbientDiffuse(ambient, diffuse);

    ambient += globalambient;
	ambient *= Ka;
	diffuse *= Kd;

	vec4 c =  base * (diffuse + ambient);

	out_color = c;
}
