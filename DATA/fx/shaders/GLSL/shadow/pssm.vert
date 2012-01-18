#version 120

varying float t;

void main()
{
    vec4 viewpos = gl_ModelViewMatrix * gl_Vertex;
   
    t = abs(viewpos.z / 200.0);

	gl_TexCoord[0] = gl_TextureMatrix[0] * viewpos;
	gl_TexCoord[1] = gl_TextureMatrix[1] * viewpos;
	gl_TexCoord[2] = gl_TextureMatrix[2] * viewpos;

    gl_TexCoord[0].z = 1.0 - gl_TexCoord[0].z;
    gl_TexCoord[1].z = 1.0 - gl_TexCoord[1].z;
    gl_TexCoord[2].z = 1.0 - gl_TexCoord[2].z;

	gl_FrontColor = vec4(1, 1, 1, 1);
 	gl_Position = ftransform();
}
