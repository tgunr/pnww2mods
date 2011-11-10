#version 120
#extension GL_ARB_texture_rectangle: enable

uniform sampler2DRect src1;
uniform sampler2DRect src2;

uniform float lum;
uniform vec2 filter[12];

const vec2 MaxCoC = vec2(5.0, 10.0);

vec4 filterdof()
{
    vec4 c = texture2DRect(src1, gl_TexCoord[0].xy);

    float centerDepth = c.a;
    float discRadius = abs(c.a * MaxCoC.y - MaxCoC.x);
    float discRadiusLow = discRadius * 0.4;

    c = vec4(0);

    vec2 uvLow, uvHigh;
    vec4 tapLow, tapHigh, tap;
    float tapBlur;

    for(int t = 0; t < 12; t++)
    {
        uvLow = gl_TexCoord[0].xy + filter[t] * discRadiusLow;
        uvHigh = gl_TexCoord[0].xy + filter[t] * discRadius;

        tapLow = texture2DRect(src1, uvLow);
        tapHigh = texture2DRect(src1, uvHigh);

        tapBlur = abs(tapHigh.a * 2.0 - 1.0);
        
        tap = mix(tapHigh, tapLow, tapBlur);

        tap.a = tap.a >= centerDepth ? 1.0 : tapBlur;

        c.rgb += tap.rgb * tap.a;
        c.a += tap.a;
    }

    return c / c.a;
}

void main()
{	
    vec4 c = filterdof();

    vec4 c3 = texture2DRect(src2, gl_TexCoord[0].xy);

	c += lum;
 
    gl_FragColor = c * c3;
}
