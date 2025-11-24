function [ saturation ] = Saturation_weight(image)
% Calculate saturation weight
image = im2double(image);
r = image(:,:,1);
g = image(:,:,2);
b = image(:,:,3);

% Saturation calculation
maxRGB = max(max(r, g), b);
minRGB = min(min(r, g), b);
saturation = (maxRGB - minRGB);
end

