#include "lib/mx_noise.hlsl"

void mx_fractal3d_vector4(float amplitude, int octaves, float lacunarity, float diminish, float3 texcoord, out float4 result)
{
    float4 value = mx_fractal3d_noise_vector4(texcoord, octaves, lacunarity, diminish);
    result = value * amplitude;
}
