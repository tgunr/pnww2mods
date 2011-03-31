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
uniform sampler2D src3;

uniform float diffuseScale;

in vec3 T;
in vec3 B;
in vec3 N;
in vec2 tex0;
in vec4 tex1;
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

    vec4 normal = texture2D(src2, tex1.xy) * 2.0 - 1.0;
    vec4 detail = texture2D(src3, tex1.zw);

    base.rgb = mix(base.rgb, detail.rgb, detail.a);

    // Interpolated values need to be normalized
    vec3 t = normalize(T);
    vec3 b = normalize(B);
    vec3 n = normalize(N);
   
    vec4 diffuse;
    vec4 ambient;

    lightGetAmbientDiffuse(t, b, n, normal.xyz, ambient, diffuse);
     
    vec4 color = base * (diffuse * diffuseScale * b_Kd + ambient * b_Ka);

    out_color = fogThis(color);
}
