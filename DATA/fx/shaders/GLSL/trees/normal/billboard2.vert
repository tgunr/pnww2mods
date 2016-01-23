// Table size limited on certain hardware
#version 120

uniform vec4 table1[84];

uniform vec4 scales[4];
uniform vec4 unitSquare[4];
uniform vec4 rotation;

uniform float billboardAzimuth;

uniform mat4 normal;
uniform mat4 binormal;
uniform mat4 tangent;

varying vec3 L1;
varying vec3 L2;
varying vec4 ambient;

const float clearalpha = 255.0;  // alpha testing, 255 means not visible
const float opaquealpha = 84.0;  // alpha testing, 84 means fully visible
const float alphaspread = 171.0; // 171 = 255 - 84

void main()
{
	int corner = int(gl_Vertex.w);
	
	float azimuth = gl_MultiTexCoord0.z;
	float fade = gl_MultiTexCoord0.w;
	float numimages = gl_MultiTexCoord1.y;
	float transpercent = gl_MultiTexCoord1.z;
	
	int texcoordoffset = int(gl_MultiTexCoord1.x);
		
	float twoPI = 6.28318530;
	
	float adjustAz = billboardAzimuth - azimuth;
	adjustAz = adjustAz < 0.0 ? adjustAz + twoPI : adjustAz > twoPI ? adjustAz - twoPI : adjustAz;
	
	float sliceDiameter = twoPI / numimages;
	
	//Pick closest image
	int i0 = int(adjustAz / sliceDiameter);
	i0 = i0 > int(numimages) - 1 ? 0 : i0;

	vec4 texcoords = table1[i0 + texcoordoffset];
		
	float fadepoint = mix(clearalpha, opaquealpha, fade);

	float alpha = (adjustAz - (float(i0) * sliceDiameter)) / sliceDiameter;
	
	alpha = max(alpha, transpercent);
	alpha = mix(fadepoint, clearalpha, pow((alpha - transpercent) / (1.0 - transpercent), 1.7));
	alpha = 1.0 - (alpha - opaquealpha) / alphaspread;
	
	vec4 pos;
	pos.xyz = unitSquare[corner].xyz * gl_MultiTexCoord0.xxy;
	pos.xy = vec2(dot(rotation.yzw, pos.xyz), dot(rotation.xyw, pos.xyz));
	
	pos.xyz += gl_Vertex.xyz;
	pos.w = 1.0;
	
	vec3 norm = normal[corner].xyz;
	vec3 tang = tangent[corner].xyz;
	vec3 bino = binormal[corner].xyz;
	
	norm.xy = -norm.xy;
	bino.z = -bino.z;
	
	vec3 T = normalize(gl_NormalMatrix * tang);
	vec3 B = normalize(gl_NormalMatrix * bino);
	vec3 N = normalize(gl_NormalMatrix * norm);

	vec3 l1 = normalize(gl_LightSource[0].position.xyz);
	vec3 l2 = normalize(gl_LightSource[1].position.xyz);
	
	L1.x = dot(l1, T);
	L1.y = dot(l1, B);
	L1.z = dot(l1, N);
	
	L2.x = dot(l2, T);
	L2.y = dot(l2, B);
	L2.z = dot(l2, N);
	
	ambient = gl_LightSource[0].ambient;
	ambient += gl_LightSource[1].ambient;
	ambient += gl_LightModel.ambient * gl_MultiTexCoord2.z;
	ambient *= gl_MultiTexCoord2.z;

	// Pass to fragment shader
	gl_TexCoord[0].x = texcoords.x - texcoords.z * scales[corner].x;
	gl_TexCoord[0].y = texcoords.y - texcoords.w * scales[corner].y;
	
	// Light adjusts
	gl_TexCoord[1].xyz = gl_MultiTexCoord2.xyz;
	gl_TexCoord[1].w = alpha;
	
	// Normal coords
	gl_TexCoord[2].xy = gl_TexCoord[0].xy;
	
	pos = gl_ModelViewMatrix * pos;
	gl_FogFragCoord = abs(pos.z);
	
	gl_Position = gl_ProjectionMatrix * pos;
}
