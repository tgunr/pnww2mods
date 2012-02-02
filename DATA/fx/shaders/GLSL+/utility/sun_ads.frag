#version 150
#extension GL_ARB_uniform_buffer_object : enable

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

uniform MaterialBlock
{
	vec4 b_Kd;
	vec4 b_Ka;
	vec4 b_Ks;
	vec4 b_Ke;
	float b_shininess;
};

void sun_abs(in vec3 normal,
             in vec3 V,
             out vec4 ambient,
             out vec4 diffuse,
             out vec4 specular)
{
    vec3 H;
    float d;
    float s;

    d = max(dot(normal, b_dir0), 0.0);

    diffuse = d * b_diffuse0 * b_Kd;

    H = normalize(b_dir0 + V);
    s = max(dot(normal, H), 0.0);
    s = pow(s, b_shininess);

    specular = s * b_specular0 * b_Ks;

    ambient = b_ambient0 + b_globalambient * b_Ka;
}
