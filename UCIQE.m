function [ uciqe_value ] = UCIQE(image)
% Underwater Color Image Quality Evaluation
image = im2double(image);

% Convert to CIELab
lab = rgb2lab(image);
L = lab(:,:,1);
a = lab(:,:,2);
b = lab(:,:,3);

% Chroma
chroma = sqrt(a.^2 + b.^2);

% Standard deviations
sigma_c = std(chroma(:));
sigma_l = std(L(:));

% Saturation
saturation = chroma ./ (sqrt(a.^2 + b.^2 + L.^2) + eps);
avg_sat = mean(saturation(:));

% UCIQE formula
c1 = 0.4680; c2 = 0.2745; c3 = 0.2576;
uciqe_value = c1 * sigma_c + c2 * sigma_l + c3 * avg_sat;
end

