#version 120

varying vec4 color;
varying vec3 vertexpos;

void main()
{
    vec4 p = vec4(gl_Vertex.xyz, 1.0);

	gl_Position = gl_ProjectionMatrix * (gl_ModelViewMatrix * p);

	gl_TexCoord[0] = gl_MultiTexCoord0;
	
	vertexpos = (gl_ModelViewMatrix * p).xyz;

	gl_FogFragCoord = abs(vertexpos.z);
	
	color = gl_Color;
}
