#include "lib/mx_closure_type.hlsl"
#include "lib/mx_microfacet_diffuse.hlsl"

void mx_subsurface_bsdf(ClosureData closureData, float weight, float3 color, float3 radius, float anisotropy, float3 N, inout BSDF bsdf)
{
    bsdf.throughput = float3(0.0);

    if (weight < M_FLOAT_EPS)
    {
        return;
    }

    float3 V = closureData.V;
    float3 L = closureData.L;
    float3 P = closureData.P;
    float occlusion = closureData.occlusion;

    N = mx_forward_facing_normal(N, V);

    if (closureData.closureType == CLOSURE_TYPE_REFLECTION)
    {
        float3 sss = mx_subsurface_scattering_approx(N, L, P, color, radius);
        float NdotL = clamp(dot(N, L), M_FLOAT_EPS, 1.0);
        float visibleOcclusion = 1.0 - NdotL * (1.0 - occlusion);
        bsdf.response = sss * visibleOcclusion * weight;
    }
    else if (closureData.closureType == CLOSURE_TYPE_INDIRECT)
    {
        // For now, we render indirect subsurface as simple indirect diffuse.
        float3 Li = mx_environment_irradiance(N);
        bsdf.response = Li * color * weight;
    }
}
