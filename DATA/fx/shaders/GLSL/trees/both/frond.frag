uniform sampler2D diffuse;
uniform sampler2D shadowmap;

varying vec3 N;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3, out vec4, out vec4);

void main()
{
	vec4 base = texture2D(diffuse, gl_TexCoord[0].xy);
	vec4 shadowColor = texture2D(shadowmap, gl_TexCoord[1].xy);

	vec4 diffuseColor;
	vec4 ambientColor;
	
	// Normalize interpolated values
	vec3 n = normalize(N);
	
	lightGetAmbientDiffuse(n, ambientColor, diffuseColor);
	
	ambientColor.w = 1.0;
	diffuseColor.w = 1.0;
	
	ambientColor += gl_LightModel.ambient;
	ambientColor *= gl_FrontMaterial.ambient;
	diffuseColor *= gl_FrontMaterial.diffuse;
	
	vec4 color = base * (diffuseColor + ambientColor);
	color.rgb *= shadowColor.rgb;

	gl_FragColor = fogThis(color);
	gl_FragColor.w = base.a;
}
