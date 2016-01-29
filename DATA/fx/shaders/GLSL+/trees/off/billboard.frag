#version 150
#extension GL_ARB_uniform_buffer_object : enable

uniform sampler2D src1;
uniform float lightadjust;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(in vec3, out vec4, out vec4);

in vec2 tex0;
in vec4 tex1;
in vec3 N;

out vec4 out_color;

const vec4 defaultcolor = vec4(0);
const float alphatest = 0.32941176;

void main()
{
	vec4 base = texture2D(src1, tex0.xy);

    out_color = defaultcolor;

    if(base.a > alphatest)
    {
	    vec4 ambient, diffuse;
	    vec3 n = normalize(N);

	    lightGetAmbientDiffuse(n, ambient, diffuse);
	
  	    float adjust = mix(tex1.x, tex1.y, lightadjust);
	    vec4 d = diffuse * adjust;

	    ambient *= tex1.z;
	
	    vec4 color = base * (d + ambient);

	    out_color = fogThis(color);
	    out_color.a = base.a * tex1.w;
    }
}
