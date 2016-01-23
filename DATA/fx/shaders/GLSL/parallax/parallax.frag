uniform sampler2D src1;
uniform sampler2D src2;

varying vec3 T;
varying vec3 B;
varying vec3 N;
varying vec3 V;
varying vec3 vtan;

vec4 fogThis(in vec4);
void lightGetAmbientDiffuseSpecular(in vec3 t,
		                            in vec3 b,
		                            in vec3 n,
		                            in vec3 v,
		                            in vec3 normal,
		                            out vec4 ambient, 
		                            out vec4 diffuse,
		                            out vec4 specular);
		
void main()
{
	float depth = (texture2D(src2, gl_TexCoord[0].xy).a) * 0.2; //hole_depth
	float orig_alpha = texture2D(src1, gl_TexCoord[0].xy).a;
   
   	vec3 vt = normalize(vtan);
   	
    vec2 offset = depth * vt.xy;        

  	if(texture2D(src2, gl_TexCoord[0].xy + offset).a < 0.96)
	{
        offset *= texture2D(src2, gl_TexCoord[0].xy).a;
    }
    
    // get a new uv
	vec2 uv = gl_TexCoord[0].xy + offset;
	
	vec4 base = texture2D(src1, uv);
	vec3 normal;
	normal.xy  = texture2D(src2, uv).rg * 2.0 - 1.0;
	
	normal.z = sqrt(1.0 - normal.x * normal.x - normal.y * normal.y);

	float level = gl_FrontMaterial.shininess;
	
	vec4 diffuseColor;
	vec4 ambientColor;
	vec4 specularColor;
	
	// These values are interpolated and need to be normalized
	vec3 t = normalize(T);
	vec3 b = normalize(B);
	vec3 n = normalize(N);
	vec3 v = normalize(-V);

	lightGetAmbientDiffuseSpecular(t, 
			                       b, 
			                       n,
			                       v,
			                       normal, 
			                       ambientColor, 
			                       diffuseColor,
			                       specularColor); 
		
	ambientColor += gl_LightModel.ambient;
	
	specularColor *= vec4(0.25, 0.25, 0.25, 1.0);//gl_FrontMaterial.specular;
	diffuseColor *= base;
	ambientColor *= gl_FrontMaterial.ambient;
	
	vec4 color = base * (diffuseColor + ambientColor + specularColor);
	 	
	gl_FragColor = fogThis(color);
	gl_FragColor.w = orig_alpha;
}
