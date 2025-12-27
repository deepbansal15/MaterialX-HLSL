float mx_image_float(float2 uv, sampler2D tex_sampler)
{
    return tex2D(tex_sampler, uv).r;
}
