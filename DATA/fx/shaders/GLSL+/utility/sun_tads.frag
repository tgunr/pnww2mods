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

void sun_tads(in vec3 t,
              in vec3 b,
              in vec3 n,
              in vec3 V,
              in vec3 normal,
              out vec4 ambient, 
              out vec4 diffuse,
              out vec4 specular)
{
    vec3 H;
    vec3 Ltan;
    vec3 Htan;
    float d;
    float s;

    Ltan.x = dot(b_dir0, t);
    Ltan.y = dot(b_dir0, b);
    Ltan.z = dot(b_dir0, n);

    d = max(dot(normal, Ltan), 0.0);

    diffuse = d * b_diffuse0 * b_Kd;

    H = normalize(b_dir0 + V);

    // Tangent
    Htan.x = dot(H, t);
    Htan.y = dot(H, b);
    Htan.z = dot(H, n);

    s = max(dot(normal, Htan), 0.0);
    s = pow(s, b_shininess);

    specular = s * b_specular0 * b_Ks;

    ambient = b_ambient0 + b_globalambient * b_Ka;
}
