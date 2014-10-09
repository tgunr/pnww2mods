#version 120

uniform sampler2D refr;
uniform sampler2D src2;
uniform sampler2D refl;
uniform sampler2D surf;
uniform sampler2D height;
uniform sampler2DShadow shadow;

uniform float scale;

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

float GetShadowValue()
{
    vec3 c1 = gl_TexCoord[5].xyz / gl_TexCoord[5].w;
    c1.z -= 0.0005;
    c1.z = clamp(c1.z, 0.0, 1.0);

    float s = 0.0;

	for(float y = -1.5 ; y <= 1.5 ; y += 1.0)
    {
		for(float x = -1.5 ; x <= 1.5 ; x += 1.0)
        {
            s += shadow2D(shadow, c1.xyz + vec3(x * scale, y * scale, 0.0)).r;
        }
    }

	s *= 0.0625;
    s = clamp(s, 0.0, 1.0);

    return s;
}

void main()
{
	vec4 t0 = texture2D(src2, gl_TexCoord[1].xy) * 2.0 - 1.0;
	vec4 t1 = texture2D(src2, gl_TexCoord[1].zw) * 2.0 - 1.0;
	
	vec4 mapN = t0 + t1;
    mapN.z = sqrt(1.0 - mapN.x * mapN.x - mapN.y * mapN.y);

	vec3 m = normalize(mapN.rgb);
				
	vec4 coords = gl_TexCoord[2];
	coords.xy += mapN.xy;

	// Reflect the environment
	vec4 t3 = texture2DProj(refl, coords);
	vec4 rf = texture2DProj(refr, coords);

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
	diffuseColor *= ocolor;
	ambientColor *= gl_FrontMaterial.ambient;

	float facing = max(dot(n, v), 0.0);
	
	// Reflect less if closer to water. 	
	vec4 color = mix(t3, ocolor, facing);

    vec4 h = texture2D(height, gl_TexCoord[4].xy);

	color = color * (diffuseColor + ambientColor) + specularColor;
    color.rgb *= GetShadowValue();

    color = mix(color, rf, h.r);
    color += t4;

    gl_FragColor = fogThis(color);
}
