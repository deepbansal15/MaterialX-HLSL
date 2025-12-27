float3 mx_hsvtorgb_color3(float3 in)
{
    float4 K = float4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    float3 p = abs(frac(in.xxx + K.xyz) * 6.0 - K.www);
    return in.z * lerp(K.xxx, clamp(p - K.xxx, 0.0, 1.0), in.y);
}
