#version 120

uniform sampler2D src1;
uniform sampler2D src2;

varying vec3 N;
varying vec3 vertexpos;

vec4 fogThis(in vec4);
void lightGetSunAmbientDiffuseSpecular(in vec3 normal,
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
	vec3 v = normalize(-vertexpos);
	vec3 n = normalize(N);
	
	lightGetSunAmbientDiffuseSpecular(n, 
	                                  v, 
	                                  ambient, 
	                                  diffuse, 
	                                  specular);

	ambient += gl_LightModel.ambient;
	
	specular *= Ks;
	ambient *= gl_FrontMaterial.ambient;
	ambient *= occ;
	
	vec4 color = base * (diffuse + ambient + specular);
	
	gl_FragColor = fogThis(color);
	gl_FragColor.w = base.a;
}
