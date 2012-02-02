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

uniform LightBlock0
{
    float b_enabled0;
    float b_kc0;
    float b_kl0;
    float b_kq0;
    vec3 b_dir0;
    vec3 b_pos0;
    vec4 b_diffuse0;
    vec4 b_ambient0;
    vec4 b_specular0;
};

uniform AmbientBlock
{
    vec4 b_globalambient;
};

uniform sampler2D src1;

uniform float diffuseScale;

in vec3 N;
in vec2 tex0;
in float alphatest;

out vec4 out_color;

const vec4 defaultcolor = vec4(0, 0, 0, 0);

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3, out vec4, out vec4);

void main()
{
    vec4 base = texture2D(src1, tex0);

    out_color = defaultcolor;

    if(base.a < alphatest)
        discard;

    vec4 diffuse;
    vec4 ambient;

    // Normalize interpolated values
    vec3 n = normalize(N);
  
    float d = max(dot(n, b_dir0), 0.0);

    diffuse = d * b_diffuse0;   
    ambient = b_ambient0 + b_globalambient;

    vec4 color = base * (diffuse * diffuseScale + ambient * b_Ka);

    out_color = fogThis(color);
}
