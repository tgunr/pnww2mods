#version 120

uniform sampler2D src1;
uniform sampler2D scene;

uniform vec2 filter[12];

const vec2 MaxCoC = vec2(5.0, 8.0);

vec4 filterdof()
{
    vec4 c = texture2D(src1, gl_TexCoord[0].xy);

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

        tapLow = texture2D(src1, uvLow);
        tapHigh = texture2D(src1, uvHigh);

        tapBlur = abs(tapHigh.a * 2.0 - 1.0);
        
        tap = mix(tapHigh, tapLow, tapBlur);

		tap.a = tap.a > centerDepth ? 1.0 : abs(tap.a * 2.0 - 1.0);

        c.rgb += tap.rgb * tap.a;
        c.a += tap.a;
    }

    return c / c.a;
}

void main()
{	
    float a = texture2D(src1, gl_TexCoord[0].xy).a;
    vec4 base = texture2D(scene, gl_TexCoord[0].xy);

    gl_FragColor = mix(base, filterdof(), a);
}
