#version 120

uniform vec2 cameraangle;
uniform vec3 treepos;
uniform vec4 rotation;

void main()
{
	int corner = int(gl_Vertex.w);
	
	vec4 position = gl_MultiTexCoord1;
	position.xy = vec2(dot(rotation.yxw, position.xyz), dot(rotation.zyw, position.xyz));
		
	float c1 = cos(cameraangle.x + gl_MultiTexCoord2.x);
	float s1 = sin(cameraangle.x + gl_MultiTexCoord2.x);
	float c2 = cos(cameraangle.y + gl_MultiTexCoord2.y);
	float s2 = sin(cameraangle.y + gl_MultiTexCoord2.y);

	// rotz * roty
	mat3 rot = mat3(c1 * c2, -s1 * c2, -s2,
                    s1, c1, 0,
	                c1 * s2, -s1 * s2, c2);
               
	vec3 cornerpt = rot * gl_Vertex.xyz;

	position.xyz += cornerpt + treepos.xyz;
	position.w = 1.0;
		
	gl_Position = gl_ProjectionMatrix * (gl_ModelViewMatrix * position);
	gl_TexCoord[0] = gl_MultiTexCoord0;
}
