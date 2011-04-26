#version 120

uniform vec2 cameraangle;
uniform vec3 treepos;
uniform vec4 rotation;

void main()
{
	int corner = int(gl_Vertex.w);
	
	vec4 position = gl_MultiTexCoord1;
	position.xy = vec2(dot(rotation.yxw, position.xyz), dot(rotation.zyw, position.xyz));
		
	// rotation z
	float z11, z12, z21, z22;
	
	z11 = cos(cameraangle.x + gl_MultiTexCoord2.x);
	z12 = sin(cameraangle.x + gl_MultiTexCoord2.x);
	z21 = -z12;
	z22 = z11;
	
    // rotation y
	float y11, y13, y31, y33;
	
	y11 = cos(cameraangle.y + gl_MultiTexCoord2.y);
	y13 = sin(cameraangle.y + gl_MultiTexCoord2.y);
	y31 = -y13;
	y33 = y11;
	
	// rotz * roty
	mat3 rot = mat3(z11 * y11, z21 * y11, y31,
                    z12, z22, 0,
	                z11 * y13, z21 * y13, y33);
               
	vec3 cornerpt = rot * gl_Vertex.xyz;

	position.xyz += cornerpt + treepos.xyz;
	position.w = 1.0;
		
	gl_Position = gl_ProjectionMatrix * (gl_ModelViewMatrix * position);
	gl_TexCoord[0] = gl_MultiTexCoord0;
}
