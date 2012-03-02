#version 120

uniform sampler2D map_kd;
uniform sampler2D map_ka;
uniform sampler2D map_ks;
uniform sampler2D map_bump;

varying vec3 T;
varying vec3 B;
varying vec3 N;
varying vec3 vertexpos;

vec4 fogThis(in vec4);
void lightGetSunAmbientDiffuseSpecular(mat3 tbn,
                                       in vec3 V,
                                       in vec3 normal,
                                       out vec4 ambient, 
                                       out vec4 diffuse,
                                       out vec4 specular);

void main()
{
	vec4 kd = texture2D(map_kd, gl_TexCoord[0].xy);
    vec4 ka = texture2D(map_ka, gl_TexCoord[0].xy);
    vec4 ks = texture2D(map_ks, gl_TexCoord[0].xy);
	vec3 bump = texture2D(map_bump, gl_TexCoord[0].xy).rgb * 2.0 - 1.0;
	
	bump.z = sqrt(1.0 - bump.x * bump.x - bump.y * bump.y);
	
	vec4 diffuse;
	vec4 specular;
	vec4 ambient;
	
	// These values are interpolated and need to be normalized
	vec3 v = normalize(-vertexpos);
	vec3 t = normalize(T);
	vec3 b = normalize(B);
	vec3 n = normalize(N);

    mat3 tbn = mat3(t, b, n);

	lightGetSunAmbientDiffuseSpecular(tbn,
	                                  v, 
	                                  bump, 
	                                  ambient, 
	                                  diffuse, 
	                                  specular);

	ambient += gl_LightModel.ambient;
	ambient *= (gl_FrontMaterial.ambient * ka);
	
	specular *= (gl_FrontMaterial.specular * ks);
	diffuse *= gl_FrontMaterial.diffuse;

	vec4 color = kd * (diffuse + specular + ambient);
	 	
	gl_FragColor = fogThis(color);
}
