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
uniform sampler2D src2;

in vec2 tex0;
in vec3 N;
in vec3 T;
in vec3 B;
in vec3 vertexpos;
in float diffcoef;
in float alphatest;

out vec4 out_color;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3, 
                            in vec3, 
                            in vec3, 
                            in vec3, 
                            out vec4, 
                            out vec4);

void main()
{
    vec4 base = texture2D(src1, tex0);

    if(base.a < alphatest)
        discard;

    vec4 normal = texture2D(src2, tex0) * 2.0 - 1.0;
      
    vec4 diffuse;
    vec4 ambient;

    // Interpolated values need to be normalized
    vec3 t = normalize(T);
    vec3 b = normalize(B);
    vec3 n = normalize(N);

    lightGetAmbientDiffuse(t, b, n, normal.xyz, ambient, diffuse);

    vec4 color = base * (diffuse * b_Kd * diffcoef + ambient * b_Ka);
   
    out_color = fogThis(color);
    out_color.a = base.a;
}
