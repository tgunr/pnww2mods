#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform sampler2D src1;
uniform sampler2D src2;
uniform sampler2D src3;

uniform MaterialBlock
{
	vec4 Kd;
	vec4 Ka;
	vec4 Ks;
	vec4 Ke;
	float shininess;
};

in vec3 T;
in vec3 B;
in vec3 N;
in vec3 V;
in vec2 tex0;
in float alphatest;

out vec4 out_color;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuseSpecular(in vec3 t,
                                    in vec3 b,
                                    in vec3 n,
                                    in vec3 V,
                                    in vec3 normal,
                                    in float shininess,
                                    out vec4 ambient, 
                                    out vec4 diffuse,
                                    out vec4 specular);

void main()
{
	vec4 base = texture2D(src1, tex0);

    // Alpha test
    if(base.a <= alphatest)
        discard;

	vec3 normal = texture2D(src2, tex0).rgb * 2.0 - 1.0;
	float Ks = texture2D(src3, tex0).r;
	float occ = texture2D(src3, tex0).g;
	
	normal.z = sqrt(1.0 - normal.x * normal.x - normal.y * normal.y);
	
	vec4 diffuse;
	vec4 specular;
	vec4 ambient;
	
	// These values are interpolated and need to be normalized
	vec3 v = normalize(-V);
	vec3 t = normalize(T);
	vec3 b = normalize(B);
	vec3 n = normalize(N);

	lightGetAmbientDiffuseSpecular(t, 
	                               b, 
	                               n, 
	                               v,
	                               normal, 
                                   shininess,
	                               ambient, 
	                               diffuse, 
	                               specular);

	ambient *= Ka;
	ambient *= occ;
	diffuse *= Kd;
	specular.rgb *= Ks;
	
	vec4 color =  base * (diffuse + specular + ambient);
	 	
	out_color = fogThis(color);
	out_color.w = base.a;
}
