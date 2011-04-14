#version 120

varying vec3 N;
varying vec3 vertexpos;

void main()
{
	N = normalize(gl_NormalMatrix * gl_Normal.xyz);
	
	gl_TexCoord[0] = gl_MultiTexCoord0;

    vec4 pos = gl_ModelViewMatrix * gl_Vertex;

    gl_TexCoord[1] = gl_TextureMatrix[2] * pos;
	
	vertexpos = pos.xyz;
	gl_FogFragCoord = abs(vertexpos.z);
	
 	gl_Position = ftransform();
}
