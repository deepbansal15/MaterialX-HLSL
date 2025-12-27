float4 mx_hsvtorgb_color4(float4 in)
{
    float4 K = float4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    float3 p = abs(frac(in.xxx + K.xyz) * 6.0 - K.www);
    float3 rgb = in.z * lerp(K.xxx, clamp(p - K.xxx, 0.0, 1.0), in.y);
    return float4(rgb, in.w);
}
