#version 120

uniform float time;

const float texscale = 75.0;

const vec2 speed = vec2(0.005, 0.005);

varying vec3 V;
varying vec3 T;
varying vec3 B;
varying vec3 N;

const mat4 Mr = mat4(0.5, 0.0, 0.0, 0.0,
    	             0.0, 0.5, 0.0, 0.0,
		             0.0, 0.0, 0.5, 0.0,
		             0.5, 0.5, 0.5, 1.0);

void main()
{
	N = vec3(-gl_NormalMatrix[2][0], -gl_NormalMatrix[2][1], -gl_NormalMatrix[2][2]);
	T = vec3(gl_NormalMatrix[0][0], gl_NormalMatrix[0][1], gl_NormalMatrix[0][2]);
	B = vec3(gl_NormalMatrix[1][0], gl_NormalMatrix[1][1], gl_NormalMatrix[1][2]);

    vec4 pos = gl_ModelViewMatrix * gl_Vertex;

	vec2 uv = gl_MultiTexCoord0.xy * texscale;
	vec2 bs = time * speed;

	gl_TexCoord[0].xy = uv;
	gl_TexCoord[0].zw = uv + bs;
	gl_TexCoord[1].xy = 2.5 * (uv - bs);
	gl_TexCoord[1].zw = 4.0 * (uv + bs);
				
    gl_TexCoord[3] = gl_TextureMatrix[4] * pos;

	V = pos.xyz;
	
	gl_Position = ftransform();
			
	gl_TexCoord[2] = Mr * gl_Position;
	gl_FogFragCoord = abs(V.z);
}
