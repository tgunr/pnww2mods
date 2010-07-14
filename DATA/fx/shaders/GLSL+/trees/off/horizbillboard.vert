#version 150

uniform mat4 MVMatrix;
uniform mat4 ProjectionMatrix;
uniform mat3 NormalMatrix;

in vec4 in_pos;
in vec2 in_tex0;
in vec3 in_tex1;
in vec3 in_tex2;
in vec3 in_tex3;

out vec3 N;
out vec3 vertexpos;
out vec2 tex0;
out vec4 tex1;
out float fogdist;

void main()
{
	vec4 pos;
	pos.xy = in_pos.xy;
	pos.zw = vec2(1.0, 1.0);
	
	float alpha = in_pos.w;
				
	vec4 rotation;
    rotation.xyz = in_tex2;
    rotation.w = 1.0;

	pos.xy = vec2(dot(rotation.yxw, pos.xyz), dot(rotation.zyw, pos.xyz));

	pos.z = in_pos.z;
	
	pos.xyz += in_tex3;
	
	N = normalize(NormalMatrix * vec3(0, 0, -1));
	
	alpha = 1.0 - alpha + 0.3294112; //84.0 / 255.0;
	
	tex0 = in_tex0;
	tex1.xyz = in_tex1;
	tex1.w = alpha;

	pos = MVMatrix * pos;
	fogdist = abs(pos.z);
	
	gl_Position = ProjectionMatrix * pos;
	vertexpos = pos.xyz;
}
