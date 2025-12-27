#include "mx_dodge_float.hlsl"

void mx_dodge_color3(float3 fg, float3 bg, float mixval, out float3 result)
{
    float f;
    mx_dodge_float(fg.x, bg.x, mixval, f); result.x = f;
    mx_dodge_float(fg.y, bg.y, mixval, f); result.y = f;
    mx_dodge_float(fg.z, bg.z, mixval, f); result.z = f;
}
