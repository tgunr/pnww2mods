#version 120

uniform vec2 cameraangle;
uniform vec3 treepos;
uniform vec4 rotation;

varying vec3 N;
varying vec3 vertexpos;

void main()
{
	float azimuth = cameraangle.x;
	float pitch = cameraangle.y;
	float rotatex = gl_MultiTexCoord2.x;
	float rotatey = gl_MultiTexCoord2.y;
	float dimming = gl_MultiTexCoord2.w;
	
	int corner = int(gl_Vertex.w);
	int windangleindex = int(gl_MultiTexCoord2.z);
	
	vec4 position = vec4(gl_MultiTexCoord1.x, gl_MultiTexCoord1.y, gl_MultiTexCoord1.z, 1.0);
	position.xy = vec2(dot(rotation.yxw, position.xyz), dot(rotation.zyw, position.xyz));
	
	vec3 normal = gl_Normal;
	normal.xy = vec2(dot(rotation.yxw, gl_Normal), dot(rotation.zyw, gl_Normal));
	
	N = normalize(gl_NormalMatrix * normal);
		
	vec3 cornerpt = gl_Vertex.xyz;

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

	position.xyz += cornerpt + treepos.xyz;
	position.w = 1.0;
	
	position = gl_ModelViewMatrix * position;
	vertexpos = position.xyz;
	
	gl_FogFragCoord = abs(position.z);

	gl_Position = gl_ProjectionMatrix * position;
	gl_TexCoord[0] = gl_MultiTexCoord0;
	gl_TexCoord[1].x = dimming;	
}
