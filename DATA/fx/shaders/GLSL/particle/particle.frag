#version 120

uniform sampler2D src1;

varying vec4 color;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(out vec4 ambient, out vec4 diffuse);

void main()
{
	vec4 map = texture2D(src1, gl_TexCoord[0].xy);
	
	vec4 ambient;
	vec4 diffuse;
	vec4 emissive;
	
	lightGetAmbientDiffuse(ambient, diffuse);

	ambient += gl_LightModel.ambient;
	
	diffuse *= (gl_FrontMaterial.diffuse * color);
	ambient *= gl_FrontMaterial.ambient;
	emissive = gl_FrontMaterial.emission;
	
	vec4 c = map * (diffuse + ambient + emissive);
	 
	gl_FragColor = fogThis(c);
	gl_FragColor.a = map.a * color.a;
}
