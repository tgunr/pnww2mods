uniform sampler2D diffuse;

varying vec3 N;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3, out vec4, out vec4);

void main()
{
	vec4 base = texture2D(diffuse, gl_TexCoord[0].xy);

	vec4 diffuseColor;
	vec4 ambientColor;
	
	// Interpolated values need to be normalized
	vec3 n = normalize(N);
	
	lightGetAmbientDiffuse(n, ambientColor, diffuseColor);
	
	ambientColor.w = 1.0;
	diffuseColor.w = 1.0;
	
	ambientColor += gl_LightModel.ambient;
	ambientColor *= gl_FrontMaterial.ambient;
	diffuseColor *= (gl_FrontMaterial.diffuse * gl_TexCoord[1].x);
	
	vec4 color = base * (diffuseColor + ambientColor);
	
	gl_FragColor = fogThis(color);
	gl_FragColor.a = base.a;
}
