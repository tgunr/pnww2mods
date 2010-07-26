#version 150

uniform MatrixBlock
{
    mat4 MVMatrix;
    mat4 ProjectionMatrix;
    mat4 NormalMatrix;
};

in vec3 in_pos;
in vec3 in_normal;
in vec2 in_tex0;
in vec3 in_tex1;

out vec3 T;
out vec3 B;
out vec3 N;
out vec3 V;
out vec2 tex0;

out float fogdist;
out vec3 vertexpos;

float fogValue(float);

void main()
{
	N = normalize(mat3(NormalMatrix) * in_normal);	
	T = normalize(mat3(NormalMatrix) * in_tex1);
	B = normalize(cross(N, T));
				
	tex0 = in_tex0;
	
	vec4 pos = (MVMatrix * vec4(in_pos, 1.0));
		
	fogdist = abs(pos.z);
    vertexpos = pos.xyz;
    V = pos.xyz;

 	gl_Position = ProjectionMatrix * pos;
}
