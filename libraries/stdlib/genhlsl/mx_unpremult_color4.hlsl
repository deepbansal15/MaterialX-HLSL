float4 mx_unpremult_color4(float4 in1)
{
    return float4(in1.rgb / in1.a, in1.a);
}
