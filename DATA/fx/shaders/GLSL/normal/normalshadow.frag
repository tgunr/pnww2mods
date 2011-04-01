#version 120

uniform sampler2D src1;
uniform sampler2D src2;
uniform sampler2D src3;
uniform sampler2DShadow src4;

uniform float scale;
uniform vec3 shadowambient;

varying vec3 T;
varying vec3 B;
varying vec3 N;
varying vec3 V;

vec4 fogThis(in vec4);
void lightSetVertexPos(in vec3);
void lightGetAmbientDiffuseSpecular(in vec3 t,
                                    in vec3 b,
                                    in vec3 n,
                                    in vec3 V,
                                    in vec3 normal,
                                    out vec4 ambient, 
                                    out vec4 diffuse,
                                    out vec4 specular);

void main()
{
	vec4 base = texture2D(src1, gl_TexCoord[0].xy);
	vec3 normal = texture2D(src2, gl_TexCoord[0].xy).rgb * 2.0 - 1.0;
	float Ks = texture2D(src3, gl_TexCoord[0].xy).r;
	float occ = texture2D(src3, gl_TexCoord[0].xy).g;
	
	normal.z = sqrt(1.0 - normal.x * normal.x - normal.y * normal.y);
	
	vec4 diffuse;
	vec4 specular;
	vec4 ambient;
	
	// These values are interpolated and need to be normalized
	vec3 v = normalize(-V);
	vec3 t = normalize(T);
	vec3 b = normalize(B);
	vec3 n = normalize(N);

	lightSetVertexPos(V);
	lightGetAmbientDiffuseSpecular(t, 
	                               b, 
	                               n, 
	                               v, 
	                               normal, 
	                               ambient, 
	                               diffuse, 
	                               specular);
	lightSetVertexPos(vec3(0, 0, 0));

	ambient += gl_LightModel.ambient;
	ambient *= gl_FrontMaterial.ambient;
	ambient *= occ;
	
	specular.rgb *= Ks;
	
	vec4 color =  base * (diffuse + specular + ambient);
	 	
    vec3 c1 = gl_TexCoord[1].xyz / gl_TexCoord[1].w;

	vec4 s1 = shadow2D(src4, c1);

    s1.rgb = clamp(s1.rgb + shadowambient, 0.0, 1.0);
    color.rgb *= s1.rgb;

	gl_FragColor = fogThis(color);
	gl_FragColor.w = base.a;
}
