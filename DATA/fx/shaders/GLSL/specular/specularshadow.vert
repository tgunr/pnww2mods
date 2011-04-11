#version 120

varying vec3 N;
varying vec3 V;

void main()
{
	N = normalize(gl_NormalMatrix * gl_Normal.xyz);
	
	gl_TexCoord[0] = gl_MultiTexCoord0;

    vec4 pos = gl_ModelViewMatrix * gl_Vertex;

    gl_TexCoord[1] = gl_TextureMatrix[2] * pos;
	
	V = pos.xyz;
	gl_FogFragCoord = abs(V.z);
	
 	gl_Position = ftransform();
}
