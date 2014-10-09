#version 120

uniform sampler2D src2;
uniform sampler2D refl;
uniform sampler2D surf;

varying vec3 vertexpos;
varying vec3 T;
varying vec3 B;
varying vec3 N;

void lightGetAmbientDiffuseSpecular(in vec3,
                                    in vec3,
                                    in vec3,
                                    in vec3,
                                    in vec3,
                                    out vec4, 
                                    out vec4,
                                    out vec4);

vec4 fogThis(in vec4);

const vec4 ocolor = vec4(0.3960784, 0.549019607, 0.7058823529, 1.0);

void main()
{
	vec3 t0 = texture2D(src2, gl_TexCoord[0].zw).rgb;
	vec3 t1 = texture2D(src2, gl_TexCoord[1].xy).rgb;
	vec3 t2 = texture2D(src2, gl_TexCoord[1].zw).rgb;
	
	vec3 mapN = 2.0 * (t0 + t1 + t2) - 3.0;;
	mapN.z = sqrt(1.0 - mapN.x * mapN.x - mapN.y * mapN.y);
	
	vec3 m = normalize(mapN);
				
	vec4 coords = gl_TexCoord[2];
	coords.xy += mapN.xy;

	// Reflect the environment
	vec4 t3 = texture2DProj(refl, coords);
	vec4 t4 = texture2DProj(surf, coords);
	
	vec4 diffuseColor;
	vec4 specularColor;
	vec4 ambientColor;
	
	// These values are interpolated and need to be normalized
	vec3 v = normalize(-vertexpos);
	vec3 t = normalize(T);
	vec3 b = normalize(B);
	vec3 n = normalize(N);
		
	lightGetAmbientDiffuseSpecular(t, 
	                               b, 
	                               n, 
	                               v, 
	                               m, 
	                               ambientColor, 
	                               diffuseColor, 
	                               specularColor);

	ambientColor += gl_LightModel.ambient;
	
	specularColor *= gl_FrontMaterial.specular;
	diffuseColor *= ocolor;
	ambientColor *= gl_FrontMaterial.ambient;

	float facing = max(dot(n, v), 0.0);
	
	// Reflect less if closer to water. 	
	vec4 color = mix(t3, ocolor, facing);

	color.rgb += t4.rgb;

	color = color * (diffuseColor + ambientColor) + specularColor;

	gl_FragColor = fogThis(color);
}
