uniform sampler2D src1;
uniform sampler2D src2;
uniform sampler2D src3;

varying vec3 V;
varying vec3 N;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuseSpecular(in vec3 normal,
                                    in vec3 V,
                                    out vec4 ambient, 
                                    out vec4 diffuse,
                                    out vec4 specular);

void main()
{
	vec4 mask = texture2D(src1, gl_TexCoord[0].xy);
	vec4 lay1 = texture2D(src2, gl_TexCoord[1].xy);
	vec4 lay2 = texture2D(src3, gl_TexCoord[2].xy);

	vec4 m = mask.r * lay2 + (1.0 - mask.r) * lay1;
	
	vec4 diffuseColor;
	vec4 specularColor;
	vec4 ambientColor;

	// These values are interpolated and need to be normalized
	vec3 v = normalize(-V);
	vec3 n = normalize(N);

	lightGetAmbientDiffuseSpecular(n, 
	                               v, 
	                               ambientColor, 
	                               diffuseColor, 
	                               specularColor);

	ambientColor += gl_LightModel.ambient;
	
	specularColor *= gl_FrontMaterial.specular;
	diffuseColor *= gl_FrontMaterial.diffuse;
	ambientColor *= gl_FrontMaterial.ambient;

	vec4 color = m * (diffuseColor + ambientColor) + specularColor;
	
	gl_FragColor = fogThis(color);
}
