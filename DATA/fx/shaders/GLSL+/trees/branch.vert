#version 150

uniform mat4 MVMatrix;
uniform mat4 ProjectionMatrix;
uniform mat3 NormalMatrix;

uniform vec4 rotation;
uniform vec3 treepos;

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

void main()
{
   vec4 position = vec4(in_pos, 1.0);

   vec3 tangent = in_tangent;

   /* Rotate Tree */
   position.xy = vec2(dot(rotation.yxw, position.xyz), dot(rotation.zyw, position.xyz));
   
   /* Rotate Normal */
   vec3 normal;
   normal.xy = vec2(dot(rotation.yxw, in_normal), dot(rotation.zyw, in_normal));
   normal.z = in_normal.z;
   
   /* Set tree to world position */
   position.xyz += treepos.xyz;
   position.w = 1.0;

   /* Apply normal mapping */
   tangent.xy = vec2(dot(rotation.yxw, tangent.xyz), dot(rotation.zyw, tangent.xyz));
   vec3 binormal = cross(normal, tangent);
     
   T = normalize(NormalMatrix * tangent);
   B = normalize(NormalMatrix * binormal);
   N = normalize(NormalMatrix * normal);
     
   position = MVMatrix * position;
   fogdist = abs(position.z);
      
   tex0 = in_tex0;
   tex1 = in_tex1;

   vertexpos = position.xyz;

   gl_Position = ProjectionMatrix * position;
}
