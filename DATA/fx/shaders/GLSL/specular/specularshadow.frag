#version 120

uniform sampler2D src1;
uniform sampler2D src2;
uniform sampler2DShadow src3;

uniform float scale;
uniform vec3 shadowambient;

varying vec3 N;
varying vec3 V;

vec4 fogThis(in vec4);
void lightSetVertexPos(in vec3);
void lightGetAmbientDiffuseSpecular(in vec3 normal,
						            in vec3 V,
                                    out vec4 ambient,
                                    out vec4 diffuse,
                                    out vec4 specular);
void main()
{
	vec4 base = texture2D(src1, gl_TexCoord[0].xy);
	float Ks = texture2D(src2, gl_TexCoord[0].xy).r;
	float occ = texture2D(src2, gl_TexCoord[0].xy).g;
	
	vec4 diffuse;
	vec4 specular;
	vec4 ambient;
	
	// These values are interpolated and need to be normalized
	vec3 v = normalize(-V);
	vec3 n = normalize(N);
	
	lightSetVertexPos(V);
	lightGetAmbientDiffuseSpecular(n, 
	                               v, 
	                               ambient, 
	                               diffuse, 
	                               specular);
	lightSetVertexPos(vec3(0, 0, 0));

	ambient += gl_LightModel.ambient;
	
	specular *= Ks;
	ambient *= gl_FrontMaterial.ambient;
	ambient *= occ;
	
	vec4 color = base * (diffuse + ambient + specular);
	
    vec3 c1 = gl_TexCoord[1].xyz / gl_TexCoord[1].w;

	vec4 s1 = shadow2D(src3, c1);

    s1.rgb = clamp(s1.rgb + shadowambient, 0.0, 1.0);
    color.rgb *= s1.rgb;

	gl_FragColor = fogThis(color);
	gl_FragColor.w = base.a;
}
