#version 150

uniform sampler2D src1;
uniform sampler2D src2;

uniform vec4 camera;

const float focalplanedepth = 100.0;
const float nearblurdepth = 20.0;
const float farplanedepth = 800.0;

in vec2 tex0;
out vec4 out_color;

void main()
{	
    vec3 rgb = texture(src1, tex0).rgb;

    float d = 1.0 - texture(src2, tex0).r;

    // Depth to projection space
    float sd = camera.z / (camera.y - d * camera.w);
 
    float f;

    if(sd < focalplanedepth)
    {
        f = (sd - focalplanedepth) / (focalplanedepth - nearblurdepth);
    }
    else
    {
        f = (sd - focalplanedepth) / (farplanedepth - focalplanedepth);
        f = clamp(f, 0.0, 1.0);
    }

    f = f * 0.5 + 0.5;

    out_color = vec4(rgb, f);
}
