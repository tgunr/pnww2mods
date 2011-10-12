#version 120

varying vec3 N;
varying vec3 vertexpos;

void main()
{
    gl_TexCoord[0].xy = (gl_TextureMatrix[0] * vec4(gl_MultiTexCoord0.xy, 1.0, 1.0)).xy;
    gl_TexCoord[0].zw = (gl_TextureMatrix[1] * vec4(gl_MultiTexCoord0.xy, 1.0, 1.0)).xy;

    vec4 pos = gl_ModelViewMatrix * gl_Vertex;
    vertexpos = pos.xyz;

    N = gl_NormalMatrix * gl_Normal;

    gl_FogFragCoord = abs(vertexpos.z);

    gl_Position = ftransform();
}
