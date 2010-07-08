varying vec3 N;
varying vec3 V;

void main()
{
	N = normalize(gl_NormalMatrix * gl_Normal);
	
	gl_TexCoord[0] = gl_TextureMatrix[0] * gl_MultiTexCoord0;
	gl_TexCoord[1] = gl_TextureMatrix[1] * gl_MultiTexCoord1;
	gl_TexCoord[2] = gl_TextureMatrix[2] * gl_MultiTexCoord2;
	
	V = (gl_ModelViewMatrix * gl_Vertex).xyz;
	gl_FogFragCoord = abs(V.z);

	V = normalize(V);

 	gl_Position = ftransform();
}
