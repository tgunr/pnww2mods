uniform sampler2D src1;

uniform vec4 Ka;
uniform vec4 Kd;

in vec2 tex0;

out vec4 out_color;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(out vec4 amb, out vec4 dif);

void main()
{
	vec4 base = texture2D(src1, tex0);

    if(base.a <= 0.329417)
        discard;

	vec4 amb;
	vec4 dif;
	
	lightGetAmbientDiffuse(amb, dif);

    amb *= Ka;
    dif *= Kd;

	vec4 color = base * (amb + dif);

	out_color = fogThis(color);
	out_color.a = base.a;
}
