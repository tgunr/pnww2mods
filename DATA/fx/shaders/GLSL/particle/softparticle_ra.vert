#version 120

varying vec4 color;

void main()
{
 	gl_Position = ftransform();

	gl_TexCoord[0] = gl_MultiTexCoord0;
	
	gl_FogFragCoord = abs((gl_ModelViewMatrix * gl_Vertex).z);

    vec4 p = gl_Position / gl_Position.w;

    gl_TexCoord[1].x = p.x * 0.5 + 0.5;
    gl_TexCoord[1].y = p.y * 0.5 + 0.5;
	
	color = gl_Color;
}