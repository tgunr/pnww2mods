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
in float in_tex1;

out float fogdist;
out vec3 eyepos;
out vec2 tex0;

void main()
{
    vec4 pos = vec4(in_pos.x, in_pos.y, in_pos.z + in_tex1, 1.0);
    
    pos = MVMatrix * pos;
   
    eyepos = pos.xyz;
    tex0 = in_tex0;

    fogdist = abs(eyepos.z);

	gl_Position = ProjectionMatrix * pos;
}
