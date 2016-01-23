/*-----------------------------------------------------
Grass
------------------------------------------------------*/
uniform vec2 periods;

void main()
{
	vec3 r0 = vec3(0, 0, 0);
	vec3 r1 = vec3(0, 0, 0);
	
	vec4 ka = gl_FrontMaterial.ambient;
	vec4 kd = gl_FrontMaterial.diffuse;
	
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

	vec4 sundir = normalize(gl_LightSource[0].position);
	vec3 normal = normalize(gl_NormalMatrix * gl_Normal);
	
	float diffuse = max(dot(normal, sundir.xyz), 0.0);
	
	// TODO: implement with all active lights
	gl_FrontColor = kd * gl_LightSource[0].diffuse * diffuse 
	                + ka * gl_LightModel.ambient;
	                	
	gl_TexCoord[0] = gl_TextureMatrix[0] * gl_MultiTexCoord0;
	gl_Position = gl_ModelViewProjectionMatrix * windpos;
}
