#include "mx_burn_float.hlsl"

void mx_burn_color4(float4 fg, float4 bg, float mixval, out float4 result)
{
    float f;
    mx_burn_float(fg.x, bg.x, mixval, f); result.x = f;
    mx_burn_float(fg.y, bg.y, mixval, f); result.y = f;
    mx_burn_float(fg.z, bg.z, mixval, f); result.z = f;
    mx_burn_float(fg.w, bg.w, mixval, f); result.w = f;
}
