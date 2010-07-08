uniform sampler2D diffuse;
uniform sampler2D normalmap;
uniform sampler2D shadowmap;

uniform float diffuseScale;

varying vec3 T;
varying vec3 B;
varying vec3 N;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3, 
                            in vec3, 
                            in vec3, 
                            in vec3, 
                            out vec4, 
                            out vec4);

void main()
{ 
	vec4 base = texture2D(diffuse, gl_TexCoord[0].xy);
	vec4 normal = texture2D(normalmap, gl_TexCoord[1].xy) * 2.0 - 1.0;
	vec4 shadow = texture2D(shadowmap, gl_TexCoord[2].xy);
	
	// Interpolated values need to be normalized
	vec3 t = normalize(T);
	vec3 b = normalize(B);
	vec3 n = normalize(N);
		
	vec4 diffuseColor;
	vec4 ambientColor;
	
	lightGetAmbientDiffuse(t, b, n, normal.xyz, ambientColor, diffuseColor);
	
	ambientColor.w = 1.0;
	diffuseColor.w = 1.0;
	
	ambientColor += gl_LightModel.ambient;
	
	ambientColor *= gl_FrontMaterial.ambient;
	diffuseColor *= (diffuseScale * gl_FrontMaterial.diffuse);
	
	vec4 color = base * (diffuseColor + ambientColor);
	color.rgb *= shadow.rgb;

	gl_FragColor = fogThis(color);
	gl_FragColor.a = 1.0;
}
