uniform sampler2D src1;
uniform sampler2D src2;
uniform sampler2D refl;

uniform mat4 rotation;

varying vec3 Ltan;
varying vec3 Vtan;
varying vec3 Htan;
varying float facing;
varying float fogFactor;

vec4 fogThis(float, vec4);
vec4 getLightDiffuse();
vec4 getLightSpecular();
vec4 getLightAmbient();

void main()
{
	vec4 base = texture2D(src1, gl_TexCoord[0].xy);
	
	vec4 t0 = texture2D(src2, gl_TexCoord[0].xy);
	vec4 t1 = texture2D(src2, gl_TexCoord[1].xy);
	vec4 t2 = texture2D(src2, gl_TexCoord[1].zw);
	
	vec4 N = 2.0 * (t0 + t1 + t2) - 3.0;;
	
	// These values are interpolated and need to be normalized
	vec3 V = normalize(Vtan);
	vec3 L = normalize(Ltan);
	vec3 H = normalize(Htan);

	vec3 m = normalize(N.xyz);

	vec4 coords = gl_TexCoord[2];
	
	coords.xy += N.xy;

	// Reflect the environment
	vec4 t3 = texture2DProj(refl, coords) * base;
	
	float diffuse = max(dot(m, L), 0.0);
	float level = gl_FrontMaterial.shininess;
	
	float specular = 0.0;
	
	if(diffuse > 0.0)
	{
		specular = max(dot(m.xyz, H), 0.0);
		specular = pow(specular, level);
	}
	
	vec4 ka = gl_FrontMaterial.ambient;
	vec4 kd = gl_FrontMaterial.diffuse;
	vec4 ks = gl_FrontMaterial.specular;
	
	// Returns the correct light for a specific pass
	vec4 lightdiffuse = getLightDiffuse();
	vec4 lightspecular = getLightSpecular();
	vec4 lightambient = getLightAmbient();
	
	vec4 diffusecolor = diffuse * kd * lightdiffuse;
	vec4 specularcolor = specular * ks * lightspecular;

	// Refract at close range. Reflect at far range.
	vec4 color = mix(t3, base, facing);
	
	color *= (diffusecolor + ka * (gl_LightModel.ambient + lightambient));
	color += specularcolor;
	
	gl_FragColor = fogThis(fogFactor, color);
	gl_FragColor.w = 1.0;
}
