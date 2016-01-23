uniform float billboardAzimuth;

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
			
	alpha = 1.0 - alpha + 0.3294112; //84.0 / 255.0;
	
	gl_TexCoord[0].xy = gl_MultiTexCoord0.xy;
	gl_TexCoord[0].z = alpha;
	gl_TexCoord[0].w = gl_MultiTexCoord0.z;
		
	pos = gl_ModelViewMatrix * pos;
	gl_FogFragCoord = abs(pos.z);
	
	gl_Position = gl_ProjectionMatrix * pos;
}
