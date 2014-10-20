#version 150
#extension GL_ARB_texture_rectangle: enable

uniform sampler2DRect src1;
uniform sampler2DRect scene;

uniform vec2 filter[12];

const vec2 MaxCoC = vec2(5.0, 8.0);

in vec2 tex0;
out vec4 out_color;

vec4 filterdof()
{
    vec2 uv = tex0 * 0.5;

    vec4 c = texture(src1, uv);

    float centerDepth = c.a;
    float discRadius = abs(c.a * MaxCoC.y - MaxCoC.x);
    float discRadiusLow = discRadius * 0.4;

    c = vec4(0);

    vec2 uvLow, uvHigh;
    vec4 tapLow, tapHigh, tap;
    float tapBlur;

    for(int t = 0; t < 12; t++)
    {
        uvLow = uv + filter[t] * discRadiusLow;
        uvHigh = uv + filter[t] * discRadius;

        tapLow = texture(src1, uvLow);
        tapHigh = texture(src1, uvHigh);

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
    float a = texture(src1, tex0 * 0.5).a;
    vec4 base = texture(scene, tex0);

    out_color = mix(base, filterdof(), a);
}
