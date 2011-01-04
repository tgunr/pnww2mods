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

in float alphatest;

in vec2 tex0;

out vec4 out_color;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(out vec4 amb, out vec4 dif);

void main()
{
	vec4 base = texture2D(src1, tex0);

    if(base.a <= alphatest)
        discard;

	vec4 amb;
	vec4 dif;
	
	lightGetAmbientDiffuse(amb, dif);

    dif *= Kd;

	vec4 color = base * (amb + dif);

	out_color = fogThis(color);
}
