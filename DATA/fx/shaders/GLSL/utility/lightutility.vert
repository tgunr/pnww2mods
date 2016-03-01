#version 120

#define NUM_LIGHTS	2

void lightGetAmbientDiffuse(in vec3 normal, out vec4 ambient, out vec4 diffuse)
{
	vec3 L;
	float d;
	
	for(int i = 0; i < NUM_LIGHTS; i++)
	{
		L = normalize(gl_LightSource[i].position.xyz);	
				
		d = max(dot(normal, L), 0.0);
		
		diffuse += d * gl_LightSource[i].diffuse;	
		ambient += gl_LightSource[i].ambient;
	}
}

