#version 120

uniform vec2 cameraangle;
uniform vec3 treepos;
uniform vec4 rotation;

varying vec3 N;
varying vec3 T;
varying vec3 B;
varying vec3 vertexpos;

uniform float diffuseScale;

void main()
{
	float dimming = gl_MultiTexCoord2.w;
	
	vec3 normal = gl_Normal;
	vec3 tangent = gl_MultiTexCoord3.xyz;
	
	vec4 position = gl_MultiTexCoord1;;
	position.xy = vec2(dot(rotation.yxw, position.xyz), dot(rotation.zyw, position.xyz));
			
    gl_TexCoord[1].x = dimming * diffuseScale;

	vec3 cornerpt = gl_Vertex.xyz;

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
               
	cornerpt = rot * cornerpt;
	    
 	normal.xy = vec2(dot(rotation.yxw, normal), dot(rotation.zyw, normal));
	N = normalize(gl_NormalMatrix * normal);
	
    tangent.xy = vec2(dot(rotation.yxw, tangent), dot(rotation.zyw, tangent));
	T = normalize(gl_NormalMatrix * tangent);
  
    B = cross(normal, tangent);
	
	position.xyz += cornerpt + treepos.xyz;
	position.w = 1.0;
	
	position = gl_ModelViewMatrix * position;
	gl_FogFragCoord = abs(position.z);

	gl_Position = gl_ProjectionMatrix * position;
	gl_TexCoord[0] = gl_MultiTexCoord0;
    gl_TexCoord[0].z = 0.0f;
    gl_TexCoord[0].w = 1.0f;
	vertexpos = position.xyz;
}
