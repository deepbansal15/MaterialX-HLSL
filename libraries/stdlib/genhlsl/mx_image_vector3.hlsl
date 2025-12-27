float3 mx_image_vector3(float2 uv, sampler2D tex_sampler)
{
    return tex2D(tex_sampler, uv).rgb;
}
