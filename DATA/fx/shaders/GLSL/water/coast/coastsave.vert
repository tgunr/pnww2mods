uniform float time;

const vec2 speed = vec2(0.001, 0.001);

const float texscale = 5.0;
const float bscale = 10.0;

varying vec3 Ltan;
varying vec3 Vtan;
varying vec3 Htan;
varying float fogFactor;

varying float facing;

float fogValue(float);
vec4 getLightPosition();

const mat4 Mr = mat4(0.5, 0.0, 0.0, 0.0,
    	             0.0, 0.5, 0.0, 0.0,
		             0.0, 0.0, 0.5, 0.0,
		             0.5, 0.5, 0.5, 1.0);

void main()
{
	vec3 N = normalize(gl_NormalMatrix * vec3(0, 0, 1));
	vec3 T = normalize(gl_NormalMatrix * vec3(1, 0, 0));
	vec3 B = normalize(cross(N, T));
	
	vec2 uv = gl_MultiTexCoord0.xy * texscale;
	vec2 bs = time * speed;
	
	gl_TexCoord[0].xy = uv + bs;
	gl_TexCoord[1].xy = 2.0 * (uv - bs * 2.0);
	gl_TexCoord[1].zw = 2.0 * (uv + bs * 2.0);
				
	vec4 ecPosition = gl_ModelViewMatrix * gl_Vertex;

	// Returns the correct light for a specific pass
	vec4 lightposition = getLightPosition();

	vec3 V = normalize(-ecPosition.xyz);	
	vec3 L = normalize(lightposition.xyz);	
	vec3 H = normalize(V + L);

	Ltan.x = dot(L, T);
	Ltan.y = dot(L, B);
	Ltan.z = dot(L, N);
	
	Vtan.x = dot(V, T);
	Vtan.y = dot(V, B);
	Vtan.z = dot(V, N);
	
	Htan.x = dot(H, T);
	Htan.y = dot(H, B);
	Htan.z = dot(H, N);
		    	    
 	gl_Position = ftransform();
	
	mat4 mat = gl_ModelViewMatrix;
	mat[3][2] -= 1.0;
	
	// For projection
	gl_TexCoord[2] = Mr * gl_ProjectionMatrix * mat * gl_Vertex;

	facing = 1.0 - max(dot(N, V), 0.0);
		
	fogFactor = fogValue(gl_Position.z);
}
