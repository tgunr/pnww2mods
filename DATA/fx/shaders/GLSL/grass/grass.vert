uniform vec2 periods;

void main()
{
	vec3 r0 = vec3(0, 0, 0);
	vec3 r1 = vec3(0, 0, 0);
	
	r0 = gl_Vertex.xyz * periods.y;
	r0.x += periods.x;
	
	// 0.3183098 = 1/PI
	
	r1.x = 0.3183098 * r0.x;
	
	float sine = sin(r1.x);
	float cose = cos(r1.x);
	
	float throw = gl_MultiTexCoord1.x;
	
	vec4 windpos;
	
	windpos.x = cose * throw + gl_Vertex.x;
	windpos.y = sine * throw + gl_Vertex.y;
	windpos.z = gl_Vertex.z;
	windpos.w = 1.0;

	gl_TexCoord[0] = gl_TextureMatrix[0] * gl_MultiTexCoord0;
	
	windpos = gl_ModelViewMatrix * windpos;
	gl_FogFragCoord = abs(windpos.z);
	
	gl_Position = gl_ProjectionMatrix * windpos;
}
