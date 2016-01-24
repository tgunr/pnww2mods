#version 120

uniform sampler2D src1;

varying vec3 N;
varying vec3 vertexpos;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuseSpecular(in vec3 normal,
							        in vec3 V,
                                    out vec4 ambient,
                                    out vec4 diffuse,
                                    out vec4 specular);

void main()
{
	vec4 base = texture2D(src1, gl_TexCoord[0].xy);

	vec3 n = normalize(N);
	vec3 v = normalize(-vertexpos);
	
	vec4 amb;
	vec4 dif;
	vec4 spec;
	
	lightGetAmbientDiffuseSpecular(n, v, amb, dif, spec);
	
	amb += gl_LightModel.ambient;
	amb *= gl_FrontMaterial.ambient;
	spec *= gl_FrontMaterial.specular;
	
	vec4 color = base * (dif + amb + spec);
	
	gl_FragColor = fogThis(color);
	gl_FragColor.a = base.a;
}
