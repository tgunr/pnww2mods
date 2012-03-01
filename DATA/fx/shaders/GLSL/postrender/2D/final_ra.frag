#version 120

uniform sampler2D gs;
uniform sampler2D scene;

uniform float lum;
uniform float strength;
uniform float time;
uniform vec4 effect;

const vec2 center = vec2(0.5, 0.5);
const vec3 shockParams = vec3(10.0, 0.1, 0.1);

vec4 RadialBlur(in vec2 uv)
{
    vec4 color = texture2D(scene, uv);

    float dist = 0.0;

    float ss = strength * 2.2;

#if WANT_RADIAL_BLUR
    if(ss > 0.0)
    {
        // 0.5,0.5 is the center of the screen
        // so substracting uv from it will result in
        // a vector pointing to the middle of the screen
        vec2 dir = 0.5 - uv; 
 
        // calculate the distance to the center of the screen
        dist = sqrt(dir.x * dir.x + dir.y * dir.y); 

        // normalize the direction (reuse the distance)
        dir = dir / dist; 
 
        // this is the original colour of this fragment
        // using only this would result in a nonblurred version
        color = texture2D(src1, uv); 
 
        vec4 sum = color;
 
        // take 10 additional blur samples in the direction towards
        // the center of the screen
        for(int i = 0; i < 6; i++)
        {
            sum += texture2D(src1, uv + dir * samples[i] * sampleDist);
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

    float dd = 2.0 * distance(uv, center);

    color = mix(color, effect, ss * dd);

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
    
    vec4 s1 = RadialBlur(uv);

	vec4 s2 = texture2D(gs, gl_TexCoord[0].xy);

	vec4 c = s1 * s2;
	c += lum;
	
	gl_FragColor = c;
}
