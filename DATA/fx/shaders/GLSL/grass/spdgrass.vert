#version 120

uniform vec2 uv[64];

uniform vec3 origin;
uniform vec4 rot;

varying vec3 vertexpos;

void main()
{   
    vec4 p1;

    p1.xy = gl_Vertex.xy;
	p1.xy = vec2(dot(rot.xyw, p1.xyz), dot(rot.zxw, p1.xyz));
    p1.xy += origin.xy;
    
    p1.z = gl_MultiTexCoord1.x + gl_Vertex.z;
    p1.w = 1.0;

    int c = int(gl_Vertex.w);

    p1 = gl_ModelViewMatrix * p1;
   
    vertexpos = p1.xyz;
    
    gl_TexCoord[0].xy = uv[c];
    gl_TexCoord[0].z = gl_MultiTexCoord0.x;

    gl_FogFragCoord = abs(vertexpos.z);

	gl_Position = gl_ProjectionMatrix * p1;
}
