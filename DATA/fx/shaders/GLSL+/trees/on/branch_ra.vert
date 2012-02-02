#version 150
#extension GL_ARB_uniform_buffer_object : enable
#extension GL_EXT_gpu_shader4 : enable                             

uniform MatrixBlock
{
    mat4 b_MVMatrix;  
    mat4 b_NormalMatrix;
    mat4 b_ProjectionMatrix;
};

uniform TreeInstanceBlock
{
    vec4 b_rotation[250];
    vec4 b_position[250];
};

in vec3 in_pos;
in vec3 in_normal;
in vec3 in_tangent;
in vec2 in_tex0;
in vec4 in_tex1;

out vec3 T;
out vec3 B;
out vec3 N;
out vec2 tex0;
out vec4 tex1;
out float fogdist;

void main() 
{   
    vec4 inpos = vec4(in_pos, 1.0);

    vec3 tangent = in_tangent;

    vec4 rot = b_rotation[gl_InstanceID];
    vec4 pos = b_position[gl_InstanceID];

    rot.w = 0.0f;

    pos.w = 1.0;

    /* Rotate Tree */
    inpos.xy = vec2(dot(rot.yxw, inpos.xyz), dot(rot.zyw, inpos.xyz));
   
    /* Rotate Normal */
    vec3 normal;
    normal.xy = vec2(dot(rot.yxw, in_normal), dot(rot.zyw, in_normal));
    normal.z = in_normal.z;

    /* Set tree to world position */
    inpos.xyz += pos.xyz;
    inpos.w = 1.0;

    /* Apply normal mapping */
    tangent.xy = vec2(dot(rot.yxw, tangent.xyz), dot(rot.zyw, tangent.xyz));
    vec3 binormal = cross(normal, tangent);
     
    mat3 normalmatrix = mat3(b_NormalMatrix);

    T = normalize(normalmatrix * tangent);
    B = normalize(normalmatrix * binormal);
    N = normalize(normalmatrix * normal);

    inpos = b_MVMatrix * inpos;

    fogdist = abs(inpos.z);
      
    tex0 = in_tex0;
    tex1 = in_tex1;

    gl_Position = b_ProjectionMatrix * inpos;
}
