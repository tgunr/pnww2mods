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

uniform sampler2D diffuse;
uniform sampler2D detailmap;

uniform float diffuseScale;

in vec2 tex0;
in vec4 tex1;
in float alphatest;
in vec3 N;

out vec4 out_color;

const vec4 defaultcolor = vec4(0);

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3, out vec4, out vec4);

void main()
{ 
    vec4 base = texture2D(diffuse, tex0);

    out_color = defaultcolor;

    if(base.a > alphatest)
    {
        vec3 n = normalize(N);

        vec4 detail = texture2D(detailmap, tex1.zw);

        base.rgb = mix(base.rgb, detail.rgb, detail.a);
  
        vec4 diffuse;
        vec4 ambient;

        lightGetAmbientDiffuse(n, ambient, diffuse);
     
        vec4 color = base * (diffuse * diffuseScale * b_Kd + ambient * b_Ka);

        out_color = fogThis(color);
    }
}
