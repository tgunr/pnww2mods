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

uniform vec2 cameraangle;

in vec3 in_pos;
in vec2 in_tex0;
in vec3 in_center;
in vec4 in_params;

out vec2 tex0;

void main()
{
    vec4 rot = b_rotation[gl_InstanceID];
    vec4 pos = b_position[gl_InstanceID];

    float azimuth = cameraangle.x;
	float pitch = cameraangle.y;

	float rotatex = in_params.x;
	float rotatey = in_params.y;
	float dimming = in_params.w;

	vec4 position = vec4(in_center, 1.0);
    rot.w = 0;

	position.xy = vec2(dot(rot.yxw, position.xyz), dot(rot.zyw, position.xyz));
		
	float c1 = cos(azimuth + rotatex);
	float s1 = sin(azimuth + rotatex);
	float c2 = cos(pitch + rotatey);
	float s2 = sin(pitch + rotatey);

	// rotz * roty
	mat3 rot2 = mat3(c1 * c2, -s1 * c2, -s2,
                     s1, c1, 0,
	                 c1 * s2, -s1 * s2, c2);
               
	vec3 cornerpt = rot2 * in_pos.xyz;

	position.xyz += cornerpt + pos.xyz;
	position.w = 1.0;
		
	gl_Position = b_ProjectionMatrix * (b_MVMatrix * position);
	tex0 = in_tex0;
}
