#version 120

uniform sampler2D src1;
uniform sampler2D splat;
uniform float alphatest;

varying vec3 eyepos;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(out vec4 amb, out vec4 dif);

const vec4 defaultcolor = vec4(0, 0, 0, 0);
const vec4 Ka = vec4(0.4, 0.35, 0.4, 1.0);
const vec4 Kd = vec4(0.40, 0.35, 0.5, 1.0);

void main()
{
	vec4 base = texture2D(src1, gl_TexCoord[0].xy);
    vec4 tcolor = texture2D(splat, gl_TexCoord[1].xy);

    gl_FragColor = defaultcolor;

    if(base.a > alphatest)
    {
	    vec4 amb;
	    vec4 dif;
    	
	    lightGetAmbientDiffuse(amb, dif);
    	
        amb += gl_LightModel.ambient;

        base = mix(base, tcolor, tcolor.a);

        vec4 color = base * (amb * Ka + dif * Kd);
        color.rgb *= gl_TexCoord[0].z;

	    gl_FragColor = fogThis(color);
    }
}
