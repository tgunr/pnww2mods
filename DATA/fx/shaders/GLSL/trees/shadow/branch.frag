uniform sampler2D diffuse;
uniform sampler2D shadowmap;

uniform float diffuseScale;

varying vec3 normal;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3, out vec4, out vec4);

void main()
{ 
	vec4 base = texture2D(diffuse, gl_TexCoord[0].xy);
	vec4 shadow = texture2D(shadowmap, gl_TexCoord[2].xy);
	
	// Interpolated values need to be normalized
	vec3 n = normalize(normal);
	
	vec4 ambientColor;
	vec4 diffuseColor;
	
	lightGetAmbientDiffuse(n.xyz, ambientColor, diffuseColor);
	
	diffuseColor.w = 1.0;
	ambientColor.w = 1.0;
	
	ambientColor += gl_LightModel.ambient;
	
	ambientColor *= gl_FrontMaterial.ambient;
	diffuseColor *= (diffuseScale * gl_FrontMaterial.diffuse);
	
	vec4 color = base * (diffuseColor + ambientColor);
	color.rgb *= shadow.rgb;

	gl_FragColor = fogThis(color);
	gl_FragColor.a = 1.0;
}
