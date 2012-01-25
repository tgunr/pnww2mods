#version 120

uniform vec2 uv[64];

uniform vec3 origin;

varying vec3 vertexpos;

const float ss = 1.0 / 800.0;

const vec4 sPlane = vec4(ss, 0.0, 0.0, 0.0);
const vec4 tPlane = vec4(0.0, -ss, 0.0, 0.0);

void main()
{   
    vec4 p1;

    p1.xy = gl_Vertex.xy;
    p1.xy += origin.xy;

    p1.z = gl_MultiTexCoord1.x + gl_Vertex.z;
    p1.w = 1.0;
    
    gl_TexCoord[1].x = p1.x * sPlane.x + 0.5;
    gl_TexCoord[1].y = p1.y * tPlane.y + 0.5;

    p1 = gl_ModelViewMatrix * p1;
    
    gl_TexCoord[2] = gl_TextureMatrix[2] * p1;
    gl_TexCoord[3] = gl_TextureMatrix[3] * p1;
    gl_TexCoord[4] = gl_TextureMatrix[4] * p1;

    gl_TexCoord[2].z = 1.0 - gl_TexCoord[2].z;
    gl_TexCoord[3].z = 1.0 - gl_TexCoord[3].z;
    gl_TexCoord[4].z = 1.0 - gl_TexCoord[4].z;

    int c = int(gl_Vertex.w);

    vertexpos = p1.xyz;
    gl_FogFragCoord = abs(vertexpos.z);

    gl_TexCoord[0].xy = uv[c];
    gl_TexCoord[0].z = gl_MultiTexCoord0.x;
    
	gl_Position = gl_ProjectionMatrix * p1;
}
