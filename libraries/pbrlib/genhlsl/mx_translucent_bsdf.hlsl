#include "lib/mx_closure_type.hlsl"

void mx_translucent_bsdf(ClosureData closureData, float weight, float3 color, float3 N, inout BSDF bsdf)
{
    bsdf.throughput = float3(0.0);

    if (weight < M_FLOAT_EPS)
    {
        return;
    }

    float3 V = closureData.V;
    float3 L = closureData.L;

    // Invert normal since we're transmitting light from the other side
    N = -N;

    if (closureData.closureType == CLOSURE_TYPE_REFLECTION)
    {
        float NdotL = clamp(dot(N, L), 0.0, 1.0);
        bsdf.response = color * weight * NdotL * M_PI_INV;
    }
    else if (closureData.closureType == CLOSURE_TYPE_INDIRECT)
    {
        float3 Li = mx_environment_irradiance(N);
        bsdf.response = Li * color * weight;
    }
}
