#version 120

const mat4 Mr = mat4(0.5, 0.0, 0.0, 0.0,
    	             0.0, 0.5, 0.0, 0.0,
		             0.0, 0.0, 0.5, 0.0,
		             0.5, 0.5, 0.5, 1.0);

void main()
{
    gl_TexCoord[0].xy = gl_MultiTexCoord0.xy;
    gl_TexCoord[0].zw = gl_MultiTexCoord0.xy * 80.0;

	gl_Position = ftransform();

    gl_TexCoord[1] = Mr * gl_Position;
}
