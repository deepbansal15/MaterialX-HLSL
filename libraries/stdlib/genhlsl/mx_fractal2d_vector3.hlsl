#include "lib/mx_noise.hlsl"

void mx_fractal2d_vector3(float3 amplitude, int octaves, float lacunarity, float diminish, float2 texcoord, out float3 result)
{
    float3 value = mx_fractal2d_noise_vec3(texcoord, octaves, lacunarity, diminish);
    result = value * amplitude;
}
