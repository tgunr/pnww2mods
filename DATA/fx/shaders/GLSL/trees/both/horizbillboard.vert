uniform float billboardAzimuth;

varying float fog;
varying vec3 T;
varying vec3 B;
varying vec3 N;

void main()
{
	int corner = int(gl_Vertex.w);

	vec4 pos;
	pos.xyz = gl_Vertex.xyz;
	pos.w = 1.0;
	
	float alpha = gl_Vertex.w;
				
	vec4 rotation = gl_MultiTexCoord1;
	
	pos.xy = vec2(dot(rotation.yxw, pos.xyz), dot(rotation.zyw, pos.xyz));

	pos.xyz += gl_MultiTexCoord2.xyz;
	
	T = normalize(gl_NormalMatrix * vec3(1, 0, 0));
	N = normalize(gl_NormalMatrix * vec3(0, 0, 1));
	B = normalize(cross(N, T));
		
	alpha = 1.0 - alpha + 0.3294112; //84.0 / 255.0;
	
	gl_TexCoord[0].xy = gl_MultiTexCoord0.xy;
	gl_TexCoord[0].z = alpha;
	gl_TexCoord[0].w = gl_MultiTexCoord0.z;
	
	// Normal Texcoords
	gl_TexCoord[1].xy = gl_TexCoord[0].xy;

	pos = gl_ModelViewMatrix * pos;
	gl_FogFragCoord = abs(pos.z);
	
	gl_Position = gl_ProjectionMatrix * pos;
}
