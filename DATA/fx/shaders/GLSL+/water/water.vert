#version 150
#extension GL_ARB_uniform_buffer_object : enable
#extension GL_EXT_gpu_shader4 : enable                             

uniform MatrixBlock
{
    mat4 b_MVMatrix;  
    mat4 b_NormalMatrix;
    mat4 b_ProjectionMatrix;
};

uniform samplerBuffer data;

uniform float time;

const float texscale = 75.0;

const vec2 speed = vec2(0.005, 0.005);

in vec2 in_tex0;
in vec3 in_pos;

out vec4 tex1;
out vec4 tex2;
out vec4 tex0;
out vec3 V;
out vec3 T;
out vec3 B;
out vec3 N;
out vec3 vertexpos;
out float fogdist;

const mat4 Mr = mat4(0.5, 0.0, 0.0, 0.0,
    	             0.0, 0.5, 0.0, 0.0,
		             0.0, 0.0, 0.5, 0.0,
		             0.5, 0.5, 0.5, 1.0);

void main()
{
    vec4 position = texelFetchBuffer(data, gl_InstanceID);

	N = vec3(-b_NormalMatrix[2][0], -b_NormalMatrix[2][1], -b_NormalMatrix[2][2]);
	T = vec3(b_NormalMatrix[0][0], b_NormalMatrix[0][1], b_NormalMatrix[0][2]);
	B = vec3(b_NormalMatrix[1][0], b_NormalMatrix[1][1], b_NormalMatrix[1][2]);
	
	vec2 uv = in_tex0 * texscale;
	vec2 bs = time * speed;

    tex0.xy = uv;
	tex0.zw = uv + bs;
	tex1.xy = 2.5 * (uv - bs);
	tex1.zw = 4.0 * (uv + bs);
				
	float rot = position.w;  
    vec4 pos = vec4(in_pos.xyz, 1.0);

    // Has to be boolean expression
    if(rot != 0)
    {
        float c = cos(rot);
        float s = sin(rot);
        float x = pos.x;
        float y = pos.y;

        // Rotate z
        pos.x = c * x + s * y;
        pos.y = -s * x + c * y;
    }

    // Translate to world
    pos.xyz += position.xyz;

    // Eye space
    pos = b_MVMatrix * pos;

    V = pos.xyz;
    vertexpos = pos.xyz;

    gl_Position = b_ProjectionMatrix * pos;
			
	tex2 = Mr * gl_Position;
	fogdist = abs(V.z);
}
