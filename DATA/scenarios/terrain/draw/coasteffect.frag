#version 120

uniform sampler2D src1; // surface
uniform sampler2D src2; // heightmap
uniform sampler2D src3; // foam

uniform float alpha;

void main()
{
    vec4 c1 = texture2DProj(src1, gl_TexCoord[1]);
	vec4 c2 = texture2D(src2, gl_TexCoord[0].xy);
	vec4 c3 = texture2D(src3, gl_TexCoord[0].zw);

    vec4 color;

    c1 = clamp(c1 * c3, 0.0, 0.5);

    c3 = c3 * c3 * c3;

    float a = clamp(alpha, 0.2, 1.0);

    color = mix(vec4(0, 0, 0, 0), c3, c2.g) * a;
    color = clamp(color + c1, 0.0, 0.8);

	gl_FragColor = color;
}
