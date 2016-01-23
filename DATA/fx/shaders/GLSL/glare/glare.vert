#version 120

varying vec4 color;

void main(void)
{
    gl_Position = ftransform();
    gl_TexCoord[0].xy = gl_MultiTexCoord0.xy;
    color = gl_Color;
}