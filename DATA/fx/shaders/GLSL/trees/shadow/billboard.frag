uniform sampler2D billboardMap;

vec4 fogThis(in vec4);
void lightGetDiffuse(out vec4);

void main()
{
	vec4 base = texture2D(billboardMap, gl_TexCoord[0].xy);
	
	vec4 diffuseColor;
	
	base.rgb *= gl_TexCoord[1].z;

	lightGetDiffuse(diffuseColor);
	diffuseColor.w = 1.0;
	
	vec4 color = base * diffuseColor + gl_LightModel.ambient * 0.25;
	
	gl_FragColor = fogThis(color);
	gl_FragColor.a = base.a * gl_TexCoord[1].w;
}
