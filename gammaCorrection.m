function [ result ] = gammaCorrection(image, a, gamma)
% GAMMA CORRECTION
image = im2double(image);
result = a * (image .^ gamma);
end

