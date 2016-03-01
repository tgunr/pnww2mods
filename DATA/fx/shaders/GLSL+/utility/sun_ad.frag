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

uniform MaterialBlock
{
	vec4 b_Kd;
	vec4 b_Ka;
	vec4 b_Ks;
	vec4 b_Ke;
	float b_shininess;
};

uniform AmbientBlock
{
    vec4 b_globalambient;
};

void sun_ad(in vec3 normal, out vec4 ambient, out vec4 diffuse)
{
    float d;
   
    d = max(dot(normal, b_dir0), 0.0);

    diffuse = d * b_diffuse0 * b_Kd;   
    ambient = (b_ambient0 + b_globalambient) * b_Ka;
}
