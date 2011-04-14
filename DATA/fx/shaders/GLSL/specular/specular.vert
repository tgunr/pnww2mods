#version 120

varying vec3 N;
varying vec3 vertexpos;

void main()
{
	N = normalize(gl_NormalMatrix * gl_Normal.xyz);
	
	gl_TexCoord[0] = gl_MultiTexCoord0;
	
	vertexpos = (gl_ModelViewMatrix * gl_Vertex).xyz;
	gl_FogFragCoord = abs(vertexpos.z);
	
 	gl_Position = ftransform();
}
