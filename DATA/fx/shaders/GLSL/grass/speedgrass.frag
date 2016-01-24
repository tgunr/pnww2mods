uniform sampler2D src1;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(out vec4, out vec4);

varying vec4 color;

void main()
{
	vec4 base = texture2D(src1, gl_TexCoord[0].xy);

	vec4 amb;
	vec4 dif;
	
	lightGetAmbientDiffuse(amb, dif);

	amb += gl_LightModel.ambient;
	amb *= gl_FrontMaterial.ambient;
		
	vec4 c = base * color * (amb + dif);
	
	gl_FragColor = fogThis(c);
}
