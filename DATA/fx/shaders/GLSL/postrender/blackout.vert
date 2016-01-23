#version 120

uniform vec4 insidecolor;
uniform vec4 outsidecolor;

varying vec4 color;

void main()
{
	gl_Position = ftransform();     

	float dist = distance(gl_Position.xyz, vec3(0.0, 0.0, 0.0));
	 
	dist = dist > 1.0 ? 1.0 : dist;
	
	color = mix(insidecolor, outsidecolor, dist);
}
