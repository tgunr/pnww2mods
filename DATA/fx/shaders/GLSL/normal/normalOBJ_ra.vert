#version 120

attribute vec3 tangent;

varying vec3 N;
varying vec3 T;
varying vec3 B;
varying vec3 vertexpos;

void main()
{
	N = gl_NormalMatrix * gl_Normal.xyz;
	T = gl_NormalMatrix * tangent.xyz;
	B = cross(N, T);
	
	gl_TexCoord[0] = gl_MultiTexCoord0;
	
	vertexpos = (gl_ModelViewMatrix * gl_Vertex).xyz;

	gl_FogFragCoord = abs(vertexpos.z);
	
 	gl_Position = ftransform();
}
