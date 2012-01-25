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
    mat4 b_TextureMatrix3;
    mat4 b_TextureMatrix4;
    mat4 b_TextureMatrix5;
    mat4 b_TextureMatrix6;
    mat4 b_TextureMatrix7;
};

uniform vec2 uv[64];

uniform vec3 origin;

const float ss = 1.0 / 800.0;

const vec4 sPlane = vec4(ss, 0.0, 0.0, 0.0);
const vec4 tPlane = vec4(0.0, -ss, 0.0, 0.0);

in vec4 in_pos;

out vec3 tex0;
out vec2 tex2;
out vec4 tex3;
out vec4 tex4;
out vec4 tex5;
out vec3 eyepos;
out float fogdist;

in float in_tex0;

void main()
{   
    vec4 p1;

    p1.xy = in_pos.xy;
    p1.xy += origin.xy;

    p1.z = in_pos.z;
    p1.w = 1.0;

    tex2.x = p1.x * sPlane.x + 0.5;
    tex2.y = p1.y * tPlane.y + 0.5;

    p1 = b_MVMatrix * p1;

    tex3 = b_TextureMatrix2 * p1;
    tex4 = b_TextureMatrix3 * p1;
    tex5 = b_TextureMatrix4 * p1;

    tex3.z = 1.0 - tex3.z;
    tex4.z = 1.0 - tex4.z;
    tex5.z = 1.0 - tex5.z;

    int c = int(in_pos.w);

    eyepos = p1.xyz;
    fogdist = abs(eyepos.z);

    tex0.xy = uv[c];
    tex0.z = in_tex0;

	gl_Position = b_ProjectionMatrix * p1;
}
