#version 120

uniform struct
{
	float enabled;
	float kc;
	float kl;
	float kq;
	vec3 dir;
	vec3 pos;
	vec4 diffuse;
	vec4 ambient;
	vec4 specular;
} lightsource[4];

varying vec3 vertexpos;

const vec4 zerovector = vec4(0, 0, 0, 0);

/*----------------------------------------------------------
Return total diffuse (usually for billboard lighting)
-----------------------------------------------------------*/
void lightGetDiffuse(out vec4 diffuse)
{
	diffuse = zerovector;
	float a;
	float d;
	
	if(lightsource[0].enabled > 0.0)
	{	
		diffuse += lightsource[0].diffuse;
	}

	if(lightsource[1].enabled > 0.0)
	{	
		diffuse += lightsource[1].diffuse;
	}

	if(lightsource[2].enabled > 0.0)
	{
		d = distance(vertexpos, lightsource[2].pos);   
		a = 1.0 / clamp(lightsource[2].kc + d * (lightsource[2].kl + lightsource[2].kq * d), 1.0, 10000.0);
		
		diffuse += a * lightsource[2].diffuse;
	}

	if(lightsource[3].enabled > 0.0)
	{
		d = distance(vertexpos, lightsource[3].pos);   
		a = 1.0 / clamp(lightsource[3].kc + d * (lightsource[3].kl + lightsource[3].kq * d), 1.0, 10000.0);
		
		diffuse += a * lightsource[3].diffuse;
	}
}

/*----------------------------------------------------------
Return total ambient
-----------------------------------------------------------*/
void lightGetAmbient(out vec4 ambient)
{
	ambient = zerovector;
	float a;
	float d;

	if(lightsource[0].enabled > 0.0)
	{
		ambient += lightsource[0].ambient;
	}

    if(lightsource[1].enabled > 0.0)
	{
		ambient += lightsource[1].ambient;
	}

    if(lightsource[2].enabled > 0.0)
	{
		d = distance(vertexpos, lightsource[2].pos);   
		a = 1.0 / clamp(lightsource[2].kc + d * (lightsource[2].kl + lightsource[2].kq * d), 1.0, 10000.0);
		
		ambient += a * lightsource[2].ambient;
	}

	if(lightsource[3].enabled > 0.0)
	{
		d = distance(vertexpos, lightsource[3].pos);   
		a = 1.0 / clamp(lightsource[3].kc + d * (lightsource[3].kl + lightsource[3].kq * d), 1.0, 10000.0);
		
		ambient += a * lightsource[3].ambient;
	}
}

/*----------------------------------------------------------
Non-tangent space lighting for ambient and diffuse
-----------------------------------------------------------*/
void lightGetAmbientDiffuse(out vec4 ambient, out vec4 diffuse)
{	
	ambient = zerovector;
	diffuse = zerovector;
	float a;
	float d;

	if(lightsource[0].enabled > 0.0)
	{	
		diffuse += lightsource[0].diffuse;	
		ambient += lightsource[0].ambient;
	}

	if(lightsource[1].enabled > 0.0)
	{	
		diffuse += lightsource[1].diffuse;	
		ambient += lightsource[1].ambient;
	}

	if(lightsource[2].enabled > 0.0)
	{
		d = distance(vertexpos, lightsource[2].pos);   
		a = 1.0 / clamp(lightsource[2].kc + d * (lightsource[2].kl + lightsource[2].kq * d), 1.0, 10000.0);
		
		diffuse += a * lightsource[2].diffuse;	
		ambient += a * lightsource[2].ambient;
	}

	if(lightsource[3].enabled > 0.0)
	{
		d = distance(vertexpos, lightsource[3].pos);   
		a = 1.0 / clamp(lightsource[3].kc + d * (lightsource[3].kl + lightsource[3].kq * d), 1.0, 10000.0);
		
		diffuse += a * lightsource[3].diffuse;	
		ambient += a * lightsource[3].ambient;
	}
}

/*----------------------------------------------------------
Non-tangent space lighting for ambient and diffuse with normal
-----------------------------------------------------------*/
void lightGetAmbientDiffuse(in vec3 normal,
                            out vec4 ambient,
                            out vec4 diffuse)
{
	vec3 L;
	float d;
	
	ambient = zerovector;
	diffuse = zerovector;
	float a;
	
	if(lightsource[0].enabled > 0.0)
	{
		L = lightsource[0].dir;
		
		d = max(dot(normal, L), 0.0);
				
		diffuse += d * lightsource[0].diffuse;	

		ambient += lightsource[0].ambient;
	}

	if(lightsource[1].enabled > 0.0)
	{
		L = lightsource[1].dir;
			
		d = max(dot(normal, L), 0.0);
				
		diffuse += d * lightsource[1].diffuse;	

		ambient += lightsource[1].ambient;
	}

	if(lightsource[2].enabled > 0.0)
	{
		d = distance(vertexpos, lightsource[2].pos);   
		a = 1.0 / clamp(lightsource[2].kc + d * (lightsource[2].kl + lightsource[2].kq * d), 1.0, 10000.0);

		L = lightsource[2].dir;
		
		d = max(dot(normal, L), 0.0);
				
		diffuse += a * d * lightsource[2].diffuse;	

		ambient += a * lightsource[2].ambient;
	}

	if(lightsource[3].enabled > 0.0)
	{
		d = distance(vertexpos, lightsource[3].pos);   
		a = 1.0 / clamp(lightsource[3].kc + d * (lightsource[3].kl + lightsource[3].kq * d), 1.0, 10000.0);

		L = lightsource[3].dir;
		
		d = max(dot(normal, L), 0.0);
				
		diffuse += a * d * lightsource[3].diffuse;	

		ambient += a * lightsource[3].ambient;
	}
}
                
/*----------------------------------------------------------
Non-tangent space lighting for ambient, diffuse, specular with normal
-----------------------------------------------------------*/
void lightGetAmbientDiffuseSpecular(in vec3 normal,
						            in vec3 V,
                                    out vec4 ambient,
                                    out vec4 diffuse,
                                    out vec4 specular)
{
	vec3 L;
	vec3 H;
	float d;
	float s;

	ambient = zerovector;
	diffuse = zerovector;
	specular = zerovector;
	float a;
	
	float level = gl_FrontMaterial.shininess;

	if(lightsource[0].enabled > 0.0)
	{
		L = lightsource[0].dir;	
			
		d = max(dot(normal, L), 0.0);
	
		if(d > 0.0)
		{
			diffuse += d * lightsource[0].diffuse;
		
			H = normalize(L + V);
			s = max(dot(normal, H), 0.0);
			s = pow(s, level);
		
			specular += s * lightsource[0].specular;
		}
	
		ambient += lightsource[0].ambient;
	}

	if(lightsource[1].enabled > 0.0)
	{
		L = lightsource[1].dir;	
			
		d = max(dot(normal, L), 0.0);
	
		if(d > 0.0)
		{
			diffuse += d * lightsource[1].diffuse;
		
			H = normalize(L + V);
			s = max(dot(normal, H), 0.0);
			s = pow(s, level);
		
			specular += s * lightsource[1].specular;
		}
	
		ambient += lightsource[1].ambient;
	}

	if(lightsource[2].enabled > 0.0)
	{
		d = distance(vertexpos, lightsource[2].pos);   
		a = 1.0 / clamp(lightsource[2].kc + d * (lightsource[2].kl + lightsource[2].kq * d), 1.0, 10000.0);

		L = lightsource[2].dir;	
			
		d = max(dot(normal, L), 0.0);
	
		if(d > 0.0)
		{
			diffuse += a * d * lightsource[2].diffuse;
		
			H = normalize(L + V);
			s = max(dot(normal, H), 0.0);
			s = pow(s, level);
		
			specular += a * s * lightsource[2].specular;
		}
	
		ambient += a * lightsource[2].ambient;
	}

	if(lightsource[3].enabled > 0.0)
	{
		d = distance(vertexpos, lightsource[3].pos);   
		a = 1.0 / clamp(lightsource[3].kc + d * (lightsource[3].kl + lightsource[3].kq * d), 1.0, 10000.0);

		L = lightsource[3].dir;	
			
		d = max(dot(normal, L), 0.0);
	
		if(d > 0.0)
		{
			diffuse += a * d * lightsource[3].diffuse;
		
			H = normalize(L + V);
			s = max(dot(normal, H), 0.0);
			s = pow(s, level);
		
			specular += a * s * lightsource[3].specular;
		}
	
		ambient += a * lightsource[3].ambient;
	}
}

/*----------------------------------------------------------
Tangent space lighting for ambient and diffuse
-----------------------------------------------------------*/
void lightGetAmbientDiffuse(in vec3 t,
                            in vec3 b,
                            in vec3 n,
                            in vec3 normal,
                            out vec4 ambient, 
                            out vec4 diffuse)
{
	vec3 L;
	vec3 Ltan;
	float d;
	
	ambient = zerovector;
	diffuse = zerovector;
	float a;
	
	if(lightsource[0].enabled > 0.0)
	{
		L = lightsource[0].dir;
		
		Ltan.x = dot(L, t);
		Ltan.y = dot(L, b);
		Ltan.z = dot(L, n);
		
		d = max(dot(normal, Ltan), 0.0);
				
		diffuse += d * lightsource[0].diffuse;	

		ambient += lightsource[0].ambient;
	}

	if(lightsource[1].enabled > 0.0)
	{
		L = lightsource[1].dir;
		
		Ltan.x = dot(L, t);
		Ltan.y = dot(L, b);
		Ltan.z = dot(L, n);
		
		d = max(dot(normal, Ltan), 0.0);
				
		diffuse += d * lightsource[1].diffuse;	

		ambient += lightsource[1].ambient;
	}

	if(lightsource[2].enabled > 0.0)
	{
		d = distance(vertexpos, lightsource[2].pos);   
		a = 1.0 / clamp(lightsource[2].kc + d * (lightsource[2].kl + lightsource[2].kq * d), 1.0, 10000.0);

		L = lightsource[2].dir;
		
		Ltan.x = dot(L, t);
		Ltan.y = dot(L, b);
		Ltan.z = dot(L, n);
		
		d = max(dot(normal, Ltan), 0.0);
				
		diffuse += a * d * lightsource[2].diffuse;	

		ambient += a * lightsource[2].ambient;
	}

	if(lightsource[3].enabled > 0.0)
	{
		d = distance(vertexpos, lightsource[3].pos);   
		a = 1.0 / clamp(lightsource[3].kc + d * (lightsource[3].kl + lightsource[3].kq * d), 1.0, 10000.0);

		L = lightsource[3].dir;
		
		Ltan.x = dot(L, t);
		Ltan.y = dot(L, b);
		Ltan.z = dot(L, n);
		
		d = max(dot(normal, Ltan), 0.0);
				
		diffuse += a * d * lightsource[3].diffuse;	

		ambient += a * lightsource[3].ambient;
	}
}

/*----------------------------------------------------------
Tangent space lighting for ambient, diffuse and specular
-----------------------------------------------------------*/
void lightGetAmbientDiffuseSpecular(in vec3 t,
                                    in vec3 b,
                                    in vec3 n,
                                    in vec3 V,
                                    in vec3 normal,
                                    out vec4 ambient, 
                                    out vec4 diffuse,
                                    out vec4 specular)
{
	vec3 L;
	vec3 H;
	vec3 Ltan;
	vec3 Htan;
	float d;
	float s;
	
	ambient = zerovector;
	diffuse = zerovector;
	specular = zerovector;

	float level = gl_FrontMaterial.shininess;
	float a;
	
	if(lightsource[0].enabled > 0.0)
	{
		L = lightsource[0].dir;
		
		Ltan.x = dot(L, t);
		Ltan.y = dot(L, b);
		Ltan.z = dot(L, n);
		
		d = max(dot(normal, Ltan), 0.0);
				
		diffuse += d * lightsource[0].diffuse;
		
		H = normalize(L + V);
		
		// Tangent
		Htan.x = dot(H, t);
		Htan.y = dot(H, b);
		Htan.z = dot(H, n);
	
		s = max(dot(normal, Htan), 0.0);
		s = pow(s, level);
		
		specular += s * lightsource[0].specular;

		ambient += lightsource[0].ambient;
	}

	if(lightsource[1].enabled > 0.0)
	{
		L = lightsource[1].dir;
		
		Ltan.x = dot(L, t);
		Ltan.y = dot(L, b);
		Ltan.z = dot(L, n);
		
		d = max(dot(normal, Ltan), 0.0);
				
		diffuse += d * lightsource[1].diffuse;
			
		H = normalize(L + V);
		
		// Tangent
		Htan.x = dot(H, t);
		Htan.y = dot(H, b);
		Htan.z = dot(H, n);
	
		s = max(dot(normal, Htan), 0.0);
		s = pow(s, level);
		
		specular += s * lightsource[1].specular;

		ambient += lightsource[1].ambient;
	}

	if(lightsource[2].enabled > 0.0)
	{
		d = distance(vertexpos, lightsource[2].pos);   
		a = 1.0 / clamp(lightsource[2].kc + d * (lightsource[2].kl + lightsource[2].kq * d), 1.0, 10000.0);

		L = lightsource[2].dir;
		
		Ltan.x = dot(L, t);
		Ltan.y = dot(L, b);
		Ltan.z = dot(L, n);
		
		d = max(dot(normal, Ltan), 0.0);
				
		diffuse += a * d * lightsource[2].diffuse;
			
		H = normalize(L + V);
		
		// Tangent
		Htan.x = dot(H, t);
		Htan.y = dot(H, b);
		Htan.z = dot(H, n);
	
		s = max(dot(normal, Htan), 0.0);
		s = pow(s, level);
		
		specular += a * s * lightsource[2].specular;

		ambient += a * lightsource[2].ambient;
	}

	if(lightsource[3].enabled > 0.0)
	{
		d = distance(vertexpos, lightsource[3].pos);   
		a = 1.0 / clamp(lightsource[3].kc + d * (lightsource[3].kl + lightsource[3].kq * d), 1.0, 10000.0);

		L = lightsource[3].dir;
		
		Ltan.x = dot(L, t);
		Ltan.y = dot(L, b);
		Ltan.z = dot(L, n);
		
		d = max(dot(normal, Ltan), 0.0);
				
		diffuse += a * d * lightsource[3].diffuse;
			
		H = normalize(L + V);
		
		// Tangent
		Htan.x = dot(H, t);
		Htan.y = dot(H, b);
		Htan.z = dot(H, n);
	
		s = max(dot(normal, Htan), 0.0);
		s = pow(s, level);
		
		specular += a * s * lightsource[3].specular;

		ambient += a * lightsource[3].ambient;
	}
}
