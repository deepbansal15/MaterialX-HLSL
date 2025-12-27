float mx_worleynoise2d_float(float2 uv)
{
    float2 p = floor(uv);
    float2 f = frac(uv);
    float2 u = f * f * (3.0 - 2.0 * f);
    
    float n = p.x + p.y * 57.0;
    float a = frac(sin(n + 0.0) * 43758.5453);
    float b = frac(sin(n + 1.0) * 43758.5453);
    float c = frac(sin(n + 57.0) * 43758.5453);
    float d = frac(sin(n + 58.0) * 43758.5453);
    
    return lerp(lerp(a, b, u.x), lerp(c, d, u.x), u.y);
}
