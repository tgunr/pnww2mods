#version 120

uniform float scale[6];

varying vec3 N;
varying vec3 vertexpos;

const mat4 Mr = mat4(0.5, 0.0, 0.0, 0.0,
    	             0.0, 0.5, 0.0, 0.0,
		             0.0, 0.0, 0.5, 0.0,
		             0.5, 0.5, 0.5, 1.0);

void main()
{
    gl_TexCoord[0].xy = gl_MultiTexCoord0.xy * scale[0];
    gl_TexCoord[0].zw = gl_MultiTexCoord0.xy * scale[1];
    gl_TexCoord[1].xy = gl_MultiTexCoord0.xy * scale[2];
    gl_TexCoord[1].zw = gl_MultiTexCoord0.xy * scale[3];
    gl_TexCoord[2].xy = gl_MultiTexCoord0.xy * scale[4];
    gl_TexCoord[2].zw = gl_MultiTexCoord0.xy * scale[5];

    gl_TexCoord[6].xy = gl_MultiTexCoord0.xy;

    vec4 pos = gl_ModelViewMatrix * gl_Vertex;

    vertexpos = pos.xyz;

    N = gl_NormalMatrix * gl_Normal;

    gl_FogFragCoord = abs(vertexpos.z);

    gl_Position = ftransform();
    gl_TexCoord[4] = Mr * gl_Position;
}
