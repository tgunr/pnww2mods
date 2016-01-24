uniform float windMatrixOffset;
uniform float numWindMatrices;

uniform mat4 windMatrices[4];

vec4 windEffect(vec4 position, vec2 windinfo)
{
#if(0)
    windinfo.xy += windMatrixOffset;

    vec2 weights = fract(windinfo);
    vec2 indices = (windinfo - weights) * 0.05 * numWindMatrices;
 
    vec4 windeffect = mix(position, windMatrices[int(indices.x)] * position, weights.x);
    windeffect.w = 1.0;
    
    return mix(windeffect, windMatrices[int(indices.y)] * position, weights.y);
#else
    windinfo.xy += windMatrixOffset;

    vec2 weights = fract(windinfo);

    vec4 windeffect = mix(position, windMatrices[0] * position, weights.x);
    windeffect.w = 1.0;
    
    return mix(windeffect, windMatrices[1] * position, weights.y);
#endif
}
