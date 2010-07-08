uniform vec2 cameraangle;
uniform vec2 anglescalars;
uniform vec2 leafangles[8];

uniform vec3 treepos;

uniform vec4 rotation;

uniform mat4 unit;

uniform float diffuseScale;

vec4 windEffect(vec4, vec2);

varying vec3 N;

void main()
{
	float azimuth = cameraangle.x;
	float pitch = cameraangle.y;
	float rotatex = gl_MultiTexCoord2.x;
	float rotatey = gl_MultiTexCoord2.y;
	float dimming = gl_MultiTexCoord2.w;
	
	vec2 size = gl_MultiTexCoord1.xy;
	vec2 pivot = gl_MultiTexCoord1.zw;
	vec2 windparams = gl_MultiTexCoord0.zw;
	
	int corner = int(gl_Vertex.w);
	int windangleindex = int(gl_MultiTexCoord2.z);
	
	vec4 position = vec4(gl_Vertex.x, gl_Vertex.y, gl_Vertex.z, 1.0);
		
	position.xy = vec2(dot(rotation.yxw, position.xyz), dot(rotation.zyw, position.xyz));
	
	vec3 normal;
	normal.xy = vec2(dot(rotation.yxw, gl_Normal), dot(rotation.zyw, gl_Normal));
	normal.z = gl_Normal.z;
	
	N = normalize(gl_NormalMatrix * normal);
	
    gl_TexCoord[1].x = dimming * diffuseScale;

	position = windEffect(position, windparams);
	
	vec2 rr = anglescalars.xy * leafangles[windangleindex].xy;
	
	vec3 pivotpt = unit[corner].xyz;
	pivotpt.yz += pivot;
	vec3 cornerpt = pivotpt * size.xxy;

	vec2 sincos;
	sincos.x = cos(azimuth + rotatex + rr.y);
	sincos.y = sin(azimuth + rotatex + rr.y);

	mat3 rotz;
	rotz[0].x = sincos.x;
	rotz[0].y = sincos.y;
	rotz[0].z = 0.0;
	rotz[1].x = -sincos.y;
	rotz[1].y = sincos.x;
	rotz[1].z = 0.0;
	rotz[2].x = 0.0;
	rotz[2].y = 0.0;
	rotz[2].z = 1.0;
	
	sincos.x = cos(pitch + rotatey + rr.x);
	sincos.y = sin(pitch + rotatey + rr.x);

	mat3 roty;
	roty[0].x = sincos.x;
	roty[0].y = 0.0;
	roty[0].z = -sincos.y;
	roty[1].x = 0.0;
	roty[1].y = 1.0;
	roty[1].z = 0.0;
	roty[2].x = sincos.y;
	roty[2].y = 0.0;
	roty[2].z = sincos.x;

	mat3 rot = rotz * roty;
	
	cornerpt = rot * cornerpt;

	position.xyz += cornerpt + treepos.xyz;
	position.w = 1.0;
	
	position = gl_ModelViewMatrix * position;
	gl_FogFragCoord = abs(position.x);

	gl_Position = gl_ProjectionMatrix * position;
	gl_TexCoord[0] = gl_MultiTexCoord0;
}
