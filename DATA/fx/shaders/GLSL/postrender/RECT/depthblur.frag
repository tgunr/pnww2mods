#version 120
#extension GL_ARB_texture_rectangle: enable

uniform sampler2DRect src1;
uniform sampler2DRect src2;

uniform vec4 camera;
uniform vec4 effect;
uniform float strength;
uniform vec2 wsize;

const vec2 center = vec2(0.5, 0.5);
const vec3 shockParams = vec3(10.0, 0.1, 0.1);

uniform float time; 

const float focalplanedepth = 1.0;
const float nearblurdepth = 0.0;//-200.0;
const float farplanedepth = 3500.0;

const float sampleDist = 1.0f;
const float samples[6] = float[](-0.03, -0.02, -0.01, 0.01, 0.02, 0.03);

vec4 RadialBlur(in vec2 uv)
{
    vec4 color = texture2DRect(src1, uv);
    float dist = 0.0;
    
    vec2 uvnormalized = uv / wsize;

    float ss = strength * 2.2;

#if WANT_RADIAL_BLUR
    if(ss > 0.0)
    {
        // 0.5,0.5 is the center of the screen
        // so substracting uv from it will result in
        // a vector pointing to the middle of the screen
        vec2 dir = 0.5 - uvnormalized; 

        // calculate the distance to the center of the screen
        dist = sqrt(dir.x * dir.x + dir.y * dir.y); 

        // this is the original colour of this fragment
        // using only this would result in a nonblurred version
        color = texture2DRect(src1, uv); 
 
        vec4 sum = color;
 
        dir *= wsize;

        // take 10 additional blur samples in the direction towards
        // the center of the screen
        for(int i = 0; i < 6; i++)
        {
            sum += texture2DRect(src1, uv + dir * samples[i] * sampleDist);
        }

        // we have taken 6 samples
        sum /= 6.0;
 
        // weighten the blur effect with the distance to the
        // center of the screen ( further out is blurred more)
        float t = dist * ss;
        t = clamp(t, 0.0, 1.0); 
 
        //Blend the original color with the averaged pixels
        color = mix(color, sum, t);
    }
#endif

    float dd = 2.0 * distance(uvnormalized, center);

    color = mix(color, effect, dd * ss);

    return color;
}

void Shock(out vec2 outuv)
{
    vec2 uv = gl_TexCoord[0].xy;
    outuv = uv;
#if WANT_SHOCK

    float t = time * 1.5;

    if(t > 0)
    {
        float dist = abs(uv.y - center.y);
        
        if(dist <= (t + shockParams.z) && dist >= (t - shockParams.z))
        {
            float diff = (dist - t);
            float powDiff = 1.0 - pow(abs(diff * shockParams.x), shockParams.y);

            float diffTime = diff * powDiff;
            vec2 diffUV = normalize(uv - center);
            outuv = uv + (diffUV * diffTime);
        }
    }
#endif
}

void main()
{	
    vec2 uv = gl_TexCoord[0].xy;

    Shock(uv);
    
    vec3 rgb = RadialBlur(uv).rgb;

    float d = 1.0 - texture2DRect(src2, uv).r;

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
