#include "mx_dodge_float.hlsl"

void mx_dodge_color4(float4 fg , float4 bg , float mixval, out float4 result)
{
    float f;
    mx_dodge_float(fg.x, bg.x, mixval, f); result.x = f;
    mx_dodge_float(fg.y, bg.y, mixval, f); result.y = f;
    mx_dodge_float(fg.z, bg.z, mixval, f); result.z = f;
    mx_dodge_float(fg.w, bg.w, mixval, f); result.w = f;
}
