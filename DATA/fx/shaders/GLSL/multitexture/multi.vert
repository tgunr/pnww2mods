#version 120

varying vec3 N;
varying vec3 eyepos;

const mat4 Mr = mat4(0.5, 0.0, 0.0, 0.0,
    	             0.0, 0.5, 0.0, 0.0,
		             0.0, 0.0, 0.5, 0.0,
		             0.5, 0.5, 0.5, 1.0);

void main()
{
    gl_TexCoord[0].xy = (gl_TextureMatrix[0] * vec4(gl_MultiTexCoord0.xy, 1.0, 1.0)).xy;
    gl_TexCoord[0].zw = (gl_TextureMatrix[1] * vec4(gl_MultiTexCoord0.xy, 1.0, 1.0)).xy;
    gl_TexCoord[1].xy = (gl_TextureMatrix[2] * vec4(gl_MultiTexCoord0.xy, 1.0, 1.0)).xy;

    vec4 pos = gl_ModelViewMatrix * gl_Vertex;
    eyepos = pos.xyz;

    N = gl_NormalMatrix * gl_Normal;

    gl_FogFragCoord = abs(eyepos.z);

    gl_Position = ftransform();
    gl_TexCoord[2] = Mr * gl_Position;
}
