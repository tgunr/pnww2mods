#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MatrixBlock
{
    mat4 b_MVMatrix;  
    mat4 b_NormalMatrix;
    mat4 b_ProjectionMatrix;
};

uniform vec2 uv[64];
uniform vec3 origin;

const float ss = 1.0 / 800.0;

const vec4 sPlane = vec4(ss, 0.0, 0.0, 0.0);
const vec4 tPlane = vec4(0.0, -ss, 0.0, 0.0);

in vec4 in_pos;
in float in_tex0;

out vec3 eyepos;
out float fogdist;
out vec3 tex0;
out vec2 tex1;

void main()
{   
    vec4 p1;

    p1.xyz = in_pos.xyz - origin;
    p1.w = 1.0;

    tex1.x = p1.x * sPlane.x + 0.5;
    tex1.y = p1.y * tPlane.y + 0.5;

    int c = int(in_pos.w);

    p1 = b_MVMatrix * p1;
   
    eyepos = p1.xyz;
    
    tex0.xy = uv[c];
    tex0.z = in_tex0;

    fogdist = abs(eyepos.z);

	gl_Position = b_ProjectionMatrix * p1;
}
