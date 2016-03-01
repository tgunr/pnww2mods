// Table size limited on certain hardware
#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform MatrixBlock
{
    mat4 b_MVMatrix;  
    mat4 b_NormalMatrix;
    mat4 b_ProjectionMatrix;
};

uniform vec4 table1[84];

uniform vec4 scales[4];
uniform vec4 unitSquare[4];
uniform vec4 rotation;

uniform vec3 normal;

uniform float billboardAzimuth;
   
const float clearalpha = 255.0;  // alpha testing, 255 means not visible
const float opaquealpha = 84.0;  // alpha testing, 84 means fully visible
const float alphaspread = 171.0; // 171 = 255 - 84

in vec4 in_pos;
in vec4 in_tex0;
in vec3 in_tex1;
in vec3 in_tex2;

out vec3 eyepos;
out vec3 N;
out float fogdist;
out vec2 tex0;
out vec4 tex1;

void main()
{
	int corner = int(in_pos.w);
	
	float azimuth = in_tex0.z;
	float fade = in_tex0.w;
	float transpercent = in_tex1.z;
	float numimages = in_tex1.y;
		
	int texcoordoffset = int(in_tex1.x);

	float twoPI = 6.28318530;
	float adjustAz = billboardAzimuth - azimuth;
	adjustAz = adjustAz < 0.0 ? adjustAz + twoPI : adjustAz > twoPI ? adjustAz - twoPI : adjustAz;
	
	float sliceDiameter = twoPI / numimages;
	
	// Pick closest image
	int i0 = int(adjustAz / sliceDiameter + 1.0);
	i0 = i0 > int(numimages) - 1 ? 0 : i0;
	
	vec4 texcoords = table1[i0 + texcoordoffset];

	float alpha = 0.0;//1.0 - mod(adjustAz, sliceDiameter) / sliceDiameter;
	
	float fadepoint = mix(clearalpha, opaquealpha, fade);
	alpha = max(alpha, transpercent);
	alpha = mix(fadepoint, clearalpha, pow((alpha - transpercent) / (1.0 - transpercent), 1.7));
	alpha = 1.0 - (alpha - opaquealpha) / alphaspread;
	
	vec4 pos;
	pos.xyz = unitSquare[corner].xyz * in_tex0.xxy;
	pos.xy = vec2(dot(rotation.yzw, pos.xyz), dot(rotation.xyw, pos.xyz));

	pos.xyz += in_pos.xyz;	
	pos.w = 1.0;
    
    N = mat3(b_NormalMatrix) * normal;

	tex0.x = texcoords.x - texcoords.z * scales[corner].x;
	tex0.y = texcoords.y - texcoords.w * scales[corner].y;
 
	tex1.xyz = in_tex2.xyz;
	tex1.w = alpha;
		
   	pos = b_MVMatrix * pos;
   	eyepos = pos.xyz;
   	
   	fogdist = abs(pos.z);
   	
	gl_Position = b_ProjectionMatrix * pos;
}
