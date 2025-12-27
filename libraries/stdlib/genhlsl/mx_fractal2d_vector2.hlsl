#include "lib/mx_noise.hlsl"

void mx_fractal2d_vector2(float2 amplitude, int octaves, float lacunarity, float diminish, float2 texcoord, out float2 result)
{
    float2 value = mx_fractal2d_noise_vec2(texcoord, octaves, lacunarity, diminish);
    result = value * amplitude;
}
