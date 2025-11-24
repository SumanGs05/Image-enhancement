function [ pyramid ] = gaussian_pyramid(image, level)
% Build Gaussian pyramid
pyramid = cell(level, 1);
pyramid{1} = image;

for i = 2:level
    % Apply Gaussian filter and downsample
    smoothed = imgaussfilt(pyramid{i-1}, 1);
    pyramid{i} = impyramid(smoothed, 'reduce');
end
end

