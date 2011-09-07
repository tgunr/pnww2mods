#version 120

uniform vec2 uv[64];

uniform vec3 origin;

const float ss = 1.0 / 800.0;

const vec4 sPlane = vec4(ss, 0.0, 0.0, 0.0);
const vec4 tPlane = vec4(0.0, -ss, 0.0, 0.0);

varying vec3 vertexpos;

void main()
{   
    vec4 p1;

    p1.xyz = gl_Vertex.xyz - origin;
    p1.w = 1.0;

    gl_TexCoord[1].x = dot(p1, sPlane) + 0.5;
    gl_TexCoord[1].y = dot(p1, tPlane) + 0.5;

    int c = int(gl_Vertex.w);

    p1 = gl_ModelViewMatrix * p1;
   
    vertexpos = p1.xyz;
    
    gl_TexCoord[0].xy = uv[c];
    gl_TexCoord[0].z = gl_MultiTexCoord0.x;

    gl_FogFragCoord = abs(vertexpos.z);

	gl_Position = gl_ProjectionMatrix * p1;
}
