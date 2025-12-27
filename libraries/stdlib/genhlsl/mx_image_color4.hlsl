float4 mx_image_color4(float2 uv, sampler2D tex_sampler)
{
    return tex2D(tex_sampler, uv);
}
