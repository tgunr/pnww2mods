#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform TreeParamsBlock
{
    vec4 rotation;
    vec3 treepos;
};

uniform MatrixBlock
{
    mat4 MVMatrix;
    mat4 ProjectionMatrix;
    mat4 NormalMatrix;
};

in vec3 in_pos;
in vec3 in_normal;
in vec2 in_tex0;

out vec3 N;
out vec3 vertexpos;
out vec2 tex0;
out float fogdist;

void main()
{
   vec4 position = vec4(in_pos, 1.0);
      
   vec3 normal;
          
   position.xy = vec2(dot(rotation.yxw, position.xyz), dot(rotation.zyw, position.xyz));
   normal.xy = vec2(dot(rotation.yxw, in_normal), dot(rotation.zyw, in_normal));
   normal.z = in_normal.z;
   
   N = normalize(mat3(NormalMatrix) * normal);
   
   position.xyz += treepos;
   position.w = 1.0;
   
   position = MVMatrix * position;
   fogdist = abs(position.z);
   
   tex0 = in_tex0;  
   vertexpos = position.xyz;
   
   gl_Position = ProjectionMatrix * position;
}
