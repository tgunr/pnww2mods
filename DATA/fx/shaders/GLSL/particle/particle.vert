#version 120

varying vec4 color;
varying vec3 vpos;

void main()
{
	gl_Position = ftransform();

	gl_TexCoord[0] = gl_MultiTexCoord0;
	
	vec4 eyepos = gl_ModelViewMatrix * gl_Vertex;
	gl_FogFragCoord = abs(eyepos.z);
	
	// Particle may have color interpolated
	color = gl_Color;
	vpos = eyepos.xyz;
}
