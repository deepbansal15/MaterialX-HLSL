#include "lib/mx_noise.hlsl"

void mx_fractal3d_float(float amplitude, int octaves, float lacunarity, float diminish, float3 texcoord, out float result)
{
    float value = mx_fractal3d_noise_float(texcoord, octaves, lacunarity, diminish);
    result = value * amplitude;
}
