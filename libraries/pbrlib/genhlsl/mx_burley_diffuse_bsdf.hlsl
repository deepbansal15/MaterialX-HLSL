#include "lib/mx_closure_type.hlsl"
#include "lib/mx_microfacet_diffuse.hlsl"

void mx_burley_diffuse_bsdf(ClosureData closureData, float weight, float3 color, float roughness, float3 N, inout BSDF bsdf)
{
    bsdf.throughput = float3(0.0);

    if (weight < M_FLOAT_EPS)
    {
        return;
    }

    float3 V = closureData.V;
    float3 L = closureData.L;

    N = mx_forward_facing_normal(N, V);
    float NdotV = clamp(dot(N, V), M_FLOAT_EPS, 1.0);

    if (closureData.closureType == CLOSURE_TYPE_REFLECTION)
    {
        float NdotL = clamp(dot(N, L), M_FLOAT_EPS, 1.0);
        float LdotH = clamp(dot(L, normalize(L + V)), M_FLOAT_EPS, 1.0);

        bsdf.response = color * closureData.occlusion * weight * NdotL * M_PI_INV;
        bsdf.response *= mx_burley_diffuse(NdotV, NdotL, LdotH, roughness);
    }
    else if (closureData.closureType == CLOSURE_TYPE_INDIRECT)
    {
        float3 Li = mx_environment_irradiance(N) *
                  mx_burley_diffuse_dir_albedo(NdotV, roughness);
        bsdf.response = Li * color * weight;
    }
}
