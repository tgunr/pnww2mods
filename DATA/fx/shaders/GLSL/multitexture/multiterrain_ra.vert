#version 120

varying vec3 N;
varying vec3 vertexpos;

const mat4 Mr = mat4(0.5, 0.0, 0.0, 0.0,
    	             0.0, 0.5, 0.0, 0.0,
		             0.0, 0.0, 0.5, 0.0,
		             0.5, 0.5, 0.5, 1.0);

void main()
{
    gl_TexCoord[0].xy = gl_MultiTexCoord0.xy;
    gl_TexCoord[0].zw = gl_MultiTexCoord0.xy * gl_TextureMatrix[0][0].x;
    gl_TexCoord[1].xy = gl_MultiTexCoord0.xy * gl_TextureMatrix[0][0].y;

    vec4 pos = gl_ModelViewMatrix * gl_Vertex;
    vertexpos = pos.xyz;

    N = gl_NormalMatrix * gl_Normal;

    gl_FogFragCoord = abs(vertexpos.z);

    gl_Position = ftransform();
    gl_TexCoord[2] = Mr * gl_Position;
}
