// Table size limited on certain hardware
uniform vec4 bbtable1[24];
uniform vec4 bbtable2[24];

uniform vec4 scales[4];
uniform vec4 unitSquare[4];
uniform vec4 rotation;

uniform vec2 cameraangle;

uniform float billboardAzimuth;

uniform mat4 normal;
uniform mat4 binormal;
uniform mat4 tangent;

varying vec3 T;
varying vec3 B;
varying vec3 N;

const float clearalpha = 255.0;  // alpha testing, 255 means not visible
const float opaquealpha = 84.0;  // alpha testing, 84 means fully visible
const float alphaspread = 171.0; // 171 = 255 - 84

void main()
{
	int corner = int(gl_Vertex.w);
	
	float azimuth = gl_MultiTexCoord0.z;
	float fade = gl_MultiTexCoord0.w;
	float scale = gl_MultiTexCoord1.x;
	float numimages = gl_MultiTexCoord1.z;

	int texcoordoffset = int(gl_MultiTexCoord1.y);
		
	float twoPI = 6.28318530;
	
	float adjustAz = billboardAzimuth + azimuth;
	adjustAz = adjustAz < 0.0 ? adjustAz + twoPI : adjustAz > twoPI ? adjustAz - twoPI : adjustAz;
	
	float sliceDiameter = twoPI / numimages;
	
	//Pick closest image
	int i0 = int(adjustAz / sliceDiameter);
	i0 = i0 > int(numimages) - 1 ? 0 : i0;

	int index = i0 + texcoordoffset;
	
	// Get texcoords from texcoord table.
	vec4 texcoords = index < 24 ?  bbtable1[index] : bbtable2[index - 24];
	
	float alpha = (adjustAz - (float(i0) * sliceDiameter)) / sliceDiameter;
	
	float fadepoint = mix(clearalpha, opaquealpha, fade);
	alpha = mix(fadepoint, clearalpha, pow(alpha, 1.7));
	alpha = 1.0 - (alpha - opaquealpha) / alphaspread;
	
	vec4 pos;
	pos.xyz = unitSquare[corner].xyz * gl_MultiTexCoord0.xxy * scale;
	pos.xy = vec2(dot(rotation.yxw, pos.xyz), dot(rotation.zyw, pos.xyz));
	
	pos.xyz += gl_Vertex.xyz;
	pos.w = 1.0;

	T = normalize(gl_NormalMatrix * tangent[corner].xyz);
	B = normalize(gl_NormalMatrix * binormal[corner].xyz);
	N = normalize(gl_NormalMatrix * normal[corner].xyz);

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
