void mx_heighttonormal_vector3(float sampleSize, float3 texcoord, out float3 result)
{
    float center = 0.0;
    float left = 0.0;
    float right = 0.0;
    float up = 0.0;
    float down = 0.0;
    
    // Sample height at center and neighboring positions
    // Note: This is a simplified implementation
    // In practice, you would sample from a texture here
    
    float dx = (right - left) / (2.0 * sampleSize);
    float dy = (down - up) / (2.0 * sampleSize);
    
    result = normalize(float3(-dx, -dy, 1.0));
}
