#version 150
#extension GL_ARB_uniform_buffer_object : enable
#extension GL_EXT_gpu_shader4 : enable                             

uniform samplerBuffer data;

uniform vec2 cameraangle;

uniform float diffuseScale;

uniform MatrixBlock
{
    mat4 b_MVMatrix;  
    mat4 b_NormalMatrix;
    mat4 b_ProjectionMatrix;
};

in vec3 in_pos;
in vec3 in_center;
in vec3 in_normal;
in vec3 in_tangent;
in vec4 in_params;
in vec2 in_tex0;

out vec3 N;
out vec3 T;
out vec3 B;
out vec3 eyepos;
out float diffcoef;
out float fogdist;
out float alphatest;
out vec2 tex0;

void main()
{
    int idx = gl_InstanceID * 2;

    float azimuth = cameraangle.x;
	float pitch = cameraangle.y;

	float rotatex = in_params.x;
	float rotatey = in_params.y;
	float dimming = in_params.w;
	
	vec3 normal = in_normal;
	vec3 tangent = in_tangent;
	
    vec4 rot = texelFetchBuffer(data, idx);
    vec4 pos = texelFetchBuffer(data, idx + 1);

    alphatest = pos.w;
    pos.w = 1.0;

	vec4 center = vec4(in_center, 1.0);
	center.xy = vec2(dot(rot.yxw, center.xyz), dot(rot.zyw, center.xyz));
			
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
	mat3 rotmat = mat3(z11 * y11, z21 * y11, y31,
                       z12, z22, 0,
	                   z11 * y13, z21 * y13, y33);
               
	cornerpt = rotmat * cornerpt;
	    
    mat3 normalmatrix = mat3(b_NormalMatrix);

 	normal.xy = vec2(dot(rot.yxw, normal), dot(rot.zyw, normal));
	N = normalize(normalmatrix * normal);
	
    tangent.xy = vec2(dot(rot.yxw, tangent), dot(rot.zyw, tangent));
	T = normalize(normalmatrix * tangent);
  
    B = cross(normal, tangent);
	
	center.xyz += cornerpt + pos.xyz;
	center.w = 1.0;
	
	center = b_MVMatrix * center;
	fogdist = abs(center.z);

	gl_Position = b_ProjectionMatrix * center;

	tex0 = in_tex0;

	eyepos = center.xyz;
}
