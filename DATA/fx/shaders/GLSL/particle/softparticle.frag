#version 120

uniform sampler2D src1;
uniform sampler2D src2;
uniform vec4 camera;

varying vec4 color;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuse(out vec4 ambient, out vec4 diffuse);

float Contrast(float Input, float ContrastPower)
{
     //piecewise contrast function
     bool IsAboveHalf = Input > 0.5;

     float ToRaise = 2 * (IsAboveHalf ? 1.0 - Input : Input);
     ToRaise = clamp(ToRaise, 0.0, 1.0);

     float alpha = 0.5 * pow(ToRaise, ContrastPower); 
     alpha = IsAboveHalf ? 1.0 - alpha : alpha;

     return alpha;
}

void main()
{
    vec4 map = texture2D(src1, gl_TexCoord[0].xy);
    
    // Reversed z-buffer
    float sd = 1.0 - texture2D(src2, gl_TexCoord[1].xy).r;
    float pd = 1.0 - gl_FragCoord.z;

    // Depth(s) into projection space  
    sd = camera.z / (camera.y - sd * camera.w);
    pd = camera.z / (camera.y - pd * camera.w);

    if(pd > sd)
        discard;

    float diff = sd - pd;
    float fade = Contrast(diff, 1.0);

    vec4 ambient;
	vec4 diffuse;
	vec4 emissive;
	
	lightGetAmbientDiffuse(ambient, diffuse);

	ambient += gl_LightModel.ambient;
	
	diffuse *= (gl_FrontMaterial.diffuse * color);
	ambient *= gl_FrontMaterial.ambient;
	emissive = gl_FrontMaterial.emission;
	
	vec4 c = map * (diffuse + ambient + emissive);

	gl_FragColor = fogThis(c);
	gl_FragColor.a = map.a * color.a * fade;
}