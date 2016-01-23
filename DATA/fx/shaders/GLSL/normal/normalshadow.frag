#version 120

uniform sampler2D src1;
uniform sampler2D src2;
uniform sampler2D src3;
uniform sampler2DShadow src4;

uniform float scale;
uniform vec3 shadowambient;

varying vec3 T;
varying vec3 B;
varying vec3 N;
varying vec3 vertexpos;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuseSpecular(in vec3 t,
                                    in vec3 b,
                                    in vec3 n,
                                    in vec3 V,
                                    in vec3 normal,
                                    out vec4 ambient, 
                                    out vec4 diffuse,
                                    out vec4 specular);

float GetShadowValue()
{
    vec3 c1 = gl_TexCoord[1].xyz / gl_TexCoord[1].w;
    c1.z -= 0.0005;
    c1.z = clamp(c1.z, 0.0, 1.0);

    float shadow = 0.0;

	for(float y = -1.5 ; y <= 1.5 ; y += 1.0)
    {
		for(float x = -1.5 ; x <= 1.5 ; x += 1.0)
        {
            shadow += shadow2D(src4, c1.xyz + vec3(x * scale, y * scale, 0.0)).r;
        }
    }

	shadow *= 0.0625;
    shadow = clamp(shadow + shadowambient.r, 0.0, 1.0);

    return shadow;
}

void main()
{
	vec4 base = texture2D(src1, gl_TexCoord[0].xy);
	vec3 normal = texture2D(src2, gl_TexCoord[0].xy).rgb * 2.0 - 1.0;
	float Ks = texture2D(src3, gl_TexCoord[0].xy).r;
	float occ = texture2D(src3, gl_TexCoord[0].xy).g;
	
	normal.z = sqrt(1.0 - normal.x * normal.x - normal.y * normal.y);
	
	vec4 diffuse;
	vec4 specular;
	vec4 ambient;
	
	// These values are interpolated and need to be normalized
	vec3 v = normalize(-vertexpos);
	vec3 t = normalize(T);
	vec3 b = normalize(B);
	vec3 n = normalize(N);

	lightGetAmbientDiffuseSpecular(t, 
	                               b, 
	                               n, 
	                               v, 
	                               normal, 
	                               ambient, 
	                               diffuse, 
	                               specular);

	ambient += gl_LightModel.ambient;
	ambient *= gl_FrontMaterial.ambient;
	ambient *= occ;
	
	specular.rgb *= Ks;
	
	vec4 color =  base * (diffuse + specular + ambient);	

    color.rgb *= GetShadowValue();

	gl_FragColor = fogThis(color);
	gl_FragColor.w = base.a;
}
