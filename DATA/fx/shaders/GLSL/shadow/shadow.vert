#version 120

void main()
{
	gl_TexCoord[0] = gl_TextureMatrix[0] * gl_ModelViewMatrix * gl_Vertex;
	gl_TexCoord[1] = gl_TextureMatrix[1] * gl_ModelViewMatrix * gl_Vertex;
	
	gl_FrontColor = vec4(1, 1, 1, 1);
 	gl_Position = ftransform();
}
