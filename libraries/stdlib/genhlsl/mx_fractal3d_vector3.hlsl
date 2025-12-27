#include "lib/mx_noise.hlsl"

void mx_fractal3d_vector3(float amplitude, int octaves, float lacunarity, float diminish, float3 texcoord, out float3 result)
{
    float3 value = mx_fractal3d_noise_vector3(texcoord, octaves, lacunarity, diminish);
    result = value * amplitude;
}
