#version 120

uniform sampler2D diffuse;
uniform float alphatest;

void main()
{
    vec4 base = texture2D(diffuse, gl_TexCoord[0].xy);

    if(base.a <= alphatest)
        discard;
    
    gl_FragColor = base;
}
