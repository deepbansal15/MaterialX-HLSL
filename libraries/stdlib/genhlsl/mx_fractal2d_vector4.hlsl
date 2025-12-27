#include "lib/mx_noise.hlsl"

void mx_fractal2d_vector4(float4 amplitude, int octaves, float lacunarity, float diminish, float2 texcoord, out float4 result)
{
    float4 value = mx_fractal2d_noise_vec4(texcoord, octaves, lacunarity, diminish);
    result = value * amplitude;
}
