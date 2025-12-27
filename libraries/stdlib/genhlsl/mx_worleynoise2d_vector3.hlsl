float3 mx_worleynoise2d_vector3(float2 uv)
{
    float2 p = floor(uv);
    float2 f = frac(uv);
    float2 u = f * f * (3.0 - 2.0 * f);
    
    float n = p.x + p.y * 57.0;
    float a = frac(sin(n + 0.0) * 43758.5453);
    float b = frac(sin(n + 1.0) * 43758.5453);
    float c = frac(sin(n + 57.0) * 43758.5453);
    float d = frac(sin(n + 58.0) * 43758.5453);
    
    float3 result;
    result.x = lerp(lerp(a, b, u.x), lerp(c, d, u.x), u.y);
    result.y = lerp(lerp(frac(sin(n + 113.0) * 43758.5453), frac(sin(n + 114.0) * 43758.5453), u.x), 
                    lerp(frac(sin(n + 170.0) * 43758.5453), frac(sin(n + 171.0) * 43758.5453), u.x), u.y);
    result.z = lerp(lerp(frac(sin(n + 226.0) * 43758.5453), frac(sin(n + 227.0) * 43758.5453), u.x), 
                    lerp(frac(sin(n + 283.0) * 43758.5453), frac(sin(n + 284.0) * 43758.5453), u.x), u.y);
    return result;
}
