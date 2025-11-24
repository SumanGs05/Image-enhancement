function [ result ] = simple_color_balance(image)
% Simple white balance using Gray World assumption with limits
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

% Scale factors with limits to prevent over-correction
scale_r = avg / (mean_r + eps);
scale_g = avg / (mean_g + eps);
scale_b = avg / (mean_b + eps);

% Limit scaling factors to prevent extreme adjustments
max_scale = 1.5;
scale_r = min(scale_r, max_scale);
scale_g = min(scale_g, max_scale);
scale_b = min(scale_b, max_scale);

% Apply scaling
result = image;
result(:,:,1) = min(r * scale_r, 1);
result(:,:,2) = min(g * scale_g, 1);
result(:,:,3) = min(b * scale_b, 1);
end

