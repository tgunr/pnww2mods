#version 120

varying float fog;

varying vec3 T;
varying vec3 B;
varying vec3 N;
varying vec3 vpos;

void main()
{
	vec4 pos;
	pos.xyz = gl_Vertex.xyz;
	pos.w = 1.0;
	pos.z = 1.0;
	
	float alpha = gl_Vertex.w;
				
	vec4 rotation = gl_MultiTexCoord2;

	pos.xy = vec2(dot(rotation.yxw, pos.xyz), dot(rotation.zyw, pos.xyz));

	pos.z = gl_Vertex.z;
	
	pos.xyz += gl_MultiTexCoord3.xyz;
	
	T = vec3(-1, 0, 0);
	N = vec3(0, 0, -1);
	B = vec3(0, 1, 0);
	
	T.xy = vec2(dot(rotation.yxw, T), dot(rotation.zyw, T));
	B.xy = vec2(dot(rotation.yxw, B), dot(rotation.zyw, B));

	T = normalize(gl_NormalMatrix * T);
	N = normalize(gl_NormalMatrix * N);
	B = normalize(gl_NormalMatrix * B);
	
	alpha = 1.0 - alpha + 0.3294112; //84.0 / 255.0;
	
	gl_TexCoord[0].xy = gl_MultiTexCoord0.xy;
	// Normal Texcoords
	gl_TexCoord[2].xy = gl_TexCoord[0].xy;
	
	gl_TexCoord[1].xyz = gl_MultiTexCoord1.xyz;
	gl_TexCoord[1].w = alpha;
	
	pos = gl_ModelViewMatrix * pos;
	gl_FogFragCoord = abs(pos.z);
	
	gl_Position = gl_ProjectionMatrix * pos;
	vpos = pos.xyz;
}
