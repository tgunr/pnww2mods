#version 120

uniform vec4 rotation;
uniform vec3 treepos;

varying vec3 T;
varying vec3 B;
varying vec3 N;
varying vec3 vertexpos;

void main()
{
	vec4 position = vec4(gl_Vertex.x, gl_Vertex.y, gl_Vertex.z, 1.0);
		
	vec3 tangent = gl_MultiTexCoord2.xyz;

    vec4 rot = vec4(rotation.xyz, 0.0f);

	/* Rotate Tree */
	position.xy = vec2(dot(rot.yxw, position.xyz), dot(rot.zyw, position.xyz));
	
	/* Rotate Normal */
	vec3 normal;
	normal.xy = vec2(dot(rot.yxw, gl_Normal), dot(rot.zyw, gl_Normal));
	normal.z = gl_Normal.z;
	
	/* Set tree to world position */
	position.xyz += treepos.xyz;
	position.w = 1.0;

	/* Apply normal mapping */
	tangent.xy = vec2(dot(rot.yxw, tangent.xyz), dot(rot.zyw, tangent.xyz));
	vec3 binormal = cross(normal, tangent);
	
	// All in eye space
	T = normalize(gl_NormalMatrix * tangent);
	B = normalize(gl_NormalMatrix * binormal);
	N = normalize(gl_NormalMatrix * normal);

	position = gl_ModelViewMatrix * position;
	gl_FogFragCoord = abs(position.z);
	
	gl_Position = gl_ProjectionMatrix * position;
	
	/* Diffuse Coords */
	gl_TexCoord[0] = gl_MultiTexCoord0;
	
	/* Normal Map Coords */
	gl_TexCoord[1] = gl_MultiTexCoord1;

	vertexpos = position.xyz;
}
