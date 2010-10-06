#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MatrixBlock
{
    mat4 MVMatrix;  
    mat4 NormalMatrix;
    mat4 ProjectionMatrix;
};

in vec3 in_pos;
in vec2 in_tex0;
in vec3 in_normal;

uniform vec3 pos1;
uniform vec3 pos2;
uniform vec3 right;
uniform float currentAngle;

out vec3 N;
out vec3 V;
out vec2 tex0;
out float fogdist;
out vec3 vertexpos;

void main()
{
	tex0 = in_tex0;

	float dist1 = distance(in_pos, pos1);
	float dist2 = distance(in_pos, pos2);
	float d = min(dist1, dist2);
	d *= 0.06;
	
	vec2 angle = in_pos.xy * 4.0 + vec2(currentAngle, currentAngle);
	
	float x = sin(angle.x) * d;
	float y = sin(angle.y) * d;
	
	vec4 pos = vec4(in_pos, 1.0);
	pos.x += y * right.x;
	pos.y += x * right.y;
	
	N = in_normal;
	N.x += y * right.x;
	N.y += x * right.y;
	
	N = normalize(mat3(NormalMatrix) * N);
    pos = MVMatrix * pos;

	V = pos.xyz;
	vertexpos = pos.xyz;

	fogdist = abs(pos.z);
	
	gl_Position = ProjectionMatrix * pos;
}
