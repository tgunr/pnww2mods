#version 120

uniform float time;

const float texscale = 25.0;

const vec2 speed = vec2(0.005, 0.005);

varying vec3 vertexpos;
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
    
    vec2 uv =  gl_MultiTexCoord0.xy * texscale;
	vec2 bs = time * speed;

    uv.y = 1.0 - uv.y;

	gl_TexCoord[0].xy = uv;
	gl_TexCoord[0].zw = uv + bs;
	gl_TexCoord[1].xy = 2.5 * (uv - bs);
	gl_TexCoord[1].zw = 4.0 * (uv + bs);
    gl_TexCoord[4].xy = gl_MultiTexCoord0.xy;

    vec4 pos = gl_Vertex;

    pos.z += sin(time) * 0.015;
    pos = gl_ModelViewMatrix * pos;

    vertexpos = pos.xyz;
	
	gl_Position = gl_ProjectionMatrix * pos;

	gl_TexCoord[2] = Mr * gl_Position;
	gl_FogFragCoord = abs(vertexpos.z);
}
