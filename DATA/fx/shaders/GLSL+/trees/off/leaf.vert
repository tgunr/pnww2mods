#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform vec2 cameraangle;

uniform float diffuseScale;

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
in vec3 in_center;
in vec3 in_normal;
in vec4 in_params;
in vec2 in_uv;

out vec3 N;
out vec3 vertexpos;
out float diffcoef;
out float fogdist;
out vec2 uv;

void main()
{
	float azimuth = cameraangle.x;
	float pitch = cameraangle.y;

	float rotatex = in_params.x;
	float rotatey = in_params.y;
	float dimming = in_params.w;
	
	vec3 normal = in_normal;
	
	vec4 position = vec4(in_center, 1.0);
	position.xy = vec2(dot(rotation.yxw, position.xyz), dot(rotation.zyw, position.xyz));
			
    diffcoef = dimming * diffuseScale;

	vec3 cornerpt = in_pos.xyz;

	// rotation z
	float z11, z12, z21, z22;
	
	z11 = cos(azimuth + rotatex);
	z12 = -sin(azimuth + rotatex);
	z21 = z12;
	z22 = z11;
	z12 = -z12;
	
        // rotation y
	float y11, y13, y31, y33;
	
	y11 = cos(pitch + rotatey);
	y13 = -sin(pitch + rotatey);
	y31 = y13;
	y33 = y11;
	y13 = -y13;
	
	// rotz * roty
	mat3 rot = mat3(z11 * y11, z21 * y11, y31,
                    z12, z22, 0,
	                z11 * y13, z21 * y13, y33);
               
	cornerpt = rot * cornerpt;
	    
 	normal.xy = vec2(dot(rotation.yxw, normal), dot(rotation.zyw, normal));
	N = normalize(mat3(NormalMatrix) * normal);
	
	position.xyz += cornerpt + treepos.xyz;
	position.w = 1.0;
	
	position = MVMatrix * position;
	fogdist = abs(position.z);

	gl_Position = ProjectionMatrix * position;

	uv = in_uv.xy;

	vertexpos = position.xyz;
}
