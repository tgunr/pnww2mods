#version 120

uniform vec2 cameraangle;
uniform vec3 treepos;
uniform vec4 rotation;

varying vec3 N;
varying vec3 vertexpos;

void main()
{
	float dimming = gl_MultiTexCoord2.w;
	
	int corner = int(gl_Vertex.w);
	
    vec4 leafrot = vec4(rotation.xyz, 0.0f);

	vec4 position = gl_MultiTexCoord1;
	position.xy = vec2(dot(leafrot.yxw, position.xyz), dot(leafrot.zyw, position.xyz));
	
	vec3 normal = gl_Normal;
	normal.xy = vec2(dot(leafrot.yxw, gl_Normal), dot(leafrot.zyw, gl_Normal));
	
	N = gl_NormalMatrix * normal;
		
	vec3 cornerpt = gl_Vertex.xyz;

	float c1 = cos(cameraangle.x + gl_MultiTexCoord2.x);
	float s1 = sin(cameraangle.x + gl_MultiTexCoord2.x);
	float c2 = cos(cameraangle.y + gl_MultiTexCoord2.y);
	float s2 = sin(cameraangle.y + gl_MultiTexCoord2.y);

	// rotz * roty
	mat3 rot = mat3(c1 * c2, -s1 * c2, -s2,
                    s1, c1, 0,
	                c1 * s2, -s1 * s2, c2);
               
	cornerpt = rot * cornerpt;

	position.xyz += cornerpt + treepos.xyz;
	position.w = 1.0;
	
	position = gl_ModelViewMatrix * position;
	vertexpos = position.xyz;
	
	gl_FogFragCoord = abs(position.z);

	gl_Position = gl_ProjectionMatrix * position;
	gl_TexCoord[0] = gl_MultiTexCoord0;
	gl_TexCoord[0].z = dimming;	
    gl_TexCoord[0].w = rotation.w;
}
