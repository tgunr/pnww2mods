#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MatrixBlock
{
    mat4 MVMatrix;  
    mat4 NormalMatrix;
    mat4 ProjectionMatrix;
};

in vec3 in_pos;
in vec3 in_normal;

out vec3 V;
out vec3 N;
out float fogdist;
out vec3 vertexpos;

void main()
{
	vec4 pos = vec4(in_pos, 1.0);
                                      
    pos = MVMatrix * pos;
    N = mat3(NormalMatrix) * in_normal;

	V = pos.xyz;
    vertexpos = pos.xyz;

    fogdist = abs(V.z);

 	gl_Position = ProjectionMatrix * pos;
}
