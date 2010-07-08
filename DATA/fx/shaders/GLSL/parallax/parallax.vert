attribute vec4 tangent;
attribute vec4 binormal;
attribute vec4 normal;

varying vec3 N;
varying vec3 T;
varying vec3 B;
varying vec3 V;

varying vec3 vtan;

void main()
{
	N = normalize(gl_NormalMatrix * normal.xyz);
	T = normalize(gl_NormalMatrix * -tangent.xyz);
	B = normalize(gl_NormalMatrix * binormal.xyz);
	
	gl_TexCoord[0] = gl_MultiTexCoord0;
	
	V = (gl_ModelViewMatrix * gl_Vertex).xyz;
	
	vtan.x = -dot(V, T);
	vtan.y = -dot(V, B);
	vtan.z = -dot(V, N);
	
	gl_FogFragCoord = abs(V.z);
	
 	gl_Position = ftransform();
}
