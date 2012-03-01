#version 120

uniform sampler2D src1;
uniform sampler2D src2;

uniform vec4 camera;

const float focalplanedepth = 30.0;
const float nearblurdepth = 20.0;
const float farplanedepth = 500.0;

void main()
{	
    vec2 uv = gl_TexCoord[0].xy;   
    vec3 rgb = texture2D(src1, uv).rgb;

    float d = 1.0 - texture2D(src2, uv).r;

    // Depth to projection space
    float sd = camera.z / (camera.y - d * camera.w);
 
    float f;

    if(sd < focalplanedepth)
    {
        f = (sd - focalplanedepth) / (focalplanedepth - nearblurdepth);
        f = clamp(f, -1.0, 0.0);
    }
    else
    {
        f = (sd - focalplanedepth) / (farplanedepth - focalplanedepth);
        f = clamp(f, 0.0, 1.0);
    }

    f = f * 0.5 + 0.5;

    gl_FragColor = vec4(rgb, f);
}
