float2 mx_image_vector2(float2 uv, sampler2D tex_sampler)
{
    return tex2D(tex_sampler, uv).rg;
}
