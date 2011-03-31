#version 120

uniform vec2 uv[64];

uniform vec3 origin;
varying vec3 eyepos;

void main()
{   
    vec4 p1;
	
    p1.xyz = gl_Vertex.xyz - origin;
    p1.w = 1.0;
    
    gl_TexCoord[1] = gl_TextureMatrix[1] * gl_ModelViewMatrix * p1;
    gl_TexCoord[2] = gl_TextureMatrix[2] * gl_ModelViewMatrix * p1;

    int c = int(gl_Vertex.w);

    p1 = gl_ModelViewMatrix * p1;
    eyepos = p1.xyz;
      
    gl_TexCoord[0].xy = uv[c];

	gl_Position = gl_ProjectionMatrix * p1;
}
