#version 120

uniform float scale1; // 128.0
uniform float scale2; // 128.0
uniform float scale3; // 512.0
uniform float scale4; // 512.0

varying vec3 N;
varying vec3 vertexpos;

void main()
{
    gl_TexCoord[0].xy = gl_MultiTexCoord0.xy * scale1;
    gl_TexCoord[0].zw = gl_MultiTexCoord0.xy * scale2;
    gl_TexCoord[1].xy = gl_MultiTexCoord0.xy * scale3;
    gl_TexCoord[1].zw = gl_MultiTexCoord0.xy * scale4;
    gl_TexCoord[2].xy = gl_MultiTexCoord0.xy;

    vec4 pos = gl_ModelViewMatrix * gl_Vertex;

    gl_TexCoord[3] = gl_TextureMatrix[5] * pos;

    vertexpos = pos.xyz;

    N = gl_NormalMatrix * gl_Normal;

    gl_FogFragCoord = abs(vertexpos.z);

    gl_Position = gl_ProjectionMatrix * pos;
}
