#version 120

uniform vec3 pos1;
uniform vec3 pos2;
uniform vec3 right;
uniform float currentAngle;

varying vec3 N;
varying vec3 vertexpos;

void main()
{
	gl_TexCoord[0] = gl_TextureMatrix[0] * gl_MultiTexCoord0;

	float dist1 = distance(gl_Vertex.xyz, pos1);
	float dist2 = distance(gl_Vertex.xyz, pos2);
	float d = min(dist1, dist2);
	d *= 0.06;
	
	vec2 angle = gl_Vertex.xy * 4.0 + vec2(currentAngle, currentAngle);
	
	float x = sin(angle.x) * d;
	float y = sin(angle.y) * d;
	
	vec4 pos = gl_Vertex;
	pos.x += y * right.x;
	pos.y += x * right.y;
	
	N = gl_Normal;
	N.x += y * right.x;
	N.y += x * right.y;
	
	N = normalize(gl_NormalMatrix * N);
	vertexpos = (gl_ModelViewMatrix * gl_Vertex).xyz;

	pos = gl_ModelViewMatrix * pos;
	gl_FogFragCoord = abs(pos.z);
	
	gl_Position = gl_ProjectionMatrix * pos;
}
