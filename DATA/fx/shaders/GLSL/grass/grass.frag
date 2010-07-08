uniform sampler2D src1;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(out vec4 amb, out vec4 dif);

void main()
{
	vec4 base = texture2D(src1, gl_TexCoord[0].xy);

	vec4 amb;
	vec4 dif;
	
	lightGetAmbientDiffuse(amb, dif);

	amb += gl_LightModel.ambient;
	amb *= gl_FrontMaterial.ambient;
		
	vec4 c = vec4(0.407 * 0.4, 0.447 * 0.4, 0.302 * 0.4, 0);
	vec4 color = base * c * (amb + dif);

	gl_FragColor = fogThis(color);
	gl_FragColor.a = base.a;
}
