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
	
	gl_TexCoord[0] = gl_MultiTexCoord0;
	
	vertexpos = (gl_ModelViewMatrix * gl_Vertex).xyz;

	gl_FogFragCoord = abs(vertexpos.z);
	
 	gl_Position = ftransform();
}
