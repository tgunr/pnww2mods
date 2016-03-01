#version 120

varying vec3 vertexpos;

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
			
	alpha = 1.0 - alpha + 0.3294112; //84.0 / 255.0;
	
	gl_TexCoord[0].xy = gl_MultiTexCoord0.xy;

	gl_TexCoord[1].xyz = gl_MultiTexCoord1.xyz;
	gl_TexCoord[1].w = alpha;
	
	pos = gl_ModelViewMatrix * pos;
	vertexpos = pos.xyz;
	
	gl_FogFragCoord = abs(pos.z);
	
	gl_Position = gl_ProjectionMatrix * pos;
}
