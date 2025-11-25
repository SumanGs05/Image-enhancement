function [ uiqm_value ] = UIQM(image)


image = im2double(image);

% 1. Colorfulness (UICM)
r = image(:,:,1);
g = image(:,:,2);
b = image(:,:,3);
rg = r - g;
yb = (r + g) / 2 - b;
uicm = sqrt(mean(rg(:))^2 + mean(yb(:))^2) + 0.3 * sqrt(var(rg(:)) + var(yb(:)));

% 2. Sharpness (UISM)
gray = rgb2gray(image);
sobelX = [-1 0 1; -2 0 2; -1 0 1];
sobelY = sobelX';
edgeX = imfilter(gray, sobelX, 'replicate');
edgeY = imfilter(gray, sobelY, 'replicate');
uism = mean(sqrt(edgeX(:).^2 + edgeY(:).^2));

% 3. Contrast (UIConM)
gray_log = log(gray + 1);
uiconm = std(gray_log(:));

% Weighted combination
c1 = 0.0282; c2 = 0.2953; c3 = 3.5753;
uiqm_value = c1 * uicm + c2 * uism + c3 * uiconm;
end

