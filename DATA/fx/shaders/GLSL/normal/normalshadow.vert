#version 120

attribute vec3 tangent;
attribute vec3 binormal;
attribute vec3 normal;

varying vec3 N;
varying vec3 T;
varying vec3 B;
varying vec3 vertexpos;

void main()
{
	N = normalize(gl_NormalMatrix * normal.xyz);
	T = normalize(gl_NormalMatrix * tangent.xyz);
	B = normalize(gl_NormalMatrix * binormal.xyz);
	
    vec4 pos = gl_ModelViewMatrix * gl_Vertex;

    gl_TexCoord[1] = gl_TextureMatrix[3] * pos;

	gl_TexCoord[0] = gl_MultiTexCoord0;
	
	vertexpos = pos.xyz;

	gl_FogFragCoord = abs(vertexpos.z);
	
 	gl_Position = gl_ProjectionMatrix * pos;
}
