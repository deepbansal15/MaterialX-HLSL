float mx_aastep(float threshold, float value)
{
    float afwidth = length(float2(ddx(value), ddy(value))) * 0.70710678118654757;
    return smoothstep(threshold-afwidth, threshold+afwidth, value);
}
