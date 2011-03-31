#version 120

varying vec3 N;
varying vec3 eyepos;

void main()
{
    gl_TexCoord[0].xy = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
    gl_TexCoord[0].zw = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
    gl_TexCoord[1].xy = (gl_TextureMatrix[1] * gl_MultiTexCoord0).xy;
    gl_TexCoord[1].zw = (gl_TextureMatrix[1] * gl_MultiTexCoord0).xy;
    gl_TexCoord[2].xy = gl_MultiTexCoord0.xy;
    gl_TexCoord[3] = gl_TextureMatrix[5] * gl_ModelViewMatrix * gl_Vertex;

    vec4 pos = gl_ModelViewMatrix * gl_Vertex;
    eyepos = pos.xyz;

    N = gl_NormalMatrix * gl_Normal;

    gl_FogFragCoord = abs(eyepos.z);

    gl_Position = gl_ProjectionMatrix * pos;
}
