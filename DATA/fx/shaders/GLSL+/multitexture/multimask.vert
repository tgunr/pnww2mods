#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MatrixBlock
{
    mat4 b_MVMatrix;  
    mat4 b_NormalMatrix;
    mat4 b_ProjectionMatrix;
};

uniform TextureMatrixBlock
{
    mat4 b_TextureMatrix0;
    mat4 b_TextureMatrix1;
    mat4 b_TextureMatrix2;
};

in vec3 in_pos;
in vec3 in_normal;
in vec2 in_tex0;

out vec3 N;
out float fogdist;
out vec3 eyepos;
out vec2 tex0;
out vec2 tex1;
out vec2 tex2;
out vec2 tex3;
out vec2 tex4;

void main()
{
    tex0 = (b_TextureMatrix0 * vec4(in_tex0, 1.0, 1.0)).xy;
    tex1 = (b_TextureMatrix0 * vec4(in_tex0, 1.0, 1.0)).xy;
    tex2 = (b_TextureMatrix1 * vec4(in_tex0, 1.0, 1.0)).xy;
    tex3 = (b_TextureMatrix1 * vec4(in_tex0, 1.0, 1.0)).xy;
    tex4 = in_tex0;

    vec4 pos = b_MVMatrix * vec4(in_pos, 1.0);
    eyepos = pos.xyz;

    N = mat3(b_NormalMatrix) * in_normal;

    fogdist = abs(eyepos.z);

    gl_Position = b_ProjectionMatrix * pos;
}
