#version 120

uniform sampler2D src1;
uniform sampler2DShadow src2;
uniform sampler2D splat;

uniform float alphatest;
uniform vec3 shadowambient;
uniform float scale;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(out vec4 amb, out vec4 dif);

const vec4 defaultcolor = vec4(0, 0, 0, 0);
const vec4 Ka = vec4(0.3, 0.32, 0.3, 1.0);
const vec4 Kd = vec4(0.25, 0.29, 0.25, 1.0);

float GetShadowValue()
{
    vec3 c1 = gl_TexCoord[1].xyz / gl_TexCoord[1].w;
    c1.z -= 0.0005;
    c1.z = clamp(c1.z, 0.0, 1.0);

    float shadow = shadow2D(src2, c1).r;

    shadow = clamp(shadow + shadowambient.r, 0.0, 1.0);

    return shadow;
}

void main()
{
	vec4 base = texture2D(src1, gl_TexCoord[0].xy);
    vec4 tcolor = texture2D(splat, gl_TexCoord[2].xy);
     
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
	    color.rgb *= GetShadowValue();

        gl_FragColor = fogThis(color);
    }
}
