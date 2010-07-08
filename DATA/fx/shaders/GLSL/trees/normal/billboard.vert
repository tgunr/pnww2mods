// Table size limited on certain hardware
#version 120

uniform vec4 table1[84];

uniform vec4 scales[4];
uniform vec4 unitSquare[4];
uniform vec4 rotation;

uniform vec3 normal;
uniform vec3 tangent;
uniform vec3 binormal;

uniform float billboardAzimuth;
  
varying vec3 T;
varying vec3 B;
varying vec3 N;
varying vec3 vpos;

const float clearalpha = 255.0;  // alpha testing, 255 means not visible
const float opaquealpha = 84.0;  // alpha testing, 84 means fully visible
const float alphaspread = 171.0; // 171 = 255 - 84

void main()
{
	int corner = int(gl_Vertex.w);
	
	float azimuth = gl_MultiTexCoord0.z;
	float fade = gl_MultiTexCoord0.w;
	float transpercent = gl_MultiTexCoord1.z;
	float numimages = gl_MultiTexCoord1.y;
		
	int texcoordoffset = int(gl_MultiTexCoord1.x);

	float twoPI = 6.28318530;
	
	float sliceDiameter = twoPI / numimages;
	float adjustAz = billboardAzimuth - azimuth;
	adjustAz = adjustAz < 0.0 ? adjustAz + twoPI : adjustAz > twoPI ? adjustAz - twoPI : adjustAz;
	
	//Pick closest image
	int i0 = int(adjustAz / sliceDiameter + 1.0);
	i0 = i0 > int(numimages) - 1 ? 0 : i0;
	
	vec4 texcoords = table1[i0 + texcoordoffset];

	float alpha = 0.0;//1.0 - mod(adjustAz, sliceDiameter) / sliceDiameter;
	
	float fadepoint = mix(clearalpha, opaquealpha, fade);
	alpha = max(alpha, transpercent);
	alpha = mix(fadepoint, clearalpha, pow((alpha - transpercent) / (1.0 - transpercent), 1.7));
	alpha = 1.0 - (alpha - opaquealpha) / alphaspread;
	
	vec4 pos;
	pos.xyz = unitSquare[corner].xyz * gl_MultiTexCoord0.xxy;
	pos.xy = vec2(dot(rotation.yzw, pos.xyz), dot(rotation.xyw, pos.xyz));
	
	pos.xyz += gl_Vertex.xyz;	
	pos.w = 1.0;
			
	T = normalize(gl_NormalMatrix * tangent);
	B = normalize(gl_NormalMatrix * binormal);
	N = normalize(gl_NormalMatrix * normal);
		
	T.x = -T.x;
	
	gl_TexCoord[0].x = texcoords.x - texcoords.z * scales[corner].x;
	gl_TexCoord[0].y = texcoords.y - texcoords.w * scales[corner].y;
	
	// Normal Coords
	gl_TexCoord[2].xy = gl_TexCoord[0].xy;
  
	gl_TexCoord[1].xyz = gl_MultiTexCoord2.xyz;
	gl_TexCoord[1].w = alpha;
	
   	pos = gl_ModelViewMatrix * pos;
   	gl_FogFragCoord = abs(pos.z);
   	
	gl_Position = gl_ProjectionMatrix * pos;
	vpos = pos.xyz;
}
