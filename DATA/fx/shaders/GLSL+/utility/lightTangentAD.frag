#version 150
#extension GL_ARB_uniform_buffer_object : enable

// NVIDIA drivers go stupid on UBO arrays...this is a workaround.
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

uniform LightBlock1
{
    float b_enabled1;
    float b_kc1;
    float b_kl1;
    float b_kq1;
    vec3 b_dir1;
    vec3 b_pos1;
    vec4 b_diffuse1;
    vec4 b_ambient1;
    vec4 b_specular1;
};

uniform LightBlock2
{
    float b_enabled2;
    float b_kc2;
    float b_kl2;
    float b_kq2;
    vec3 b_dir2;
    vec3 b_pos2;
    vec4 b_diffuse2;
    vec4 b_ambient2;
    vec4 b_specular2;
};

uniform LightBlock3
{
    float b_enabled3;
    float b_kc3;
    float b_kl3;
    float b_kq3;
    vec3 b_dir3;
    vec3 b_pos3;
    vec4 b_diffuse3;
    vec4 b_ambient3;
    vec4 b_specular3;
};

uniform AmbientBlock
{
    vec4 b_globalambient;
};

const vec4 diffusezero = vec4(0, 0, 0, 0);
const vec4 ambientzero = vec4(0, 0, 0, 0);

in vec3 eyepos;

void lightGetAmbientDiffuse(in vec3 t,
                            in vec3 b,
                            in vec3 n,
                            in vec3 normal,
                            out vec4 ambient, 
                            out vec4 diffuse)
{
    vec3 Ltan;
    float d;
   
    float a;
   
    ambient = ambientzero;
    diffuse = diffusezero;

    if(b_enabled0 > 0.0)
    {
        Ltan.x = dot(b_dir0, t);
        Ltan.y = dot(b_dir0, b);
        Ltan.z = dot(b_dir0, n);

        d = max(dot(normal, Ltan), 0.0);

        diffuse += d * b_diffuse0;   
        ambient += b_ambient0;
    }

    if(b_enabled1 > 0.0)
    {
        Ltan.x = dot(b_dir1, t);
        Ltan.y = dot(b_dir1, b);
        Ltan.z = dot(b_dir1, n);

        d = max(dot(normal, Ltan), 0.0);

        diffuse += d * b_diffuse1;   
        ambient += b_ambient1;
    }

    if(b_enabled2 > 0.0)
    {
        d = distance(eyepos, b_pos2);   
        a = 1.0 / clamp((b_kc2 + d * (b_kl2 + b_kq2 * d)), 1.0, 10000.0);

        Ltan.x = dot(b_dir2, t);
        Ltan.y = dot(b_dir2, b);
        Ltan.z = dot(b_dir2, n);

        d = max(dot(normal, Ltan), 0.0);

        diffuse += a * d * b_diffuse2;   
        ambient += a * b_ambient2;
    }

    if(b_enabled3 > 0.0)
    {
        d = distance(eyepos, b_pos3);   
        a = 1.0 / clamp((b_kc3 + d * (b_kl3 + b_kq3 * d)), 1.0, 10000.0);

        Ltan.x = dot(b_dir3, t);
        Ltan.y = dot(b_dir3, b);
        Ltan.z = dot(b_dir3, n);

        d = max(dot(normal, Ltan), 0.0);

        diffuse += a * d * b_diffuse3;   
        ambient += a * b_ambient3;
    }

    ambient += b_globalambient;
}
