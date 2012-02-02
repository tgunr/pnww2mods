#version 120

varying vec4 color;

void main()
{
    vec4 p = vec4(gl_Vertex.xyz, 1.0);

	gl_Position = gl_ProjectionMatrix * (gl_ModelViewMatrix * p);

	gl_TexCoord[0] = gl_MultiTexCoord0;
	
	gl_FogFragCoord = abs((gl_ModelViewMatrix * p).z);
	
	color = gl_Color;
}
