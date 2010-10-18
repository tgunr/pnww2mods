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

out vec3 N;
out float fogdist;
out vec3 eyepos;

void main()
{
	vec4 pos = vec4(in_pos, 1.0);
                                      
    pos = MVMatrix * pos;
    N = mat3(NormalMatrix) * in_normal;

    eyepos = pos.xyz;

    fogdist = abs(eyepos.z);

 	gl_Position = ProjectionMatrix * pos;
}
