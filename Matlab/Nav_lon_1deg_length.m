% Returns 1 degree of longitude length in meters on the specifiedd latitude and ellipsoid
function [ result ] = Nav_lon_1deg_length(lat_rad, el)

if el.mjsa_m <= 0.0
    error('Specified ellipsoid''s major semiaxis (mjsa_m) should be greater than zero');
end
    
if (el.ecnt_sq <= 0.0) || (el.ecnt_sq >= 1.0)
    error('Specified ellipsoid''s eccentrisity squared (ecnt_sq) should be in the range (0.0 .. 1.0) exclusively');
end    

    result = abs((pi / 180) * el.mjsa_m * cos(lat_rad) / sqrt(1.0 - el.ecnt_sq * sin(lat_rad)^2));
end