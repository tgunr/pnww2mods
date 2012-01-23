#version 120

uniform sampler2D src1;
uniform sampler2D src2;
uniform sampler2D refl;
uniform sampler2D surf;
uniform sampler2D src3;
uniform sampler2D scene;

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

void main()
{
	vec4 base = texture2D(src1, gl_TexCoord[0].xy);

	vec4 t0 = texture2D(src2, gl_TexCoord[1].xy) * 2.0 - 1.0;
	vec4 t1 = texture2D(src2, gl_TexCoord[1].zw) * 2.0 - 1.0;
	
	vec4 mapN = t0 + t1;
    mapN.z = sqrt(1.0 - mapN.x * mapN.x - mapN.y * mapN.y);

	vec3 m = normalize(mapN.rgb);
				
	vec4 coords = gl_TexCoord[2];

	coords.xy += mapN.xy;

	// Reflect the environment
	vec4 t3 = texture2DProj(refl, coords);
	vec4 rf = texture2DProj(scene, coords);
    vec4 t4 = texture2DProj(surf, gl_TexCoord[2]);
	
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
	diffuseColor *= base;
	ambientColor *= gl_FrontMaterial.ambient;

	float facing = max(dot(n, v), 0.0);
	
    vec4 h = texture2D(src3, gl_TexCoord[3].xy);
	
    // Reflect less if closer to water. 	
	vec4 color = mix(t3, base, facing);

	color = color * (diffuseColor + ambientColor) + specularColor;

    color = mix(rf, color, h.r + 1.0 - facing);
    color.rgb += t4.rgb * 0.5;

	gl_FragColor = fogThis(color);
}
