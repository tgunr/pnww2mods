#version 120

varying vec4 color;
varying vec3 vertexpos;

void main()
{
 	gl_Position = ftransform();

	gl_TexCoord[0] = gl_MultiTexCoord0;
	
	vertexpos = (gl_ModelViewMatrix * gl_Vertex).xyz;

    vec4 p = gl_Position / gl_Position.w;

    gl_TexCoord[1].x = p.x * 0.5 + 0.5;
    gl_TexCoord[1].y = p.y * 0.5 + 0.5;

	gl_FogFragCoord = abs(vertexpos.z);
	
	color = gl_Color;
}