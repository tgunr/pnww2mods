#version 150

uniform sampler2D src1;
uniform sampler2D src2;
uniform sampler2D src3;

uniform vec4 Ka;
uniform float shininess;

in vec3 T;
in vec3 B;
in vec3 N;
in vec3 V;
in vec2 tex0;

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
	vec3 normal = texture2D(src2, tex0).rgb * 2.0 - 1.0;
	float spec = texture2D(src3, tex0).r;
	
	normal.z = sqrt(1.0 - normal.x * normal.x - normal.y * normal.y);

	// These values are interpolated and need to be normalized
	vec3 t = normalize(T);
	vec3 b = normalize(B);
	vec3 n = normalize(N);
	vec3 v = normalize(-V);
	
	vec4 diffuse;
	vec4 ambient;
	vec4 specular;

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
	specular.rgb *= spec;
	
	vec4 color = base * (diffuse + ambient + specular);
		
	out_color = fogThis(color);
	out_color.w = base.a;
}
