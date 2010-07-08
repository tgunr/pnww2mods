uniform vec3 billboard[4];
uniform vec2 periods;
uniform float radius;
uniform float height;
uniform float fadedistance;

varying vec4 color;

void main()
{
	vec4 pos;
	pos.xy = gl_Vertex.xy;
	pos.z = gl_MultiTexCoord1.x;
	
	pos.w = 1.0;
	
	float param = gl_MultiTexCoord0.z;
	
	float windangle = dot(pos, vec4(1, 0, 0, 0)) + periods.x;
	
	float sine = sin(windangle);
	float cose = cos(windangle);
	
	vec3 unit = billboard[int(gl_Vertex.z)];
	unit.xy *= radius;
	unit.z *= height;
	
	unit.x += sine * param;
	unit.y += cose * param;
	
	unit += pos.xyz;
	
	pos = gl_ModelViewMatrix * vec4(unit, 1.0);
	
	gl_TexCoord[0].xy = gl_MultiTexCoord0.xy;
	
	color = vec4(0.407 * 0.4, 0.447 * 0.4, 0.302 * 0.4, 0);
	
	float n = fadedistance * 0.75;
	float f = fadedistance;
	
	float dis = length(pos);
	float t = (dis - n) / (f - n);
	
	color.a = 1.0 - clamp(t, 0.0, 1.0);
	
	gl_FogFragCoord = abs(pos.z);
	gl_Position = gl_ProjectionMatrix * pos;
}
