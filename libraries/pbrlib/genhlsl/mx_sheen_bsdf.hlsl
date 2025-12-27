#include "lib/mx_closure_type.hlsl"
#include "lib/mx_microfacet_sheen.hlsl"

void mx_sheen_bsdf(ClosureData closureData, float weight, float3 color, float roughness, float3 N, int mode, inout BSDF bsdf)
{
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
        float dirAlbedo;
        if (mode == 0)
        {
            float NdotL = clamp(dot(N, L), M_FLOAT_EPS, 1.0);
            float NdotH = clamp(dot(N, normalize(L + V)), M_FLOAT_EPS, 1.0);

            float3 fr = color * mx_imageworks_sheen_brdf(NdotL, NdotV, NdotH, roughness);
            dirAlbedo = mx_imageworks_sheen_dir_albedo(NdotV, roughness);

            // We need to include NdotL from the light integral here
            // as in this case it's not cancelled out by the BRDF denominator.
            bsdf.response = fr * NdotL * closureData.occlusion * weight;
        }
        else
        {
            roughness = clamp(roughness, 0.01, 1.0); // Clamp to range of original impl.

            float3 fr = color * mx_zeltner_sheen_brdf(L, V, N, NdotV, roughness);
            dirAlbedo = mx_zeltner_sheen_dir_albedo(NdotV, roughness);
            bsdf.response = dirAlbedo * fr * closureData.occlusion * weight;
        }
        bsdf.throughput = float3(1.0 - dirAlbedo * weight);
    }
    else if (closureData.closureType == CLOSURE_TYPE_INDIRECT)
    {
        roughness = clamp(roughness, 0.01, 1.0); // Clamp to range of original impl.

        float3 Li = mx_environment_irradiance(N);
        float3 dirAlbedo = mx_zeltner_sheen_dir_albedo(NdotV, roughness);
        bsdf.response = Li * color * dirAlbedo * weight;
        bsdf.throughput = float3(1.0 - dirAlbedo * weight);
    }
}
