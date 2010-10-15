#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform InstanceBlock
{
    vec4 rotation[1000];
	vec4 position[1000];
};

uniform MatrixBlock
{
    mat4 MVMatrix;  
    mat4 NormalMatrix;
    mat4 ProjectionMatrix;
};

in vec3 in_pos;
in vec3 in_normal;
in vec3 in_tangent;
in vec2 in_tex0;
in vec4 in_tex1;

out vec3 T;
out vec3 B;
out vec3 N;
out vec3 vertexpos;
out vec2 tex0;
out vec4 tex1;
out float fogdist;
out float alphatest;

void main() 
{   
    vec4 inpos = vec4(in_pos, 1.0);

    vec3 tangent = in_tangent;

    vec4 rot = rotation[gl_InstanceID];
    vec3 pos = position[gl_InstanceID].xyz;
    alphatest = position[gl_InstanceID].w;

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
     
    mat3 normalmatrix = mat3(NormalMatrix);

    T = normalize(normalmatrix * tangent);
    B = normalize(normalmatrix * binormal);
    N = normalize(normalmatrix * normal);

    inpos = MVMatrix * inpos;
    fogdist = abs(inpos.z);
      
    tex0 = in_tex0;
    tex1 = in_tex1;

    vertexpos = inpos.xyz;

    gl_Position = ProjectionMatrix * inpos;
}
