#version 120
#extension GL_ARB_texture_rectangle: enable

uniform sampler2DRect src1;
uniform sampler2DRect scene;

uniform float lum;
uniform vec2 filter[12];

const vec2 MaxCoC = vec2(5.0, 20.0);

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

		tap.a = tapBlur;

		if(tap.a >= centerDepth)
			tap.a = 1.0;

        c.rgb += tap.rgb * tap.a;
        c.a += tap.a;
    }

    return c / c.a;
}

void main()
{	
    gl_FragColor = mix(texture2DRect(scene, gl_TexCoord[1].xy), filterdof(), 0.5);
}
