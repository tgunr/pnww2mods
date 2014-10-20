#version 120

uniform sampler2D billboardMap;
uniform float lightadjust;
uniform float alphatest;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(out vec4, out vec4);

void main()
{
	vec4 base = texture2D(billboardMap, gl_TexCoord[0].xy);

    if(base.a <= alphatest)
        discard;

	vec4 ambient, diffuse;
	
	lightGetAmbientDiffuse(ambient, diffuse);
	
  	float adjust = mix(gl_TexCoord[1].x, gl_TexCoord[1].y, lightadjust);
	vec4 d = diffuse * adjust;

	ambient *= gl_TexCoord[1].z;
	
	vec4 color = base * (d + ambient);

	gl_FragColor = fogThis(color);
	gl_FragColor.a = base.a * gl_TexCoord[1].w;
}
