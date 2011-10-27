#version 120
#extension GL_ARB_texture_rectangle: enable

uniform sampler2DRect src1;
uniform sampler2DRect src2;

uniform vec4 camera;

const float focalplanedepth = 10.0;
const float nearblurdepth = -200.0;
const float farplanedepth = 500.0;

void main()
{	
    vec3 rgb = texture2DRect(src1, gl_TexCoord[0].xy).rgb;
    float d = 1.0 - texture2DRect(src2, gl_TexCoord[0].xy).r;

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
