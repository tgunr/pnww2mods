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

uniform sampler2D diffuse;
uniform sampler2D normalmap;
uniform sampler2D detailmap;

uniform float diffuseScale;

in vec3 T;
in vec3 B;
in vec3 N;
in vec2 tex0;
in vec4 tex1;

out vec4 out_color;

const vec4 defaultcolor = vec4(0);

vec4 fogThis(in vec4);

void main()
{ 
    vec4 base = texture2D(diffuse, tex0);

    out_color = defaultcolor;

    vec4 normal = texture2D(normalmap, tex1.xy) * 2.0 - 1.0;
    vec4 detail = texture2D(detailmap, tex1.zw);

    base.rgb = mix(base.rgb, detail.rgb, detail.a);

    // Interpolated values need to be normalized
    vec3 t = normalize(T);
    vec3 b = normalize(B);
    vec3 n = normalize(N);
   
    vec4 diffuse;
    vec4 ambient;

    vec3 Ltan;
      
    Ltan.x = dot(b_dir0, t);
    Ltan.y = dot(b_dir0, b);
    Ltan.z = dot(b_dir0, n);

    float d = max(dot(normal.rgb, Ltan), 0.0);

    diffuse = d * b_diffuse0;   
    ambient = b_ambient0 + b_globalambient;
     
    vec4 color = base * (diffuse * diffuseScale * b_Kd + ambient * b_Ka);

    out_color = fogThis(color);
}
