void mx_mix_surfaceshader(float4 fg, float4 bg, float mix, out float4 out1)
{
    out1 = lerp(bg, fg, mix);
}
