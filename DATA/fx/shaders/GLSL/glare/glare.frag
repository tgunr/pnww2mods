#version 120

uniform sampler2D src1;

varying vec4 color;

void main(void)
{
    gl_FragColor = clamp(texture2D(src1, gl_TexCoord[0].xy) * color, 0.0, 1.0);
} 