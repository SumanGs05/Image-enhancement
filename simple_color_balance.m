function [ result ] = simple_color_balance(image)
% Simple white balance using Gray World assumption
image = im2double(image);
r = image(:,:,1);
g = image(:,:,2);
b = image(:,:,3);

% Calculate mean of each channel
mean_r = mean(r(:));
mean_g = mean(g(:));
mean_b = mean(b(:));

% Gray world assumption: average color should be gray
avg = (mean_r + mean_g + mean_b) / 3;

% Scale factors
scale_r = avg / mean_r;
scale_g = avg / mean_g;
scale_b = avg / mean_b;

% Apply scaling
result = image;
result(:,:,1) = min(r * scale_r, 1);
result(:,:,2) = min(g * scale_g, 1);
result(:,:,3) = min(b * scale_b, 1);
end

