// Table size limited on certain hardware
#version 120

uniform vec4 table1[84];

uniform vec4 scales[4];
uniform vec4 unitSquare[4];
uniform vec4 rotation;
uniform mat4 normal;

uniform vec2 cameraangle;

uniform float billboardAzimuth;

const float clearalpha = 255.0;  // alpha testing, 255 means not visible
const float opaquealpha = 84.0;  // alpha testing, 84 means fully visible
const float alphaspread = 171.0; // 171 = 255 - 84

varying vec4 diffuse;
varying vec4 ambient;

void main()
{
	int corner = int(gl_Vertex.w);
	
	float azimuth = gl_MultiTexCoord0.z;
	float fade = gl_MultiTexCoord0.w;
	float numimages = gl_MultiTexCoord1.y;
	float transpercent = gl_MultiTexCoord1.z;
	
	int texcoordoffset = int(gl_MultiTexCoord1.x);
		
	float twoPI = 6.28318530;
	
	float adjustAz = billboardAzimuth + azimuth;
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
	pos.xy = vec2(dot(rotation.yxw, pos.xyz), dot(rotation.zyw, pos.xyz));
	
	pos.xyz += gl_Vertex.xyz;
	pos.w = 1.0;
	
	vec3 N = normal[corner].xyz;
	N = normalize(gl_NormalMatrix * N);
	
	// Pass to fragment shader
	gl_TexCoord[0].x = texcoords.x - texcoords.z * scales[corner].x;
	gl_TexCoord[0].y = texcoords.y - texcoords.w * scales[corner].y;
	
	// Light adjusts
	gl_TexCoord[1].xyz = gl_MultiTexCoord2.xyz;
	gl_TexCoord[1].w = alpha;
			
	pos = gl_ModelViewMatrix * pos;
	gl_FogFragCoord = abs(pos.z);
	
	gl_Position = gl_ProjectionMatrix * pos;
	
	// Lighting per vertex
	vec3 l1 = normalize(gl_LightSource[0].position.xyz);	
	vec3 l2 = normalize(gl_LightSource[1].position.xyz);	

	float d1 = max(dot(N, l1), 0.0);
	float d2 = max(dot(N, l2), 0.0);
	
	diffuse = d1 * gl_LightSource[0].diffuse;	
	diffuse += d2 * gl_LightSource[1].diffuse;	
	
	ambient = gl_LightSource[0].ambient;
	ambient += gl_LightSource[1].ambient;
	
	ambient *= gl_TexCoord[1].z;
	ambient += gl_LightModel.ambient;	
}
