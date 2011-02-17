#version 120

uniform sampler2D src1;
uniform sampler2D src2;
uniform sampler2D src3;

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
	float spec = texture2D(src3, gl_TexCoord[0].xy).r;
	
    // These values are interpolated and need to be normalized
	vec3 t = normalize(T);
	vec3 b = normalize(B);
	vec3 n = normalize(N);
	vec3 v = normalize(-V);
	
	vec4 diffuseColor;
	vec4 ambientColor;
	vec4 specularColor;

	lightSetVertexPos(V);
	lightGetAmbientDiffuseSpecular(t, 
	                               b, 
	                               n, 
	                               v, 
	                               normal, 
	                               ambientColor, 
	                               diffuseColor, 
	                               specularColor);
	lightSetVertexPos(vec3(0, 0, 0));

	ambientColor += gl_LightModel.ambient;
	
	ambientColor *= gl_FrontMaterial.ambient;
    specularColor *= gl_FrontMaterial.specular;
	specularColor.rgb *= spec;

	vec4 color = base * (diffuseColor + ambientColor + specularColor);
		
	gl_FragColor = fogThis(color);
	gl_FragColor.w = base.a;
}
