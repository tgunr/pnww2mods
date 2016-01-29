#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MatrixBlock
{
    mat4 b_MVMatrix;  
    mat4 b_NormalMatrix;
    mat4 b_ProjectionMatrix;
};

in vec3 in_pos;
in vec3 in_normal;
in vec2 in_tex0;
in vec3 in_tex1;

out vec3 T;
out vec3 B;
out vec3 N;
out vec2 tex0;

out float fogdist;
out vec3 eyepos;

float fogValue(float);

void main()
{
	N = normalize(mat3(b_NormalMatrix) * in_normal);	
	T = normalize(mat3(b_NormalMatrix) * in_tex1);
	B = normalize(cross(N, T));
				
	tex0 = in_tex0;
	
	vec4 pos = (b_MVMatrix * vec4(in_pos, 1.0));
		
	fogdist = abs(pos.z);
    eyepos = pos.xyz;

 	gl_Position = b_ProjectionMatrix * pos;
}
