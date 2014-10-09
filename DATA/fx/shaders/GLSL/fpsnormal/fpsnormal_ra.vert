#version 120

varying vec3 T;
varying vec3 B;
varying vec3 N;
varying vec3 vertexpos;

varying float fogFactor;

float fogValue(float);

void main()
{
	vec3 tangent = gl_MultiTexCoord1.xyz;
	
	N = normalize(gl_NormalMatrix * gl_Normal);	
	T = normalize(gl_NormalMatrix * tangent);
	B = normalize(cross(N, T));
				
	gl_TexCoord[0] = gl_MultiTexCoord0;
	
	vertexpos = (gl_ModelViewMatrix * gl_Vertex).xyz;

 	gl_Position = ftransform();
	gl_FogFragCoord = abs(vertexpos.z);
}
