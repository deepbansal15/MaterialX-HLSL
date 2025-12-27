#include "mx_burn_float.hlsl"

void mx_burn_color3(float3 fg, float3 bg, float mixval, out float3 result)
{
    float f;
    mx_burn_float(fg.x, bg.x, mixval, f); result.x = f;
    mx_burn_float(fg.y, bg.y, mixval, f); result.y = f;
    mx_burn_float(fg.z, bg.z, mixval, f); result.z = f;
}
