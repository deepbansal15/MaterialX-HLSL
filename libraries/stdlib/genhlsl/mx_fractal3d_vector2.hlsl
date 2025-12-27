#include "lib/mx_noise.hlsl"

void mx_fractal3d_vector2(float amplitude, int octaves, float lacunarity, float diminish, float3 texcoord, out float2 result)
{
    float2 value = mx_fractal3d_noise_vector2(texcoord, octaves, lacunarity, diminish);
    result = value * amplitude;
}
