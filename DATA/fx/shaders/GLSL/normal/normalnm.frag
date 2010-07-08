uniform sampler2D src1;
uniform sampler2D src2;
uniform sampler2D src3;

varying vec3 T;
varying vec3 B;
varying vec3 N;
varying vec3 V;

vec4 fogThis(in vec4);
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
	vec3 normal = texture2D(src2, gl_TexCoord[0].xy).agb * 2.0 - 1.0;
	float spec = texture2D(src3, gl_TexCoord[0].xy).r;
	
	normal.z = sqrt(1.0 - normal.x * normal.x - normal.y * normal.y);
			
	float level = gl_FrontMaterial.shininess;
	
	vec4 diffuseColor;
	vec4 specularColor;
	vec4 ambientColor;
	
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
	                               ambientColor, 
	                               diffuseColor, 
	                               specularColor);

	ambientColor += gl_LightModel.ambient;
	
	specularColor *= spec;
	diffuseColor *= base;
	ambientColor *= gl_FrontMaterial.ambient;
		
	vec4 color = base * (diffuseColor + ambientColor + specularColor);
		
	gl_FragColor = fogThis(color);
	gl_FragColor.w = base.a;
}
