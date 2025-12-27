float mx_luminance_color4(float4 _in)
{
    return dot(_in.rgb, float3(0.2126, 0.7152, 0.0722));
}
