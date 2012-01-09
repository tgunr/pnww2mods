#version 150

uniform sampler2D src1;
uniform sampler2D splat;
uniform float alphatest;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(out vec4 amb, out vec4 dif);

const vec4 defaultcolor = vec4(0, 0, 0, 0);
const vec4 Ka = vec4(0.50, 0.50, 0.43, 1.0);
const vec4 Kd = vec4(0.4, 0.45, 0.39, 1.0);

in vec3 tex0;
in vec2 tex1;

out vec4 out_color;

void main()
{
	vec4 base = texture2D(src1, tex0.xy);
    vec4 tcolor = texture2D(splat, tex1);

    out_color = defaultcolor;

    if(base.a > alphatest)
    {
	    vec4 amb;
	    vec4 dif;
    	
	    lightGetAmbientDiffuse(amb, dif);
    	
        base = mix(base, tcolor, tcolor.a);

        vec4 color = base * (amb * Ka + dif * Kd);
        color.rgb *= tex0.z;

	    out_color = fogThis(color);
    }
}
