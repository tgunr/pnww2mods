#version 120

varying vec4 color;
varying vec3 vertexpos;

void main()
{
	gl_Position = ftransform();

	gl_TexCoord[0] = gl_MultiTexCoord0;
	
	vertexpos = gl_ModelViewMatrix * gl_Vertex;
	gl_FogFragCoord = abs(vertexpos.z);
	
	// Particle may have color interpolated
	color = gl_Color;
}
