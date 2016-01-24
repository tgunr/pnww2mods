#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform sampler2D src1;
uniform sampler2D src2;
uniform sampler2D src3;
uniform sampler2D src4;
uniform sampler2D src5;

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
in vec2 tex1;
in vec2 tex2;
in vec2 tex3;
in vec2 tex4;

out vec4 out_color;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3 normal,
                            out vec4 ambient,
                            out vec4 diffuse);

void main()
{
    vec4 c1 = texture2D(src1, tex0);
    vec4 c2 = texture2D(src2, tex1);
    vec4 c3 = texture2D(src3, tex2);
    vec4 c4 = texture2D(src4, tex3);

    vec4 mask = texture2D(src5, tex4);

    vec4 c;
    
    c = (1.0 - mask.r) * c1 + mask.r * c2;
    c = (1.0 - mask.g) * c + mask.g * c3;
    c = (1.0 - mask.b) * c + mask.b * c4;
    c = (1.0 - mask.a) * c + mask.a * vec4(0.0, 0.0, 0.0, 1.0);

    vec4 diffuse;
    vec4 ambient;

    vec3 n = normalize(N);

    lightGetAmbientDiffuse(n, ambient, diffuse); 

    vec4 color =  c * (diffuse * b_Kd + ambient * b_Ka);
    out_color = fogThis(color);
}
